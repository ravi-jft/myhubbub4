<%@ page import="com.grailsinaction.Post" %>



<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="post.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${postInstance?.content}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="post.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${com.grailsinaction.SecUser.list()}" optionKey="id" required="" value="${postInstance?.secUser?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="post.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${com.grailsinaction.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${postInstance?.tags*.id}" class="many-to-many"/>

</div>

