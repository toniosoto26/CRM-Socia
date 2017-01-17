<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<div class="dataTable_wrapper">
	<table class="table table-striped table-bordered table-hover" id="tablaCalls">
		<thead>
             <tr>
                <th>Cliente</th>
                <th>Contacto / Puesto</th>
                <th>Fecha / Hora</th>
                <th>Asunto</th>
                <th>Gerente que asistirá a la junta</th>
             </tr>
         </thead>
         <tbody>
         	<c:forEach items="${sessionScope.arrAppointmentLog}" var="appointments">
				<tr class="odd gradeX">
		      		<td><c:out value="${appointments.companyName}"></c:out> </td>
		      		<td><c:out value="${appointments.contactName}"></c:out> /<c:out value="${appointments.position}"></c:out> </td>
					<td><fmt:formatDate type="date" value="${appointments.date}" pattern="dd/MM/yyyy HH:mm:ss"/> </td>
		      		<td><c:out value="${appointments.subject}"></c:out> </td>
		      		<td><c:out value="${appointments.bdmName}"></c:out> </td>
	      		</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
