<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="table-responsive">
	<c:choose>
		<c:when test="${not empty sessionScope.appointmentDetail}">
			<table class="table table-bordered table-hover table-striped">
				<thead>
		             <tr>
		                <th colspan="2">Citas</th>
		             </tr>
		         </thead>
		         <tbody class="cuerpo-tabla">
		         	<tr>
		         		<td class="negro">Fecha</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.date }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Cliente</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.companyName }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Contacto</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.firstName }"></c:out> <c:out value="${sessionScope.appointmentDetail.lastName }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">BDM</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.bdmName }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Dirección</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.addressDescription }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Asunto</td>
		         		<td><c:out value="${sessionScope.appointmentDetail.comments }"></c:out></td>
		         	</tr>
				</tbody>
			</table>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${not empty sessionScope.tenderDetail}">
			<table class="table table-bordered table-hover table-striped">
				<thead>
		             <tr>
		                <th colspan="2">Concursos</th>
		             </tr>
		         </thead>
		         <tbody class="cuerpo-tabla">
		         	<tr>
		         		<td class="negro">Cliente</td>
		         		<td><c:out value="${sessionScope.tenderDetail.companyName }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Fecha inicio de gestión</td>
		         		<td><c:out value="${sessionScope.tenderDetail.startUpDate }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Fecha concurso</td>
		         		<td><c:out value="${sessionScope.tenderDetail.deadline }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Entrega de RPF para concurso</td>
		         		<td><c:out value="${sessionScope.tenderDetail.closingDate }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Requerimientos</td>
		         		<td><c:out value="${sessionScope.tenderDetail.requirements }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Observaciones</td>
		         		<td><c:out value="${sessionScope.tenderDetail.comments }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Línea de negocio</td>
		         		<td><c:out value="${sessionScope.tenderDetail.businessLineName }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Marca actual</td>
		         		<td><c:out value="${sessionScope.tenderDetail.currentBrand }"></c:out></td>
		         	</tr>
		         	<tr>
		         		<td class="negro">Tomador de decisiones</td>
		         		<td><c:out value="${sessionScope.tenderDetail.decisionMaker }"></c:out></td>
		         	</tr>
				</tbody>
			</table>
		</c:when>
	</c:choose>
</div>