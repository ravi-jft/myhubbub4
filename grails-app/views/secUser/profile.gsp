<%--
  Created by IntelliJ IDEA.
  User: ravi
  Date: 28/9/16
  Time: 5:39 PM
--%>

<%@ page import="org.springsource.loaded.GlobalConfiguration" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class="profilePic">

    <g:if test="${secUser.profile.photo}">
    <img class="photo" src="${createLink(controller: 'image',action: 'renderImage', id: secUser.ident())}">
    </g:if>
    %{--<g:if test="${profile.photo}">
        <img src="${createLink(controller: 'image', action:
               'renderImage', username: profile.secUser.username)}"/>
    </g:if>--}%
    <p>Profile for <strong>${secUser.profile.fullName}</strong></p>
    <p>Bio: ${secUser.profile.bio}</p>
</div>
</body>
</html>