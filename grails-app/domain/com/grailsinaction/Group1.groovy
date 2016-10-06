package com.grailsinaction

class Group1 {

    SecUser createBy
    String groupName
    static hasMany = [createBy:SecUser]
    static belongsTo = [SecUser]

    static constraints = {
        groupName blank: false
    }
}
