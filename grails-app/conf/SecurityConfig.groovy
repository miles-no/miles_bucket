security {

  // see DefaultSecurityConfig.groovy for all settable/overridable properties

  active = true

  loginUserDomainClass = "no.miles.bucket.User"
  authorityDomainClass = "no.miles.bucket.Role"
  
  useControllerAnnotations = true
  useRequestMapDomainClass = false


}
