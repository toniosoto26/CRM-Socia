<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

	<div class="form-group">
		<label for="inputCompanyEmail">Email:</label>
	    <input type="text" class="form-control" id="companyEmail" disabled value='<c:out value="${ sessionScope.infoContact.email }"></c:out>' />
	</div>
	<div class="form-group">
	    <label for="inputCompanyPhone">Teléfono:</label>
	    <input type="text" class="form-control" id="companyPhone" disabled value='<c:out value="${sessionScope.infoContact.phone}"></c:out>' >
	</div>
	<input type="hidden" id="contactId" name="contactId" value='<c:out value="${ sessionScope.infoContact.contactId }"></c:out>' />
	