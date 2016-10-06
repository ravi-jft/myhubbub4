package com.grailsinaction

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.Validateable
import org.apache.ivy.core.settings.Validatable
import org.fusesource.jansi.AnsiRenderer

@Secured(['permitAll'])
@Validateable
class ImageController {
    def upload(PhotoUploadCommand puc) {

        def secUser = SecUser.findByUsername(puc.username)
        def file=request.getFile('photo')

        puc.photo=file.bytes
        puc.type=file.contentType

        secUser.profile.photo=puc.photo
        secUser.profile.type=puc.type
        //secUser.profile.=file.contentType
        secUser.save(flush: true)
        render(view: '../secUser/profile',model: [secUser:secUser])
    }



    def form() {
        [ secUserList : SecUser.list() ]
    }

    def renderImage(){
        def secUser=SecUser.get(params.id)
        if (secUser?.profile?.photo) {
            //response.contentType=secUser.profile.type
            response.contentLength=secUser.profile.photo.size()
            OutputStream out = response.outputStream
            out.write(secUser.profile.photo)
            out.close()
        } else {
            response.sendError(404)
        }
    }

    def index() {
        redirect(action: "form")
    }
}
