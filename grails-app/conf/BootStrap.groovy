import no.miles.bucket.Role
import no.miles.bucket.User

class BootStrap {

  def init = {servletContext ->
    def roleVoter = new Role(authority: "ROLE_VOTER", description: "De som har lov til å stemme")
    roleVoter.save()

    def user = new User(username: "test", description: "test, test", passwd: "098f6bcd4621d373cade4e832627b4f6",
            email: "test@test.com", emailShow: true, userRealName: "Test Testesen", enabled: true)
    user.save()
    
    Role.findByAuthority("ROLE_VOTER").addToPeople(user)
  }

  def destroy = {
  }
} 