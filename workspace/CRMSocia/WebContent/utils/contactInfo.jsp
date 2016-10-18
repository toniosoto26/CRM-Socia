<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<c:forEach items="${sessionScope.arrContact}" var="varContact">
	<div class="form-group">
	    <label for="inputCompanyContact">Contacto</label>
	    <input type="text" class="form-control" id="companyContact" disabled value='<c:out value="${ varContact.firstName }"></c:out> <c:out value="${varContact.lastName}"></c:out>'/>	
	</div>
	<div class="form-group">
		<label for="inputCompanyEmail">Email:</label>
	    <input type="text" class="form-control" id="companyEmail" disabled value='<c:out value="${ varContact.email }"></c:out>' />
	</div>
	<div class="form-group">
	    <label for="inputCompanyPhone">Teléfono:</label>
	    <input type="text" class="form-control" id="companyPhone" disabled value='<c:out value="${varContact.phone}"></c:out>' >
	</div>
	<input type="hidden" id="contactId" name="contactId" value='<c:out value="${ varContact.contactId }"></c:out>' />
	
</c:forEach>