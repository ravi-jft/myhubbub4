package com.grailsinaction

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.Validateable

@Secured(['permitAll'])
@Validateable
class PhotoUploadCommand {
    String username
    byte[] photo
    String type
}
