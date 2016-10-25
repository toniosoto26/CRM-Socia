<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
 <c:choose>
 	<c:when test="${not empty contactos}">
 		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Contacto:</label>
				   <select data-placeholder="Seleccion el cliente"  id="contactI" name="contactI" class="chosen-select form-control" tabindex="-1" onchange="uploadInfo(this)" >
						<option value="0">Seleccionar...</option>
						<c:forEach items="${sessionScope.contactos}" var="varCon">
							<option value='<c:out value="${varCon.contactId}"></c:out>,
											<c:out value="${varCon.phone}"></c:out>,
											<c:out value="${varCon.email}"></c:out>,
											<c:out value="${varCon.firstName}"></c:out> <c:out value="${varCon.lastName}"></c:out>'>
											
								<c:out value="${varCon.firstName}"></c:out> <c:out value="${varCon.lastName}"></c:out>
							</option>
						</c:forEach>
					</select>
					<input type="hidden" id="idContactI" name="idContactI">
					<input type="hidden" id="idNameI" name="idNameI">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Telefono:</label>
				     <input type="text" class="form-control" id="phoneContact" name="phoneContact" placeholder="sin telefono" readonly="readonly">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Email:</label>
				    <input type="text" class="form-control" id="emailContact" name="emailContact" placeholder="sin email" readonly="readonly">
				</div>	  	
			</div>
		</div>
 	</c:when>
 	<c:otherwise>
 		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Contacto:</label>
				    <input type="text" class="form-control" id="contactI" name="contactI" placeholder="sin contacto">
				    <input type="hidden" id="idContactI" name="idContactI" >
				    <input type="hidden" id="idNameI" name="idNameI">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Telefono:</label>
				    <input type="text" class="form-control" id="phoneContact" name="phoneContact" placeholder="sin telefono">
				</div>	  	
			</div>
		</div>
		<div class="col-md-12">
		  	<div class="form-group row">
		  		<div class="col-md-6">
				    <label for="inputCompanyEmail">Email:</label>
				    <input type="text" class="form-control" id="emailContact" name="emailContact" placeholder="sin email">
				</div>	  	
			</div>
		</div>
 	
 	</c:otherwise>
 </c:choose>
    