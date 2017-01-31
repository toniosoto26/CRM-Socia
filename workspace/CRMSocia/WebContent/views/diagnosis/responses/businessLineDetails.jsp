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
									<select name="equipmentType<c:out value="${varBLDetails.businessLineId }"></c:out>">
										<option value="0" >-- Seleccionar --</option>
	                        			<c:forEach items="${varBLDetails.equipmentTypeArray }" var="equipmentType">
											<option value="<c:out value="${equipmentType.equipmentTypeId}"></c:out>" <c:choose><c:when test="${varBLDetails.equipmentType == equipmentType.equipmentTypeId}">selected</c:when></c:choose> ><c:out value="${equipmentType.name}"></c:out></option>
	                        			</c:forEach>
	                        		</select>
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
                       	<tr>
                        	<th class="tabla-grande" scope="row">Concursa sus requerimientos</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
	                        		<select name='requirementsNeeded<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.requirementsNeeded == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.requirementsNeeded == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.requirementsNeeded == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr>
                        <tr>
                        	<th class="tabla-grande" scope="row">Requiere equipo demo</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
                        		<td>
	                        		<select name='demo<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.demo == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.demo == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.demo == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr>
                        <tr>
                       		<th class="tabla-grande" scope="row">Se le ha hecho venta</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
                        		<td>
	                        		<select name='sales<c:out value="${varBLDetails.businessLineId }"></c:out>'>
	                        			<option value="">--Seleccionar--</option>
	                        			<option value="NO" <c:choose><c:when test="${varBLDetails.sales == 'NO' }">selected</c:when></c:choose>>NO</option>
	                        			<option value="SI" <c:choose><c:when test="${varBLDetails.sales == 'SI' }">selected</c:when></c:choose>>SI</option>
	                        			<option value="N/A" <c:choose><c:when test="${varBLDetails.sales == 'N/A' }">selected</c:when></c:choose>>N/A</option>
	                        		</select>
	                        	</td>
	                        </c:forEach>
                        </tr>
                        <tr>
                        	<th class="tabla-grande" scope="row">Ejecutivo de la marca que los atiende</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="executive<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.executive}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	 <tr class="azul">
                        	<th class="tabla-grande destacado" scope="row">Factor de gane detectado</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
                        		<td>
									<input name="gainFactor<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-azul" value='<c:out value="${varBLDetails.gainFactor}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Responsable toma de decisión de compra</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="decisionMaker<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.decisionMaker}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                        <tr>
                    		<th class="tabla-grande" scope="row">Puesto</th>
                    		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="position<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.position}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Tel / Cel</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="phone<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.phone}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Correo</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<input name="email<c:out value="${varBLDetails.businessLineId }"></c:out>" type="text" class="campo-tabla-gris" value='<c:out value="${varBLDetails.email}"></c:out>' />
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Requisitos o comentarios</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<textarea name="requirements<c:out value="${varBLDetails.businessLineId }"></c:out>" class="campo-tabla-gris" >
										<c:out value="${varBLDetails.requirements}"></c:out> 
									</textarea>
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr>
                        	<th class="tabla-grande" scope="row">Próxima acción acordada con el cliente</th>
                        	<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<textarea name="nextStep<c:out value="${varBLDetails.businessLineId }"></c:out>" class="campo-tabla-gris" >
										<c:out value="${varBLDetails.nextStep}"></c:out> 
									</textarea>
	                        	</td>
							</c:forEach>
                       	</tr>
                       	<tr class="azul">
                       		<th class="tabla-grande destacado" scope="row">Propuesta comercial (marca/precio/fecha)</th>
                       		<c:forEach items="${sessionScope.arrBLDetails}" var="varBLDetails">
								<td>
									<textarea name="commercialProposal<c:out value="${varBLDetails.businessLineId }"></c:out>" class="campo-tabla-azul" >
										<c:out value="${varBLDetails.commercialProposal}"></c:out> 
									</textarea>
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