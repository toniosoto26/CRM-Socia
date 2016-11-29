<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="box-header" style="width:100%">
	<div class="form-group">
		<select style="width:80%" data-placeholder="--Selecciona el artículo--" class="chosen-select" id="itemId<c:out value="${sessionScope.itemIndex}"></c:out>" name="itemNum<c:out value='${sessionScope.itemIndex }'></c:out>" tabindex="-1" onchange="loadDescription(this,<c:out value='${sessionScope.itemIndex }'></c:out> );">
			<option value=""></option>
			<c:forEach items="${sessionScope.arrItems}" var="varItem">
				<option value='<c:out value="${varItem.itemId}"></c:out>'><c:out value="${varItem.itemId}"></c:out></option>
			</c:forEach>
		</select>
	</div>
	<a style="width:10%;float: right;cursor:pointer;" onClick="changeInput(<c:out value='${sessionScope.itemIndex }'></c:out>);"><i class="fa fa-plus-circle" aria-hidden="true"></i></a>
</div>