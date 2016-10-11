<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccion el cliente" class="chosen-select" tabindex="-1" onChange="loadContactInfo(this);">
	<option value="5">prueba sa de cv</option>
	<c:forEach items="${sessionScope.arrClient}" var="varClient">
		<option value='<c:out value="${varClient.clientId}"></c:out>'><c:out value="${varClient.companyName}"></c:out></option>
	</c:forEach>
	<option value="opcion 2 "> opcion 2 </option>
	<option value="opcion 3 "> opcion 3 </option>
	<option value="opcion 4 "> opcion 4 </option>
</select>
    