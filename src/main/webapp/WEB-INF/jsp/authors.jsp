<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Authors</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Authors</h1>
    <a class="btn" href="${pageContext.request.contextPath}/authors/add">Add Author</a>
    <table>
        <thead>
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${authors}" var="a">
            <tr>
                <td>${a.id}</td>
                <td><a href="${pageContext.request.contextPath}/books?authorId=${a.id}">${a.name}</a></td>
                <td>${a.email}</td>
                <td><a href="${pageContext.request.contextPath}/authors/edit/${a.id}">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
