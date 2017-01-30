<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<c:set var="className" value="${'amarillo'}"></c:set>
         			<div class="dataTable_wrapper">
         				<table class="table table-striped table-bordered table-hover" id="tablaCalls">
         					<thead>
                                <tr>
                                   <th>Fecha Llamada</th>
                                   <!--  th>Semaforo</th-->
                                   <th>Cantidad</th>
                                   <th>Cliente</th>
                                   <th>Correo</th>
                                   <th>Teléfono</th>
                                   <th>Contacto</th>
                                   <th>Puesto</th>
                                   <th>Comentario</th>
                                   <th>Envió carta</th>
                                   <th>Detectó concurso</th>
                                </tr>
                            </thead>
                            <tbody>
	                          	<c:forEach items="${sessionScope.datos}" var="calls" varStatus="contCall">
								 	<c:choose>
								 		<c:when test="${calls.status == 'opcion 1 ' }">
								 			<c:set var="className" value="${'verde'}"></c:set>
								 		</c:when>
								 		<c:otherwise>
								 			<c:choose>
										 		<c:when test="${calls.status == 'opcion semaforo 3 ' }">
										 			<c:set var="className" value="${'rojo'}"></c:set>
										 		</c:when>
										 	</c:choose>
								 		</c:otherwise>
								 	</c:choose>
	                          	
	          						<tr class="odd gradeX">
		          						<td class="<c:out value="${className}"></c:out>" ><fmt:formatDate type="date" value="${calls.date_call}" pattern="dd/MM/yyyy"/> </td>
				                 		<!-- td><c:out value="${calls.status}"></c:out> </td -->
				                 		<td class="<c:out value="${className}"></c:out>" > 1 </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.cust_name}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.mail}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.phone}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.contact_name}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.position}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>"><c:out value="${calls.comments}"></c:out> </td>
				                 		<td class="<c:out value="${className}"></c:out>">
				                 			<c:choose>
										 		<c:when test="${calls.letter == 1 }">
										 			Si
										 		</c:when>
										 		<c:otherwise>
										 			No
										 		</c:otherwise>
										 	</c:choose>
				                 		</td>
				                 		<td class="<c:out value="${className}"></c:out>">
				                 			<c:choose>
										 		<c:when test="${calls.competition == 1 }">
										 			Si
										 		</c:when>
										 		<c:otherwise>
										 			No
										 		</c:otherwise>
										 	</c:choose>
				                 		</td>
				                 	</tr>
	          					</c:forEach>
          					</tbody>
         				</table>
         			</div>
