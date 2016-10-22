<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccion el cliente" id="chosenClient" class="chosen-select" tabindex="-1" name="clientId" onChange="loadClientInfo(this);loadAddressInfo(this);">
	<option value="5">--Selecciona Cliente--</option>
	<c:forEach items="${sessionScope.arrClient}" var="varClient">
		<option value='<c:out value="${varClient.clientId}"></c:out>'><c:out value="${varClient.companyName}"></c:out></option>
	</c:forEach>
</select>
    