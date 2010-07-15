require 'sso_identity_manager.rb' 
require 'sso_identity_provider.rb'

class Jossoagent
  
  def initialize(sso_identity_manager_endpoint_url = nil,sso_identity_provider_endpoint_url = nil)
    @agent_identity_manager = SSOIdentityManager.new(sso_identity_manager_endpoint_url)
    @sso_identity_provider = SSOIdentityProvider.new(sso_identity_provider_endpoint_url)

    after_initialize()
  end


  def after_initialize
  end

#  def find_roles_by_username(username)
#    @agent_identity_manager.findRolesByUsername(username)
#  end
#
#  def find_user(username)
#    begin
#      @roles = @agent_identity_manager.findUser(username)
#    rescue SOAP::FaultError
#      return nil
#    else
#      return @roles
#    end
#  end
  
  def find_user_in_session(josso_session_id)
    begin
      req = FindUserInSessionRequestType.new josso_session_id
      resp = @agent_identity_manager.findUserInSession(req)
      @sso_user = resp.sSOUser
    rescue SOAP::FaultError
      return nil
    else
      return @sso_user
    end
  end

  def get_josso_session_id(josso_assertionid)
    begin
      req = ResolveAuthenticationAssertionRequestType.new(josso_assertionid)
      result = @sso_identity_provider.resolveAuthenticationAssertion(req)
      @josso_session_id = result.ssoSessionId
      @josso_security_domain = result.securityDomain
      return  @josso_session_id
    rescue SOAP::FaultError => e
      puts e.inspect
      return nil
    end
  end
  
  def logout(josso_session_id)
    req = GlobalSignoffRequestType.new josso_session_id
    @sso_identity_provider.globalSignoff(req)
  end
  
end
