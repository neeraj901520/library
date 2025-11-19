<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Add Book</h1>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/books/add" method="post">
        <label>Title</label>
        <input type="text" name="title" required />
        <label>ISBN</label>
        <input type="text" name="isbn" required />
        <label>Author</label>
        <select name="author.id">
            <option value="">--select--</option>
            <c:forEach items="${authors}" var="a">
                <option value="${a.id}">${a.name}</option>
            </c:forEach>
        </select>
        <button type="submit">Save</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/books">Back to list</a></p>
</div>
</body>
</html>
