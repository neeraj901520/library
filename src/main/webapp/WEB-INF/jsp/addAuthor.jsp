<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Author</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Add Author</h1>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/authors/add" method="post">
        <label>Name</label>
        <input type="text" name="name" required />
        <label>Email</label>
        <input type="email" name="email" required />
        <button type="submit">Save</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/authors">Back to list</a></p>
</div>
</body>
</html>
