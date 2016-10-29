<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<select data-placeholder="Selecciona el artículo" class="chosen-select" name="itemNum<c:out value='${sessionScope.itemIndex }'></c:out>" tabindex="-1" onchange="loadDescription(this,<c:out value='${sessionScope.itemIndex }'></c:out> );">
	<option></option>
	<c:forEach items="${sessionScope.arrItems}" var="varItem">
		<option value='<c:out value="${varItem.itemId}"></c:out>'><c:out value="${varItem.itemId}"></c:out></option>
	</c:forEach>
</select>
    