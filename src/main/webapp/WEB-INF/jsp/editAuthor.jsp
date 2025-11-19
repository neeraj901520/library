<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Author</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Edit Author</h1>
    <form action="${pageContext.request.contextPath}/authors/edit" method="post">
        <input type="hidden" name="id" value="${author.id}" />
        <label>Name</label>
        <input type="text" name="name" value="${author.name}" required />
        <label>Email</label>
        <input type="email" name="email" value="${author.email}" required />
        <button type="submit">Update</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/authors">Back to list</a></p>
</div>
</body>
</html>
