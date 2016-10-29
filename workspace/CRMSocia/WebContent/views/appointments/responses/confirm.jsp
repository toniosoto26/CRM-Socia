<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<c:choose>
	<c:when test="${sessionScope.stat != false }">
		Se registro un cita con: <c:out value="${sessionScope.nombre}"></c:out>		
	</c:when>
	<c:otherwise>
		Error al insertar la cita con: <c:out value="${sessionScope.nombre}"></c:out>
	</c:otherwise>	
</c:choose>    
