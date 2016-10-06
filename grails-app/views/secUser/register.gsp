<%--
  Created by IntelliJ IDEA.
  User: ravi
  Date: 28/9/16
  Time: 1:01 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register New User</title>
    <meta name="layout" content="main"/>
</head>
<body>
<h1>Register New User</h1>
<g:hasErrors>
    <div class="errors">
        <g:renderErrors bean="${secUser}" as="list" />
    </div>
</g:hasErrors>
<g:if test="${flash.message}">
    <div class="flash">${flash.message}</div>
</g:if>
<g:form action="register">
    <fieldset class="form">
        <div class="fieldcontain required">
            <label for="username">User Name</label>
            <g:textField name="username" value="${secUser?.username}"/>
        </div>
        <div class="fieldcontain required">
            <label for="password">Password</label>
            <g:passwordField name="password" value="${secUser?.password}"/>
        </div>
        <div class="fieldcontain required">
            <label for="profile.fullName">Full Name</label>
            <g:textField name="profile.fullName"
                         value="${secUser?.profile?.fullName}"/>
        </div>
        <div class="fieldcontain required">
            <label for="profile.bio">Bio</label>
            <g:textArea name="profile.bio"
                        value="${secUser?.profile?.bio}"/>
        </div>
        <div class="fieldcontain required">
            <label for="profile.email">Email</label>
            <g:textField name="profile.email"
                         value="${secUser?.profile?.email}"/>
        </div>
    </fieldset>
    <fieldset class="buttons">
        <g:submitButton name="register" value="Register"/>
    </fieldset>
</g:form>
</body>
</html>