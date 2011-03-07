require 'josso_agent.rb'

module Main
  APP_CONFIG = YAML.load_file(::Rails.root.join('config/josso_config.yml'))[RAILS_ENV]
  
  # Implements the static method for who
  # will be extended with this JossoRorAgent Module
  def self.included(base_class)
    base_class.extend(ClassMethods)
  end

  # All the methods In this subModule JossoRorAgent::ClassMethods are static methods for the extended target.
  module ClassMethods
    # PlugIn entry
    def inject_josso_agent
      before_filter :authorize
    end
  end

  private
  # Check the user's authority
  def authorize
    begin
      partner_application_entry_url = request.url if partner_application_entry_url.nil? 
      if (session[:username].nil?)
        login(partner_application_entry_url, params[:josso_assertion_id])
      else
        is_josso_session_expire(partner_application_entry_url)
      end
    end
  end
  
  def josso_agent
    Jossoagent.new(APP_CONFIG['josso_root'] + 'services/SSOIdentityManager', APP_CONFIG['josso_root'] + 'services/SSOIdentityProvider')
  end

  def login(partner_application_entry_url, josso_assertion_id)
    logger.debug("Partner App URL: " + partner_application_entry_url)
    begin
      if (josso_assertion_id.nil?)
        redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
      else
        jossoagent = josso_agent
        josso_session_id = jossoagent.get_josso_session_id(josso_assertion_id)
        logger.info("josso_session_id: #{josso_session_id}")
        if (josso_session_id.nil?)
          logger.error "josso_session_id is Nil!"
          reset_session
          redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
          # login_error('Sorry! Generate josso_session_id error.')
          return false
        end
        session[:josso_session_id] = josso_session_id
        sso_user = jossoagent.find_user_in_session(josso_session_id)
        logger.info("SSO User Name: "+sso_user.name)
        logger.info("SSO User security domain: "+sso_user.securitydomain)

        sso_user.properties.each do |k,v|
          nvp = k
          logger.info("#{nvp.name}=>#{nvp.value}")
        end
        
        if (sso_user.nil?)
          logger.error("Nil SSO user")
          reset_session
          redirect_to APP_CONFIG['josso_root'] + "signon/login.do?josso_back_to=" + partner_application_entry_url
          # login_error('Sorry! Fetching sso_user error.')
          return false
        else
          session[:username] = sso_user.name
          session[:session_timer_at] = Time.now.to_i
        end
        redirect_to partner_application_entry_url
      end
    rescue Exception => e
      # Let the client deal with this for now; otherwise it gets into a bad state
      raise e
    end
  end

  # Judge the expiry of the session
  def is_josso_session_expire(partner_application_entry_url)
    begin
      puts 30.minutes.to_i
      if(((Time.now.to_i - session[:session_timer_at].to_i) > 1800))
        logout()
      else
        session[:session_timer_at] = Time.now.to_i
      end
    end
  end

  # Logout from the Josso
  def logout()
    begin
      if(!session[:josso_session_id].nil?)
        jossoagent = Jossoagent.new(APP_CONFIG['josso_root'] + 'services/SSOIdentityManager', APP_CONFIG['josso_root'] + 'services/SSOIdentityProvider')
        jossoagent.logout(session[:josso_session_id])
      end
    rescue Exception => e
      puts e
    ensure
      #redirect to unique error page of rece system
      reset_session
      redirect_to APP_CONFIG['partner_application_entry_url'] || '/'
    end
  end

  def login_error(error_message)
    flash[:error_login] = error_message
    @redirect_to_url = APP_CONFIG['josso_root'] + 'signon/login.do'
  end
end
