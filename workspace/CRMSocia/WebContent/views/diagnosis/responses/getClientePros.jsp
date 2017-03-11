<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<select data-placeholder="Seleccion el cliente" id="selectProspD_" class="chosen-select" tabindex="-1" name="selectProspD_" onChange="getDiagnosis(this.value, '<c:out value="${clientTypeP}"></c:out>')">
	<option value="0">--Selecciona Cliente--</option>
	<c:forEach items="${sessionScope.arrClientP}" var="varClient">
		<option value='<c:out value="${varClient.clientId}"></c:out>'><c:out value="${varClient.companyName}"></c:out></option>
	</c:forEach>
</select>
