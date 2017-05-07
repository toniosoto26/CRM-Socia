<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<c:choose>
	<c:when test="${sessionScope.stat != false }">
		El contacto se modifico correctamente.		
	</c:when>
	<c:otherwise>
		Error al modifcar contacto, intentarlo de nuevo.
	</c:otherwise>	
</c:choose>    
