<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div class="container">
    <h1>Books</h1>
    <a class="btn" href="${pageContext.request.contextPath}/books/add">Add Book</a>
    <a class="btn" href="${pageContext.request.contextPath}/authors">Authors</a>
    <c:choose>
        <c:when test="${not empty selectedAuthor}">
            <h2>Books by ${selectedAuthor.name} <a href="${pageContext.request.contextPath}/books" class="btn">All Books</a></h2>
        </c:when>
        <c:otherwise>
            <h2>Book list</h2>
        </c:otherwise>
    </c:choose>
    <table>
        <thead>
        <tr><th>ID</th><th>Title</th><th>ISBN</th><th>Author</th><th>Actions</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${books}" var="b">
            <tr>
                <td>${b.id}</td>
                <td>${b.title}</td>
                <td>${b.isbn}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty b.author}">
                            <a href="${pageContext.request.contextPath}/authors/edit/${b.author.id}">${b.author.name}</a>
                        </c:when>
                        <c:otherwise>N/A</c:otherwise>
                    </c:choose>
                </td>
                <td><a href="${pageContext.request.contextPath}/books/edit/${b.id}">Edit</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h2>Book-Author Join (custom query)</h2>
    <table>
        <thead><tr><th>Book</th><th>Author</th></tr></thead>
        <tbody>
        <c:forEach items="${pairs}" var="p">
            <tr>
                <td>${p.bookTitle}</td>
                <td>${p.authorName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
