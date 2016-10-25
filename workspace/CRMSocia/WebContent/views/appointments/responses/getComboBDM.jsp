<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccion el cliente"  class="chosen-select" tabindex="-1" >
	<option value="0">Seleccionar...</option>
	<c:forEach items="${sessionScope.arrBDM}" var="bdm">
		<option value='<c:out value="${bdm.email}"></c:out>'><c:out value="${bdm.firstName}"></c:out> <c:out value="${bdm.lastName}"></c:out></option>
	</c:forEach>
</select>
    