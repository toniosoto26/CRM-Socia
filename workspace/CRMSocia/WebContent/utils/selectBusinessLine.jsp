<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:choose>
	<c:when test="${sessionScope.arrBusinessLine != null}">
		<select data-placeholder="--Selecciona línea de negocio--" class="chosen-select" id="business-select" name="businessLineId" tabindex="-1">
			<option value=""></option>
			<c:forEach items="${sessionScope.arrBusinessLine}" var="varBusinessLine">
				<option value='<c:out value="${varBusinessLine.businessLineId}"></c:out>'><c:out value="${varBusinessLine.name}"></c:out> </option>
			</c:forEach>
		</select>
	</c:when>
	<c:otherwise>
		<label class="col-sm-6 col-md-6">No hay líneas de negocio por seleccionar</label>
	</c:otherwise>
</c:choose>