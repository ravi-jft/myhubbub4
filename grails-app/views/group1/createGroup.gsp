

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>
<g:form action="saveGroup">
    <label for="groupName">Group Name</label>
    <g:textField name="groupName"></g:textField><br>
    <label for="selectUser">Select User</label>
    <g:select id="type" name="selectUser" from="${com.grailsinaction.SecUser.list()}"
        noSelection="${['null':'Select One...']}"
        optionKey="id" optionValue="username"></g:select>
    <g:submitButton name="save" value="Save"></g:submitButton>
</g:form>
</body>
</html>