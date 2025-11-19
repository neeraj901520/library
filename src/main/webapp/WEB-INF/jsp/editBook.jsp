<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Edit Book</h1>
    <form action="${pageContext.request.contextPath}/books/edit" method="post">
        <input type="hidden" name="id" value="${book.id}" />
        <label>Title</label>
        <input type="text" name="title" value="${book.title}" required />
        <label>ISBN</label>
        <input type="text" name="isbn" value="${book.isbn}" required />
        <label>Author</label>
        <select name="author.id">
            <option value="">--select--</option>
            <c:forEach items="${authors}" var="a">
                <option value="${a.id}">
                    <c:if test="${book.author != null and a.id == book.author.id}">
                        <c:set var="sel">selected</c:set>
                    </c:if>
                    ${a.name}
                </option>
            </c:forEach>
        </select>
        <button type="submit">Update</button>
    </form>
    <p><a href="${pageContext.request.contextPath}/books">Back to list</a></p>
</div>
</body>
</html>
