import com.grailsinaction.SecUser
import com.grailsinaction.SecRole
import com.grailsinaction.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
        if(!SecRole.findByAuthority("ROLE_ADMIN")) {
            new SecRole(authority: "ROLE_ADMIN").save(flush: true)
        }
        if(SecUser.list().size() == 0) {
            SecUser secUser = new SecUser(username: "test" , password: "123456")
            secUser.save(flush: true)
            SecUserSecRole secUserSecRole = new SecUserSecRole(secUser: secUser , secRole: SecRole.findByAuthority("ROLE_ADMIN"))
            secUserSecRole.save(flush: true)

        }
    }
    def destroy = {
    }
}
