<%@ page import="com.grailsinaction.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tag.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tagInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'posts', 'error')} ">
	<label for="posts">
		<g:message code="tag.posts.label" default="Posts" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="tag.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${com.grailsinaction.SecUser.list()}" optionKey="id" required="" value="${tagInstance?.secUser?.id}" class="many-to-one"/>

</div>

