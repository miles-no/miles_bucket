package no.miles.bucket

import org.springframework.security.context.SecurityContext
import org.springframework.security.context.SecurityContextHolder

/**
 * Created by kjerstibb
 * TODO: Add documentation.
 */

public class UserService {

  def getCurrentUser() {
    SecurityContext securityContext = SecurityContextHolder.getContext();
    def springUser = securityContext.getAuthentication().getPrincipal();
    if (springUser.respondsTo("getDomainClass")) {
      return springUser.getDomainClass()
    } else {
      return null;
    }
  }

}