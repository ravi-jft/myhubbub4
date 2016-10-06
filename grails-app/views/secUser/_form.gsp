<%@ page import="com.grailsinaction.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'homepage', 'error')} ">
	<label for="homepage">
		<g:message code="secUser.homepage.label" default="Homepage" />
		
	</label>
	<g:field type="url" name="homepage" value="${secUserInstance?.homepage}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'profile', 'error')} ">
	<label for="profile">
		<g:message code="secUser.profile.label" default="Profile" />
		
	</label>
	<g:select id="profile" name="profile.id" from="${com.grailsinaction.Profile.list()}" optionKey="id" value="${secUserInstance?.profile?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'following', 'error')} ">
	<label for="following">
		<g:message code="secUser.following.label" default="Following" />
		
	</label>
	<g:select name="following" from="${com.grailsinaction.SecUser.list()}" multiple="multiple" optionKey="id" size="5" value="${secUserInstance?.following*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="secUser.posts.label" default="Posts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${secUserInstance?.posts?}" var="p">
    <li><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="post" action="create" params="['secUser.id': secUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'post.label', default: 'Post')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="secUser.tags.label" default="Tags" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${secUserInstance?.tags?}" var="t">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tag" action="create" params="['secUser.id': secUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tag.label', default: 'Tag')])}</g:link>
</li>
</ul>

	%{--SignUP button--}%
li class="add">
<g:link controller="login" action="create" params="['secUser.id': secUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'login.label', default: 'Login')])}</g:link>
</li>



</div>

