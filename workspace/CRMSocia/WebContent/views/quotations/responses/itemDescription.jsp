<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<textarea rows="2" cols="100" style="width:100%; max-width:300px;" disabled class="form-control" name="description<c:out value='${sessionScope.itemIndex }'></c:out>" ><c:out value="${sessionScope.item.description }"></c:out></textarea>