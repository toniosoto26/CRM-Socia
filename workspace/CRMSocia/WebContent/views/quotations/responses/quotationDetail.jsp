<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>
<c:set var="quotationId" value="${0}"/>
<c:set var="totalQty" value="${0}"/>
<c:set var="totalPrice" value="${0}"/>


<div class="indicadores">
	<div class="table-responsive">
		<table class="table table-bordered table-striped">
			<thead>
	             <tr>
	             	<th>Fecha cotización</th>
	                <th>Cliente</th>
	                <th>Artículo</th>
	                <th>Cantidad</th>
	                <th>Monto / Moneda</th>
	                <th>Margen</th>
	                <th>Fecha cierre</th>
	             </tr>
	         </thead>
	         <tbody  class="cuerpo-tabla">
	         	<c:forEach items="${sessionScope.arrQuotationLog}" var="quotations" varStatus="varCount">
					<c:choose>
						<c:when test="${varCount.index==0 }">
							<c:set var="quotationId" value="${quotations.quotationId}"/>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${quotations.quotationId!=quotationId }">
									<c:set var="quotationId" value="${quotations.quotationId}"/>
									<tr class="odd gradeX" style="background-color: gray;color: white;">
							      		<td colspan="3">Total</td>
							      		<td><c:out value="${totalQty}"></c:out></td>
										<td><fmt:formatNumber value="${totalPrice}" type="currency"/></td><td></td>
										<td></td>
						      		</tr>
						      		
									<c:set var="totalQty" value="${0}"/>
									<c:set var="totalPrice" value="${0}"/>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<tr class="odd gradeX">
						<td><fmt:formatDate type="date" value="${quotations.date}" pattern="dd/MM/yyyy"/></td>
			      		<td><c:out value="${quotations.companyName}"></c:out> </td>
			      		<td><c:out value="${quotations.itemId}"></c:out> </td>
			      		<td><c:out value="${quotations.quantity}"></c:out></td>
						<td><fmt:formatNumber value="${quotations.unitPrice}" type="currency"/></td>
						<td><c:out value="${quotations.margin}"></c:out></td>
						<td><fmt:formatDate type="date" value="${quotations.deadline}" pattern="dd/MM/yyyy HH:mm 'hrs'"/></td>
		      		</tr>
		      		
					<c:set var="totalQty" value="${totalQty + quotations.quantity}"/>
					<c:set var="totalPrice" value="${ totalPrice + (quotations.quantity*quotations.unitPrice)}"/>
				</c:forEach>
				<tr class="odd gradeX" style="background-color: darkgray;color: white;">
		      		<td colspan="3">Total</td>
		      		<td><c:out value="${totalQty}"></c:out></td>
					<td><fmt:formatNumber value="${totalPrice}" type="currency"/></td>
					<td></td>
					<td></td>
	      		</tr>
			</tbody>
		</table>
	</div>
</div>
