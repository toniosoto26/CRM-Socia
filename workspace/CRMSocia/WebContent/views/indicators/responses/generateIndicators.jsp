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
    		<c:forEach  items="${sessionScope.arrCallIndicator}" var="varIndicator" >
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varIndicator.indicatorAct.total}" />
				<c:set var="totalEffectivesAct" value="${totalEffectivesAct + varIndicator.indicatorAct.effective}" />
				<c:set var="totalTotalsPro" value="${totalTotalsPro + varIndicator.indicatorPro.total}" />
				<c:set var="totalEffectivesPro" value="${totalEffectivesPro + varIndicator.indicatorPro.effective}" />
				<tr>
					<td><c:out value="${ varIndicator.date.dayOfWeek }"></c:out></td>
					<td><c:out value="${ varIndicator.indicatorPro.total }"></c:out></td>
					<td><c:out value="${ varIndicator.indicatorPro.effective }"></c:out></td>
					<td><c:out value="${ varIndicator.indicatorAct.total }"></c:out></td>
					<td><c:out value="${ varIndicator.indicatorAct.effective }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><c:out value="${ totalTotalsPro }"></c:out></td>
				<td><c:out value="${ totalEffectivesPro }"></c:out></td>
				<td><c:out value="${ totalTotalsAct }"></c:out></td>
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
	   		<c:forEach  items="${sessionScope.arrAppointmentIndicator}" var="varAppointment" >
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varAppointment.indicatorAct.total}" />
				<c:set var="totalObjectiveAct" value="${totalObjectiveAct + varAppointment.indicatorAct.objective}" />
				<c:set var="totalTotalsPro" value="${totalTotalsPro + varAppointment.indicatorPro.total}" />
				<c:set var="totalObjectivePro" value="${totalObjectivePro + varAppointment.indicatorPro.objective}" />
				<tr>
					<td><c:out value="${ varAppointment.date.dayOfWeek }"></c:out></td>
					<td><c:out value="${ varAppointment.indicatorPro.total }"></c:out></td>
					<td><c:out value="${ varAppointment.indicatorPro.objective }"></c:out></td>
					<td><c:out value="${ varAppointment.indicatorAct.total }"></c:out></td>
					<td><c:out value="${ varAppointment.indicatorAct.objective }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><c:out value="${ totalTotalsPro }"></c:out></td>
				<td><c:out value="${ totalObjectiveAct }"></c:out></td>
				<td><c:out value="${ totalTotalsAct }"></c:out></td>
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
	   		<c:forEach  items="${sessionScope.arrQuotationIndicator}" var="varQuotation" >
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varQuotation.indicatorAct.total}" />
				<c:set var="totalObjectiveAct" value="${totalObjectiveAct + varQuotation.indicatorAct.objective}" />
				<c:set var="totalValue" value="${totalValue + varQuotation.indicatorAct.value}" />
				<tr>
					<td><c:out value="${ varQuotation.date.dayOfWeek }"></c:out></td>
					<td><c:out value="${ varQuotation.indicatorAct.total }"></c:out></td>
					<td><c:out value="${ varQuotation.indicatorAct.objective }"></c:out></td>
					<td><c:out value="${ varQuotation.indicatorAct.type }"></c:out></td>
					<td><fmt:formatNumber value="${varQuotation.indicatorAct.value}" type="currency"/></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><c:out value="${ totalTotalsAct }"></c:out></td>
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
	   		<c:forEach  items="${sessionScope.arrTenderIndicator}" var="varTender" >
				<c:set var="totalTotalsAct" value="${totalTotalsAct + varTender.indicatorAct.total}" />
				<tr>
					<td><c:out value="${ varTender.date.dayOfWeek }"></c:out></td>
					<td><c:out value="${ varTender.indicatorAct.total }"></c:out></td>
					<td><c:out value="${ varTender.indicatorAct.type }"></c:out></td>
					<td><c:out value="${ varTender.indicatorAct.date }"></c:out></td>
				</tr>
			</c:forEach>
			
			<tr style="background-color: red;color: white;">
				<td>SEMANAL</td>
				<td><c:out value="${ totalTotalsAct }"></c:out></td>
				<td></td>
				<td></td>
			</tr>
	   	</tbody>
	</table>
</div>
