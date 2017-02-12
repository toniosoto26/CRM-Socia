<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:choose>
	<c:when test="${sessionScope.sendMailCalls == true}">
		correcto	
	</c:when>
	<c:otherwise>
		incorrecto
	</c:otherwise>
</c:choose>