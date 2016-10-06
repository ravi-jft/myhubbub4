package com.grailsinaction

class Post {

    String content
    Date dateCreated
    static constraints = {
        content blank: false
    }
   // static belongsTo = [ user : User ]
    static belongsTo = [ secUser : SecUser ]
    static hasMany = [tags:Tag]
    static mapping = {
        sort dateCreated:"desc"
    }
}
