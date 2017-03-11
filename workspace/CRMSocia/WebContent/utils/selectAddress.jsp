<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<c:choose>
	<c:when test="${sessionScope.arrAddress != null}">
		<label class="col-sm-4 col-md-4">Dirección</label>
		<select data-placeholder="--Selecciona dirección--" class="chosen-select" id="address-select" name="addressId" tabindex="-1">
			<option value="">--Selecciona dirección--</option>
			<c:forEach items="${sessionScope.arrAddress}" var="varAddress">
				<option value='<c:out value="${varAddress.addressId}"></c:out>'><c:out value="${varAddress.street}"></c:out> Num. <c:out value="${varAddress.extNum}"></c:out> Int. <c:out value="${varAddress.intNum}"></c:out> <c:out value="${varAddress.suburb}"></c:out></option>
			</c:forEach>
		</select>
	</c:when>
	<c:otherwise>
		<label class="col-sm-12 col-md-6">No hay direcciones por seleccionar</label>
	</c:otherwise>
</c:choose>