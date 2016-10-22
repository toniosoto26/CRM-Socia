<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Seleccione el contacto" id="chosenContact" class="chosen-select" tabindex="-1" name="contactId" onChange="loadContactInfo(this);loadAddressInfo(this);">
	<option value="5">--Selecciona un Contacto--</option>
	<c:forEach items="${sessionScope.arrContact}" var="varContact">
		<option value='<c:out value="${ varContact.contactId }"></c:out>'><c:out value="${ varContact.firstName }"></c:out> <c:out value="${varContact.lastName}"></c:out></option>
	</c:forEach>
</select>
    