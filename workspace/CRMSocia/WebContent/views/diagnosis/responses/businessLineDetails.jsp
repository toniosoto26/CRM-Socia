<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class="table-responsive">
	<table class="table table-bordered">
			<c:choose>
				<c:when test="${sessionScope.arrBusinessLine != null}">					
   					<thead class="tabla-grande">
   						<tr>
	   						<th></th>
							<c:forEach items="${sessionScope.arrBusinessLine}" var="varBusinessLine">
								<td><c:out value="${varBusinessLine.name}"></c:out> </td>
							</c:forEach>
						</tr>
					</thead>
					<tbody class="cuerpo-tabla-grande">
                       	<tr>
                       		<th class="tabla-grande" scope="row">Marca actual cliente</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<select name="currentBrand<c:out value="${varBLDetails.businessLineId }"></c:out>">
										<option value="0" >-- Seleccionar --</option>
	                        			<c:forEach items="${varBLDetails.brandArray }" var="brand">
											<option value="<c:out value="${brand.brandId}"></c:out>" <c:choose><c:when test="${varBLDetails.currentBrand == brand.brandId}">selected</c:when></c:choose> ><c:out value="${brand.name}"></c:out></option>
	                        			</c:forEach>
	                        		</select>
	                        	</td>
							</c:forEach>
						</tr>
						<tr>
							<th class="tabla-grande" scope="row">Modelo(s) de equipo(s)</th>
							<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="equipmentBrand<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.equipmentBrand}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Tipo equipo</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="equipmentType<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.equipmentType}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Volumen base actual (unidades)</th><!-- Revisar -->
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="equipmentQty<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.equipmentQty}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                       		<th class="tabla-grande destacado" scope="row">PRECIO REFERENCIA</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="unitPrice<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.unitPrice}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Proveedor actual</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="currentVendor<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.currentVendor}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Cuenta con contrato de servicios administrados</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
	                        		<select name='serviceContract<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.serviceContract == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.serviceContract == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.serviceContract == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr> 
                         <tr class="azul">
                        	<th class="tabla-grande destacado" scope="row">Configuraciones especiales</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="specialConfig<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-azul" value='<c:out value="${varBLDetails.specialConfig}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                        <tr class="azul"><!-- Revisar -->
                       		<th class="tabla-grande destacado" scope="row">Disperción de entregas</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
	                        		<select name='deliverBye<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.deliverBy == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.deliverBy == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.deliverBy == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr> 
                        <tr>
                        	<th class="tabla-grande" scope="row">Cuenta con arrendamiento</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
	                        		<select name='lease<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.lease == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.lease == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.lease == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr>
                        <tr>
                        	<th class="tabla-grande" scope="row">Fecha de próximo concurso</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="nextTender<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.nextTender}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
              		</tbody>
				</c:when>
				<c:otherwise>
   					<tbody class="cuerpo-tabla-grande">
						<tr><th><label class="col-sm-6 col-md-6">No hay líneas de negocio por seleccionar</label></th></tr>
					</tbody>
				</c:otherwise>
			</c:choose>
	</table>
</div>