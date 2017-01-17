<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<div class="dataTable_wrapper">
	<table class="table table-striped table-bordered table-hover" id="tablaCalls">
		<thead>
             <tr>
                <th>Cliente</th>
                <th>Línea de negocio</th>
                <th>Marca</th>
                <th>Fecha</th>
                <th>Comentarios</th>
             </tr>
         </thead>
         <tbody>
         	<c:forEach items="${sessionScope.arrTenderLog}" var="tenders">
				<tr class="odd gradeX">
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
