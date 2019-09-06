<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Organization CRUD Application</title>

    <!--link type="text/css" rel="stylesheet" href="//{pageContext.request.contextPath}/resources/css/style.css" /-->
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>Organization CRUD Application</h2>
    </div>
</div>

<div id="container">
    <div id="content">

        <input type="button" value="Add Organization"
               onclick="window.location.href='showFormForAdd'; return false;"
               class="add-button"
        />

        <!--  register a search box -->
        <form:form action="search" method="POST">
            Search organization: <input type="text" name="theSearchName" value="${valueSearch}"/>

            <input type="submit" value="Search" class="add-button" />
        </form:form>

        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>IS_government</th>
                <th>government_org</th>
                <th>users</th>
                <th>notifications</th>
                <th>f(x)</th>
            </tr>

            <c:forEach var="tempOrganization" items="${list}">

                <c:url var="updateLink" value="showFormForUpdate">
                    <c:param name="organizationId" value="${tempOrganization.id}"/>
                </c:url>

                <c:url var="deleteLink" value="delete">
                    <c:param name="organizationId" value="${tempOrganization.id}"/>
                </c:url>

                <tr>
                    <td>${tempOrganization.id}</td>
                    <td>${tempOrganization.name}</td>
                    <td>${tempOrganization.government}</td>
                    <td>${tempOrganization.government_org}</td>
                    <td>${tempOrganization.users}</td>
                    <td>${tempOrganization.notifications}</td>
                    <td>
                        <a href="${updateLink}">Update</a>
                        <a href="${deleteLink}" onclick="if (!(confirm('Are you sure?'))) return false">Delete</a>
                        |
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>