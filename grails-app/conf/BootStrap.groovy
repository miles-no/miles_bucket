import no.miles.bucket.Role
import no.miles.bucket.User

class BootStrap {

  def init = {servletContext ->
    def roleVoter = new Role(authority: "ROLE_VOTER", description: "De som har lov til å stemme")
    roleVoter.save()

    def user = new User(username: "test", description: "test, test", passwd: "test",
            email: "test@test.com", emailShow: true, userRealName: "Test Testesen", enabled: true)
    user.save()
    
    Role.findByAuthority("ROLE_VOTER").addToPeople(user)
  }

  def destroy = {
  }
} 