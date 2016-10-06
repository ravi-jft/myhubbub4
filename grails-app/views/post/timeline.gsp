<%--
  Created by IntelliJ IDEA.
  User: ravi
  Date: 26/9/16
  Time: 12:55 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        Timeline for ${ secUser.profile ? secUser.profile.fullName :
                secUser.username }
    </title>
    <meta name="layout" content="main"/>
</head>
<body>
<h1>Timeline for ${ secUser.profile ? secUser.profile.fullName :
        secUser.username }</h1>
<g:if test="${flash.message}">
    <div class="flash">
        ${flash.message}
    </div>
</g:if>

Add new posts
<div id="newPost">
    <h3>
        What is ${secUser.profile.fullName} hacking on right now? %{--${request.headerNames.each { println (it) }}--}%
        <br><br>
     %{--   ${request.getHeaderNames().each {
            println(it+":"+request.getHeader(it))
        }
        }}--}%
    </h3>
    <p>
        %{--<g:form action="addPost" userName="${params.userName}">--}%
        <g:form action="addPost">
            <g:textArea id='postContent' name="content"
                        rows="3" cols="50"/><br/>
            <g:submitButton name="post" value="Post"/>
        </g:form>
    </p>
</div>

%{--show posts--}%%{--
<hub:certainBrowser userAgent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0 ">--}%
<div id="allPosts">
    ${request.remoteUser}
    <g:each in="${secUser.posts}" var="post">
        <div class="postEntry">
            <div class="postText">
                ${post.content}
            </div>
            <div class="postDate">
                %{--${post.dateCreated}--}%
                <hub:dateFromNow date="${post.dateCreated}"/>
            </div>
        </div>
    </g:each>
%{--    </hub:certainBrowser>--}%
</div>
</body>
</html>