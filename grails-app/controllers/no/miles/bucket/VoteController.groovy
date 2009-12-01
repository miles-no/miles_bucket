

package no.miles.bucket

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_VOTER'])
class VoteController {
    
    def scaffold = Vote
}
