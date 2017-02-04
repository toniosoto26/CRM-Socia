<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<select data-placeholder="Selecciona el proveedor" id="vendorNum" class="chosen-select" tabindex="-1" name="vendorNum" onChange="" style="width: 50%;">
	<option value="0">--Selecciona el proveedor--</option>
	<option value="TODOS"> TODOS </option>
	<c:forEach items="${sessionScope.arrVendor}" var="varVendor">
		<option value='<c:out value="${varVendor.vendorNum}"></c:out>'><c:out value="${varVendor.vendorNum}"></c:out> - <c:out value="${varVendor.name}"></c:out></option>
	</c:forEach>
</select>