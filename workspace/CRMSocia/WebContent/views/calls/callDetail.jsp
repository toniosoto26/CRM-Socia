<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

         			<div class="dataTable_wrapper">
         				<table class="table table-striped table-bordered table-hover" id="tablaCalls">
         					<thead>
                                <tr>
                                   <th>Fecha Llamada</th>
                                   <th>Semaforo</th>
                                   <th>Cantidad</th>
                                   <th>Cliente</th>
                                   <th>Correo</th>
                                   <th>Telefono</th>
                                   <th>Contacto</th>
                                   <th>Puesto</th>
                                   <th>Comentario</th>
                                   <th>Envio Carta</th>
                                </tr>
                            </thead>
                            <tbody>
	                          	<c:forEach items="${sessionScope.datos}" var="calls" varStatus="contCall">
	          						<tr class="odd gradeX">
		          						<td><c:out value="${calls.date_call}"></c:out> </td>
				                 		<td><c:out value="${calls.status}"></c:out> </td>
				                 		<td> 1 </td>
				                 		<td><c:out value="${calls.cust_name}"></c:out> </td>
				                 		<td><c:out value="${calls.mail}"></c:out> </td>
				                 		<td><c:out value="${calls.phone}"></c:out> </td>
				                 		<td><c:out value="${calls.contact_name}"></c:out> </td>
				                 		<td><c:out value="${calls.position}"></c:out> </td>
				                 		<td><c:out value="${calls.comments}"></c:out> </td>
				                 		<td><c:out value="${calls.letter}"></c:out> </td>
				                 		</tr>
	          					</c:forEach>
          					</tbody>
         				</table>
         			</div>
