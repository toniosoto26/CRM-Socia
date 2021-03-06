<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccione el contacto" id="chosenContact<c:out value="${sessionScope.viewName}"></c:out>" value="ContactE" class="chosen-select" tabindex="-1" name="contactId" onChange="loadContactInfo(this);">
	<option value="0">--Selecciona un Contacto--</option>
	<c:forEach items="${sessionScope.arrContact}" var="varContact">
		<option value='<c:out value="${ varContact.contactId }"></c:out>'><c:out value="${ varContact.firstName }"></c:out> <c:out value="${varContact.lastName}"></c:out>-<c:out value="${varContact.position}"></c:out></option>
	</c:forEach>
</select>
    