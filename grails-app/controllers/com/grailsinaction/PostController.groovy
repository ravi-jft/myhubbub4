package com.grailsinaction

import org.springframework.security.access.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@grails.plugin.springsecurity.annotation.Secured(['permitAll'])
class PostController {
def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    static defaultAction = "timeline"
    def postService  //inject Service

     def home(){}

    def timeline() {
        print "I am in timeline"
        /* SecUser secUser1=springSecurityService.currentUser as SecUser
        def secUser = SecUser.findByUsername(params.userName)*/
        SecUser secUser = springSecurityService.getCurrentUser();
        [secUser: secUser]
        if (!secUser) {
            response.sendError(404)
        } else {
            [secUser: secUser]
        }
    }

    //addPost with service
    def addPost(String username,String content){
        try {
            def newPost = postService.createPost(username, content)
            flash.message = "Added new post: ${newPost.content}"
        } catch (PostException ex) {
            flash.message = ex.message
        }
        redirect(action: 'timeline', username:username)
    }

    //Add posts action
  /*  def addPost() {
       *//* def secUser = SecUser.findByUsername(params.userName)*//*
        SecUser secUser = springSecurityService.getCurrentUser();
        [secUser: secUser]
        if (secUser) {
            def post = new Post(params)
            post.secUser=secUser
            post.save(flush: true,failOnError: true)

            if (secUser.save()) {
                flash.message = "Successfully created Post"
            } else {
                flash.message = "Invalid or empty post"
            }
        } else {
            flash.message = "Invalid User Name"
        }
         redirect(action: 'timeline', username: secUser)
    }*/

    def global(){
        [posts:Post.list(params),postCount:Post.count()]
    }
  /*  def global(){}*/


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Post.list(params), model: [postInstanceCount: Post.count()]
        //redirect(action: 'timeline')
    }

    def show(Post postInstance) {
        respond postInstance
    }

    def create() {
        respond new Post(params)
    }

    @Transactional
    def save(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'create'
            return
        }

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), postInstance.id])
                redirect postInstance
            }
            '*' { respond postInstance, [status: CREATED] }
        }
    }

    def edit(Post postInstance) {
        respond postInstance
    }

    @Transactional
    def update(Post postInstance) {
        if (postInstance == null) {
            notFound()
            return
        }

        if (postInstance.hasErrors()) {
            respond postInstance.errors, view: 'edit'
            return
        }

        postInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect postInstance
            }
            '*' { respond postInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Post postInstance) {

        if (postInstance == null) {
            notFound()
            return
        }

        postInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Post.label', default: 'Post'), postInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
