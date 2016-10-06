<%--
  Created by IntelliJ IDEA.
  User: ravi
  Date: 28/9/16
  Time: 5:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upload Image</title>
    <meta name="layout" content="main">
</head>
<body>
<h1>Upload an image</h1>
<g:uploadForm action="upload">
    User Name:
    <g:select name="username" from="${secUserList}"
              optionKey="username" optionValue="username" />
    <p/>
    Photo: <input name="photo" type="file" />
    <g:submitButton name="upload" value="Upload"/>
</g:uploadForm>
</body>
</html>