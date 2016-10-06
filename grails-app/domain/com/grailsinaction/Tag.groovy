package com.grailsinaction

class Tag {

    String name
    //User user
    SecUser secUser
    static constraints = {
        name blank: false
    }
    static hasMany = [ posts : Post ]
    //static belongsTo = [ User, Post ]
    static belongsTo = [ SecUser, Post ]
}
