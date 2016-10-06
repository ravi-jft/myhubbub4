package com.grailsinaction

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class SecUser implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	String homepage
	Date dateCreated
	static hasOne = [ profile : Profile ]
	static hasMany = [posts:Post,tags:Tag,following:SecUser,groups:Group1]


	SecUser(String username, String password,String homepage,Date dateCreated) {
		this()
		this.username = username
		this.password = password
		this.homepage=homepage
		this.dateCreated=dateCreated
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this)*.secRole
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
		homepage url: true, nullable: true
		dateCreated nullable: true
		profile nullable: true
	}

	static mapping = {
		password column: '`password`'
	}
}
