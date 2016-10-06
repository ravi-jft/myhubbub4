<%@ page import="com.grailsinaction.Group1" %>



<div class="fieldcontain ${hasErrors(bean: group1Instance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="group1.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${group1Instance?.groupName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: group1Instance, field: 'secUser', 'error')} required">
	<label for="secUser">
		<g:message code="group1.secUser.label" default="Sec User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUser" name="secUser.id" from="${com.grailsinaction.SecUser.list()}" optionKey="id" required="" value="${group1Instance?.secUser?.id}" class="many-to-one"/>

</div>

