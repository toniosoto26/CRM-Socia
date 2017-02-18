<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<div class="dataTable_wrapper">
	<table class="table table-striped table-bordered table-hover">
		<thead>
             <tr>
             	<th>Fecha</th>
                <th>Cliente</th>
                <th>Contacto / Puesto</th>
                <th>Fecha / Hora</th>
                <th>Asunto</th>
                <th>Gerente que asistirá a la junta</th>
             </tr>
         </thead>
         <tbody class="cuerpo-tabla">
         	<c:forEach items="${sessionScope.arrAppointmentLog}" var="appointments">
				<tr class="odd gradeX">
		      		<td><fmt:formatDate type="date" value="${appointments.dateCreated}" pattern="dd/MM/yyyy"/> </td>
		      		<td><c:out value="${appointments.companyName}"></c:out> </td>
		      		<td><c:out value="${appointments.contactName}"></c:out> /<c:out value="${appointments.position}"></c:out> </td>
					<td><fmt:formatDate type="date" value="${appointments.date}" pattern="dd 'de' MMMM 'de' yyyy HH:mm 'hrs'"/> </td>
		      		<td><c:out value="${appointments.subject}"></c:out> </td>
		      		<td><c:out value="${appointments.bdmName}"></c:out> </td>
	      		</tr>
			</c:forEach>
		</tbody>
	</table>
</div>