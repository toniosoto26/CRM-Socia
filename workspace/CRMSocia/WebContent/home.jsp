<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>home</title>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.userExists == 'true'}">
		Bienvenido <c:out value="${sessionScope.user}" ></c:out>
	</c:when>
	<c:otherwise>
		Usuario no encontrado.
	</c:otherwise>
</c:choose>
</body>
</html>