<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccion el cliente" id="selectClientD_" class="chosen-select" tabindex="-1" name="selectClientD_" 
onChange="<c:choose><c:when test="${sessionScope.isBoolean == 'true' }">getDiagnosis(this.value, '<c:out value="${clientTypeA}"></c:out>');</c:when><c:otherwise>getFile(this.value, '<c:out value="${clientTypeA}"></c:out>');</c:otherwise></c:choose>">
	<option value="0">--Selecciona Cliente--</option>
	<c:forEach items="${sessionScope.arrClientA}" var="varClient">
		<option value='<c:out value="${varClient.clientId}"></c:out>'><c:out value="${varClient.companyName}"></c:out></option>
	</c:forEach>
</select>
