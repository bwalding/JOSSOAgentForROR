require 'soap/mapping'
require 'josso_classes.rb'

module JossoMappingRegistry
  silence_warnings {
    EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
    LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
    NsProtocol = "http://josso.org/gateway/ws/1.1/protocol"
  }

  EncodedRegistry.register(
    :class => ResolveAuthenticationAssertionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionRequestType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => ResolveAuthenticationAssertionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"],
      ["securityDomain", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"],
      ["password", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationResponseType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => GlobalSignoffRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "GlobalSignoffRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => GlobalSignoffResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "GlobalSignoffResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => SSOIdentityProviderErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOIdentityProviderErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => AssertionNotValidErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertionNotValidErrorType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => FindUserInSessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSessionRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => FindUserInSessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSessionResponseType"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  EncodedRegistry.register(
    :class => FindUserInSecurityDomainRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => FindUserInSecurityDomainResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainResponseType"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  EncodedRegistry.register(
    :class => FindRolesBySSOSessionIdRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => FindRolesBySSOSessionIdResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdResponseType"),
    :schema_element => [
      ["username", "SOAP::SOAPString"],
      ["roles", "ArrayOfSSORoleType"]
    ]
  )

  EncodedRegistry.register(
    :class => UserExistsRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "UserExistsRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => UserExistsResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "UserExistsResponseType"),
    :schema_element => [
      ["userexists", "SOAP::SOAPBoolean"]
    ]
  )

  EncodedRegistry.register(
    :class => SSOIdentityManagerErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOIdentityManagerErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => NoSuchUserErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "NoSuchUserErrorType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => InvalidSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "InvalidSessionErrorType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => AccessSessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "AccessSessionRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => AccessSessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "AccessSessionResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => SessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "SessionRequestType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => SessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "SessionResponseType"),
    :schema_element => [
      ["sSOSession", ["SSOSessionType", XSD::QName.new(NsProtocol, "SSOSession")]]
    ]
  )

  EncodedRegistry.register(
    :class => SSOSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOSessionErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => NoSuchSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "NoSuchSessionErrorType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.register(
    :class => SSOSessionType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOSessionType"),
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["creationTime", "SOAP::SOAPLong"],
      ["lastAccessTime", "SOAP::SOAPLong"],
      ["maxInactiveInterval", "SOAP::SOAPInt"],
      ["username", "SOAP::SOAPString"],
      ["accessCount", "SOAP::SOAPLong"]
    ]
  )

  EncodedRegistry.register(
    :class => SSOUserType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOUserType"),
    :schema_element => [
      ["properties", "ArrayOfSSONameValuePairType"],
      ["name", "SOAP::SOAPString"],
      ["securitydomain", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.set(
    ArrayOfSSORoleType,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsProtocol, "SSORoleType") }
  )

  EncodedRegistry.register(
    :class => SSORoleType,
    :schema_type => XSD::QName.new(NsProtocol, "SSORoleType"),
    :schema_element => [
      ["name", "SOAP::SOAPString"]
    ]
  )

  EncodedRegistry.set(
    ArrayOfSSONameValuePairType,
    ::SOAP::SOAPArray,
    ::SOAP::Mapping::EncodedRegistry::TypedArrayFactory,
    { :type => XSD::QName.new(NsProtocol, "SSONameValuePairType") }
  )

  EncodedRegistry.register(
    :class => SSONameValuePairType,
    :schema_type => XSD::QName.new(NsProtocol, "SSONameValuePairType"),
    :schema_element => [
      ["name", "SOAP::SOAPString"],
      ["value", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => ResolveAuthenticationAssertionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionRequestType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => ResolveAuthenticationAssertionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"],
      ["securityDomain", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"],
      ["password", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationResponseType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GlobalSignoffRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "GlobalSignoffRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GlobalSignoffResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "GlobalSignoffResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOIdentityProviderErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOIdentityProviderErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertionNotValidErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "AssertionNotValidErrorType"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSessionRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSessionResponseType"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSecurityDomainRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSecurityDomainResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainResponseType"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  LiteralRegistry.register(
    :class => FindRolesBySSOSessionIdRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindRolesBySSOSessionIdResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdResponseType"),
    :schema_element => [
      ["username", "SOAP::SOAPString"],
      ["roles", "ArrayOfSSORoleType"]
    ]
  )

  LiteralRegistry.register(
    :class => UserExistsRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "UserExistsRequestType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => UserExistsResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "UserExistsResponseType"),
    :schema_element => [
      ["userexists", "SOAP::SOAPBoolean"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOIdentityManagerErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOIdentityManagerErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => NoSuchUserErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "NoSuchUserErrorType"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => InvalidSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "InvalidSessionErrorType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AccessSessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "AccessSessionRequestType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AccessSessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "AccessSessionResponseType"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SessionRequestType,
    :schema_type => XSD::QName.new(NsProtocol, "SessionRequestType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SessionResponseType,
    :schema_type => XSD::QName.new(NsProtocol, "SessionResponseType"),
    :schema_element => [
      ["sSOSession", ["SSOSessionType", XSD::QName.new(NsProtocol, "SSOSession")]]
    ]
  )

  LiteralRegistry.register(
    :class => SSOSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOSessionErrorType"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => NoSuchSessionErrorType,
    :schema_type => XSD::QName.new(NsProtocol, "NoSuchSessionErrorType"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOSessionType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOSessionType"),
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["creationTime", "SOAP::SOAPLong"],
      ["lastAccessTime", "SOAP::SOAPLong"],
      ["maxInactiveInterval", "SOAP::SOAPInt"],
      ["username", "SOAP::SOAPString"],
      ["accessCount", "SOAP::SOAPLong"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOUserType,
    :schema_type => XSD::QName.new(NsProtocol, "SSOUserType"),
    :schema_element => [
      ["properties", "ArrayOfSSONameValuePairType"],
      ["name", "SOAP::SOAPString"],
      ["securitydomain", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSORoleType,
    :schema_type => XSD::QName.new(NsProtocol, "SSORoleType"),
    :schema_element => [
      ["name", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSONameValuePairType,
    :schema_type => XSD::QName.new(NsProtocol, "SSONameValuePairType"),
    :schema_element => [
      ["name", "SOAP::SOAPString"],
      ["value", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => ResolveAuthenticationAssertionRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionRequest"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => ResolveAuthenticationAssertionResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "ResolveAuthenticationAssertionResponse"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"],
      ["securityDomain", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationRequest"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"],
      ["password", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertIdentityWithSimpleAuthenticationResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "AssertIdentityWithSimpleAuthenticationResponse"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GlobalSignoffRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "GlobalSignoffRequest"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GlobalSignoffResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "GlobalSignoffResponse"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOIdentityProviderErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "SSOIdentityProviderError"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AssertionNotValidErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "AssertionNotValidError"),
    :schema_element => [
      ["assertionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSessionRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "FindUserInSessionRequest"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSessionResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "FindUserInSessionResponse"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSecurityDomainRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainRequest"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindUserInSecurityDomainResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "FindUserInSecurityDomainResponse"),
    :schema_element => [
      ["sSOUser", ["SSOUserType", XSD::QName.new(NsProtocol, "SSOUser")]]
    ]
  )

  LiteralRegistry.register(
    :class => FindRolesBySSOSessionIdRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdRequest"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => FindRolesBySSOSessionIdResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "FindRolesBySSOSessionIdResponse"),
    :schema_element => [
      ["username", "SOAP::SOAPString"],
      ["roles", "ArrayOfSSORoleType"]
    ]
  )

  LiteralRegistry.register(
    :class => UserExistsRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "UserExistsRequest"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => UserExistsResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "UserExistsResponse"),
    :schema_element => [
      ["userexists", "SOAP::SOAPBoolean"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOIdentityManagerErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "SSOIdentityManagerError"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => NoSuchUserErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "NoSuchUserError"),
    :schema_element => [
      ["securityDomain", "SOAP::SOAPString"],
      ["username", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => InvalidSessionErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "InvalidSessionError"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AccessSessionRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "AccessSessionRequest"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => AccessSessionResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "AccessSessionResponse"),
    :schema_element => [
      ["ssoSessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SessionRequestType,
    :schema_name => XSD::QName.new(NsProtocol, "SessionRequest"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SessionResponseType,
    :schema_name => XSD::QName.new(NsProtocol, "SessionResponse"),
    :schema_element => [
      ["sSOSession", ["SSOSessionType", XSD::QName.new(NsProtocol, "SSOSession")]]
    ]
  )

  LiteralRegistry.register(
    :class => SSOSessionErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "SSOSessionError"),
    :schema_element => [
      ["errMessage", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => NoSuchSessionErrorType,
    :schema_name => XSD::QName.new(NsProtocol, "NoSuchSessionError"),
    :schema_element => [
      ["sessionId", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOSessionType,
    :schema_name => XSD::QName.new(NsProtocol, "SSOSession"),
    :schema_element => [
      ["id", "SOAP::SOAPString"],
      ["creationTime", "SOAP::SOAPLong"],
      ["lastAccessTime", "SOAP::SOAPLong"],
      ["maxInactiveInterval", "SOAP::SOAPInt"],
      ["username", "SOAP::SOAPString"],
      ["accessCount", "SOAP::SOAPLong"]
    ]
  )

  LiteralRegistry.register(
    :class => SSOUserType,
    :schema_name => XSD::QName.new(NsProtocol, "SSOUser"),
    :schema_element => [
      ["properties", "ArrayOfSSONameValuePairType"],
      ["name", "SOAP::SOAPString"],
      ["securitydomain", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSORoleType,
    :schema_name => XSD::QName.new(NsProtocol, "SSORole"),
    :schema_element => [
      ["name", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => SSONameValuePairType,
    :schema_name => XSD::QName.new(NsProtocol, "SSONameValuePair"),
    :schema_element => [
      ["name", "SOAP::SOAPString"],
      ["value", "SOAP::SOAPString"]
    ]
  )
end
