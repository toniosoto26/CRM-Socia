<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<c:choose>
	<c:when test="${sessionScope.arrBusinessLine != null}">
		<ul>
			<c:forEach items="${sessionScope.arrBusinessLine}" var="varBusinessLine">
				<li><c:out value="${varBusinessLine.name}"></c:out></li>
			</c:forEach>
		</ul>
	</c:when>
	<c:otherwise>
		<label class="col-sm-6 col-md-6">No hay líneas de negocio por mostrar</label>
	</c:otherwise>
</c:choose>