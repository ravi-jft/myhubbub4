
<%@ page import="com.grailsinaction.Group1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'group1.label', default: 'Group1')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-group1" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-group1" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="groupName" title="${message(code: 'group1.groupName.label', default: 'Group Name')}" />
					
						<th><g:message code="group1.secUser.label" default="Sec User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${group1InstanceList}" status="i" var="group1Instance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${group1Instance.id}">${fieldValue(bean: group1Instance, field: "groupName")}</g:link></td>
					
						<td>${fieldValue(bean: group1Instance, field: "secUser")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${group1InstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
