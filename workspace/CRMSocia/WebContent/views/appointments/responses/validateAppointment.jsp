<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<c:choose>
	<c:when test="${sessionScope.exists == 'true' }">
		Ya existe una cita programada con: 
		<c:forEach items="${arrInfoC}" var="info">
			<c:out value="${info}"></c:out>,
		</c:forEach>
		¿Quiere agendar otra cita?
	</c:when>
	<c:otherwise>
			
	</c:otherwise>
</c:choose>