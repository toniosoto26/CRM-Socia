<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccione el area" id="chosenDivision" class="chosen-select" tabindex="-1" name="idDivision">
	<option value="0">--Selecciona un Area--</option>
	<c:forEach items="${sessionScope.arrDivision}" var="varDivision">
		<option value='<c:out value="${ varDivision.company_division_id }"></c:out>'><c:out value="${ varDivision.name_division }"></c:out></option>
	</c:forEach>
</select>
    