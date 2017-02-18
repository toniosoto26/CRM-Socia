<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<div class="dataTable_wrapper">
	<table class="table table-striped table-bordered table-hover">
		<thead>
             <tr>
             	<th>Fecha</th>
             	<th>Fecha inicio gestión</th>
                <th>Cliente</th>
                <th>Línea de negocio</th>
                <th>Marca</th>
                <th>Fecha concurso</th>
                <th>Comentarios</th>
             </tr>
         </thead>
         <tbody class="cuerpo-tabla">
         	<c:forEach items="${sessionScope.arrTenderLog}" var="tenders">
				<tr class="odd gradeX">
					<td><fmt:formatDate type="date" value="${tenders.dateCreated}" pattern="dd/MM/yyyy"/></td>
					<td><fmt:formatDate type="date" value="${tenders.date}" pattern="dd 'de' MMMM 'de' yyyy"/></td>
		      		<td><c:out value="${tenders.companyName}"></c:out> </td>
		      		<td><c:out value="${tenders.businessLine}"></c:out></td>
		      		<td><c:out value="${tenders.brand}"></c:out> </td>
					<td><fmt:formatDate type="date" value="${tenders.deadline}" pattern="dd 'de' MMMM 'de' yyyy"/> </td>
		      		<td><c:out value="${tenders.comments}"></c:out> </td>
	      		</tr>
			</c:forEach>
		</tbody>
	</table>
</div>