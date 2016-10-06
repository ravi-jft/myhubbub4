package com.grailsinaction

class UtilTagLib {
    static namespace = "hub"
    static defaultEncodeAs = [taglib: 'html']
    def certainBrowser = { attrs,body ->
        if (request.getHeader('User-Agent') =~ attrs.userAgent ){
            out << body()
        }
    }
}
