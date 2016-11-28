<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<div class="form-group">
		<label for="countCall">Numero de Llamadas Realizadas:</label>
	    <input type="text" class="form-control" id="countCall" name="countCall" disabled value='<c:out value="${ sessionScope.countCallClient }"></c:out>' />
	</div>