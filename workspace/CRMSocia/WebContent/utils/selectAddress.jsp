<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<select data-placeholder="Selecciona la dirección" class="chosen-select" id="address-select" name="addressId" tabindex="-1">
	<option></option>
	<c:forEach items="${sessionScope.arrAddress}" var="varAddress">
		<option value='<c:out value="${varAddress.addressId}"></c:out>'><c:out value="${varAddress.street}"></c:out> Num. <c:out value="${varAddress.extNum}"></c:out> Int. <c:out value="${varAddress.intNum}"> <c:out value="${varAddress.suburb}"></c:out></c:out></option>
	</c:forEach>
</select>
    