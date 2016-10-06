package com.grailsinaction

import grails.transaction.Transactional

class PostException extends RuntimeException {
    String message
    Post post
}
@Transactional
class PostService {
 def springSecurityService
    Post createPost(String username, String content) {
        SecUser secUser = springSecurityService.getCurrentUser()
        username=secUser.getUsername()
        if (secUser) {
            def post = new Post(content: content)
            secUser.addToPosts(post)
            if (post.validate() && secUser.save()) {
                return post
            } else {
                throw new PostException(
                        message: "Invalid or empty post", post: post)
            }
        }
        throw new PostException(message: "Invalid User name")
    }
}
