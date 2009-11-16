import no.miles.bucket.User

class BootStrap {

     def init = { servletContext ->

       User newUser = new User();
       newUser.username = 'miles_bruker';
       newUser.save();


     }
     def destroy = {
     }
} 