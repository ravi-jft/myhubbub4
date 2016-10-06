package com.grailsinaction

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

//@Transactional(readOnly = true)
@Secured(['permitAll'])
class Group1Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static defaultAction = "createGroup"
    def springSecurityService

    def createGroup(){

    }

    def saveGroup(){
        def grp=new Group1(params.groupName)
        //also take current User for saving a username of the group creator
        SecUser secUser=springSecurityService.getCurrentUser()
        def username=secUser.getUsername()
        grp=new Group1(createBy:username )
        grp.save(flush: true) //save username and groupname in group table

        //now save groupname and users in grpUser table
        def grpuser= new GrpUser(params)
        grpuser.save(flush: true)
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Group1.list(params), model: [group1InstanceCount: Group1.count()]
    }

    def show(Group1 group1Instance) {
        respond group1Instance
    }

    def create() {
        respond new Group1(params)
    }

    @Transactional
    def save(Group1 group1Instance) {
        if (group1Instance == null) {
            notFound()
            return
        }

        if (group1Instance.hasErrors()) {
            respond group1Instance.errors, view: 'create'
            return
        }

        group1Instance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'group1.label', default: 'Group1'), group1Instance.id])
                redirect group1Instance
            }
            '*' { respond group1Instance, [status: CREATED] }
        }
    }

    def edit(Group1 group1Instance) {
        respond group1Instance
    }

    @Transactional
    def update(Group1 group1Instance) {
        if (group1Instance == null) {
            notFound()
            return
        }

        if (group1Instance.hasErrors()) {
            respond group1Instance.errors, view: 'edit'
            return
        }

        group1Instance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Group1.label', default: 'Group1'), group1Instance.id])
                redirect group1Instance
            }
            '*' { respond group1Instance, [status: OK] }
        }
    }

    @Transactional
    def delete(Group1 group1Instance) {

        if (group1Instance == null) {
            notFound()
            return
        }

        group1Instance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Group1.label', default: 'Group1'), group1Instance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'group1.label', default: 'Group1'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
