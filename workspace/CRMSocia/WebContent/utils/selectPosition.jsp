<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccione el puesto" id="chosenPosition" class="chosen-select" tabindex="-1" name="idPosition">
	<option value="0">--Selecciona un Puesto--</option>
	<c:forEach items="${sessionScope.arrPosition}" var="varPosition">
		<option value='<c:out value="${ varPosition.id_position }"></c:out>'><c:out value="${ varPosition.position }"></c:out></option>
	</c:forEach>
</select>
    