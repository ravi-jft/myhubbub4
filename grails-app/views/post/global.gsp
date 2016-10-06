<%--
  Created by IntelliJ IDEA.
  User: ravi
  Date: 30/9/16
  Time: 2:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Show all posts</title>
</head>

<body>
<g:paginate total="${postCount}" max="2" action="global"/>
</body>
</html>