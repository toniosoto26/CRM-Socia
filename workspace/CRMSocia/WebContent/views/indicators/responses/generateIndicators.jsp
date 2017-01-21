<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="es_MX"/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>
<c:set var="fechaIni" value="${''}"/>
<c:set var="fechaFin" value="${''}"/>

<div class="table-responsive">
   	<table class="table table-bordered">
   		<thead class="tabla-grande">
   			<tr>
   				<th colspan="5"><h5>Llamadas</h5></th>
   			</tr>
   			<tr>
   				<th></th>
   				<th>Objetivo PRO</th>
   				<th></th>
   				<th>Objetivo ACT</th>
   				<th></th>
   			</tr>
   			<tr>
	    		<th></th>
    			<th>Prospecto</th>
    			<th>Efectivas</th>
    			<th>Cliente</th>
	    		<th>Efectivas</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${sessionScope.arrCallIndicator}" var="varIndicator" varStatus="varCount">
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varIndicator.indicatorAct.total}" />
				<c:set var="totalEffectivesAct" value="${totalEffectivesAct + varIndicator.indicatorAct.effective}" />
				<c:set var="totalTotalsPro" value="${totalTotalsPro + varIndicator.indicatorPro.total}" />
				<c:set var="totalEffectivesPro" value="${totalEffectivesPro + varIndicator.indicatorPro.effective}" />
				<c:choose>
					<c:when test="${varCount.index==0 }">
						<c:set var="fechaIni" value="${varIndicator.date.date}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fechaFin" value="${varIndicator.date.date}"/>
					</c:otherwise>
				</c:choose>
				<tr>
					<td><c:out value="${ varIndicator.date.dayOfWeek }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('P', '<fmt:formatDate type="date" value="${varIndicator.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varIndicator.indicatorPro.total }"></c:out></a></td>
					<td><c:out value="${ varIndicator.indicatorPro.effective }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('A', '<fmt:formatDate type="date" value="${varIndicator.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varIndicator.indicatorAct.total }"></c:out></a></td>
					<td><c:out value="${ varIndicator.indicatorAct.effective }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('P', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsPro }"></c:out></a></td>
				<td><c:out value="${ totalEffectivesPro }"></c:out></td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('A', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
				<td><c:out value="${ totalEffectivesAct }"></c:out></td>
			</tr>
    	</tbody>
    </table>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="table-responsive">
	<table class="table table-bordered">
  		<thead class="tabla-grande">
  			<tr>
  				<th colspan="5"><h5>Citas</h5></th>
  			</tr>
  			<tr>
  				<th></th>
  				<th>Prospecto</th>
  				<th>Objetivo PRO</th>
  				<th>Cliente</th>
  				<th>Objetivo ACT</th>
  			</tr>
	   	</thead>
	   	<tbody>
	   		<c:forEach  items="${sessionScope.arrAppointmentIndicator}" var="varAppointment"  varStatus="varCount">
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varAppointment.indicatorAct.total}" />
				<c:set var="totalObjectiveAct" value="${totalObjectiveAct + varAppointment.indicatorAct.objective}" />
				<c:set var="totalTotalsPro" value="${totalTotalsPro + varAppointment.indicatorPro.total}" />
				<c:set var="totalObjectivePro" value="${totalObjectivePro + varAppointment.indicatorPro.objective}" />
				<c:choose>
					<c:when test="${varCount.index==0 }">
						<c:set var="fechaIni" value="${varAppointment.date.date}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fechaFin" value="${varAppointment.date.date}"/>
					</c:otherwise>
				</c:choose>
				<tr>
					<td><c:out value="${ varAppointment.date.dayOfWeek }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('P', '<fmt:formatDate type="date" value="${varAppointment.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varAppointment.indicatorPro.total }"></c:out></a></td>
					<td><c:out value="${ varAppointment.indicatorPro.objective }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('A', '<fmt:formatDate type="date" value="${varAppointment.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varAppointment.indicatorAct.total }"></c:out></a></td>
					<td><c:out value="${ varAppointment.indicatorAct.objective }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('P', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsPro }"></c:out></a></td>
				<td><c:out value="${ totalObjectiveAct }"></c:out></td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('A', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
				<td><c:out value="${ totalObjectivePro }"></c:out></td>
			</tr>
	   	</tbody>
	</table>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="table-responsive">
	<table class="table table-bordered">
  		<thead class="tabla-grande">
  			<tr>
  				<th colspan="5"><h5>Cotizaciones</h5></th>
  			</tr>
  			<tr>
  				<th></th>
  				<th>Cantidad</th>
  				<th>Objetivo</th>
  				<th>Tipo de cliente</th>
  				<th>Valor</th>
  			</tr>
	   	</thead>
	   	<tbody>
	   		<c:forEach  items="${sessionScope.arrQuotationIndicator}" var="varQuotation"  varStatus="varCount">
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varQuotation.indicatorAct.total}" />
				<c:set var="totalObjectiveAct" value="${totalObjectiveAct + varQuotation.indicatorAct.objective}" />
				<c:set var="totalValue" value="${totalValue + varQuotation.indicatorAct.value}" />
				<c:choose>
					<c:when test="${varCount.index==0 }">
						<c:set var="fechaIni" value="${varQuotation.date.date}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fechaFin" value="${varQuotation.date.date}"/>
					</c:otherwise>
				</c:choose>
				<tr>
					<td><c:out value="${ varQuotation.date.dayOfWeek }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadQuotationDetail('<fmt:formatDate type="date" value="${varQuotation.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varQuotation.indicatorAct.total }"></c:out></a></td>
					<td><c:out value="${ varQuotation.indicatorAct.objective }"></c:out></td>
					<td><c:out value="${ varQuotation.indicatorAct.type }"></c:out></td>
					<td><fmt:formatNumber value="${varQuotation.indicatorAct.value}" type="currency"/></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadQuotationDetail('<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
				<td><c:out value="${ totalObjectiveAct }"></c:out></td>
				<td></td>
				<td><fmt:formatNumber value="${totalValue}" type="currency"/></td>
			</tr>
	   	</tbody>
	</table>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="table-responsive">
	<table class="table table-bordered">
  		<thead class="tabla-grande">
  			<tr>
  				<th colspan="5"><h5>Concursos</h5></th>
  			</tr>
  			<tr>
  				<th></th>
  				<th>Cantidad</th>
  				<th>Línea de negocio</th>
  				<th>Fecha</th>
  			</tr>
	   	</thead>
	   	<tbody>
	   		<c:forEach  items="${sessionScope.arrTenderIndicator}" var="varTender"  varStatus="varCount">
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varTender.indicatorAct.total}" />
				<c:choose>
					<c:when test="${varCount.index==0 }">
						<c:set var="fechaIni" value="${varTender.date.date}"/>
					</c:when>
					<c:otherwise>
						<c:set var="fechaFin" value="${varTender.date.date}"/>
					</c:otherwise>
				</c:choose>
				<tr>
					<td><c:out value="${ varTender.date.dayOfWeek }"></c:out></td>
					<td><a data-toggle="modal" href="#myModal" onClick="loadTenderDetail('<fmt:formatDate type="date" value="${varTender.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varTender.indicatorAct.total }"></c:out></a></td>
					<td><c:out value="${ varTender.indicatorAct.type }"></c:out></td>
					<td><c:out value="${ varTender.indicatorAct.date }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><a data-toggle="modal" href="#myModal" onClick="loadTenderDetail('<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
				<td></td>
				<td></td>
			</tr>
	   	</tbody>
	</table>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog" style="width:100%">
    	<!-- Modal content-->
      	<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Detalle</h4>
        	</div>
        	<div class="modal-body" id="modalContent"></div>
      	</div>
    </div>
</div>