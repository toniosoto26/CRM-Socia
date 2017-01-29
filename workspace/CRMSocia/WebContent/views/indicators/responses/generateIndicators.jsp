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


<c:set var="totalActChart" value="${0}"/>
<c:set var="effectiveActChart" value="${0}"/>
<c:set var="objectiveActChart" value="${0}"/>
<c:set var="totalProChart" value="${0}"/>
<c:set var="effectiveProChart" value="${0}"/>
<c:set var="objectiveProChart" value="${0}"/>

<c:set var="totalEffectiveChart" value="${0}"/>
<c:set var="totalMissingChart" value="${0}"/>
<c:set var="totalEffectiveChart2" value="${0}"/>
<c:set var="totalMissingChart2" value="${0}"/>
<c:set var="totalEffectiveChart3" value="${0}"/>
<c:set var="totalMissingChart3" value="${0}"/>

<c:set var="fechaIni" value="${''}"/>
<c:set var="fechaFin" value="${''}"/>

<div class="container row">
	<div class="col-md-8 col-lg-8">
    	<div class="table-responsive">
        	<table class="table table-bordered table-hover table-striped">
            <thead>
	   			<tr>
	   				<th colspan="5" class="danger"><h5 style="color: white;">Llamadas</h5></th>
	   			</tr>
		    </thead>
		    <tbody class="cuerpo-tabla">
		   			<tr>
		   				<td class="danger"></td>
		   				<td class="danger">Objetivo PRO</td>
		   				<td class="danger"></td>
		   				<td class="danger">Objetivo ACT</td>
		   				<td class="danger"></td>
		   			</tr>
		   			<tr>
			    		<td class="negro"></td>
		    			<td class="negro">Prospecto</td>
		    			<td class="negro">Efectivas</td>
		    			<td class="negro">Cliente</td>
			    		<td class="negro">Efectivas</td>
		    		</tr>
		    		<c:forEach items="${sessionScope.arrCallIndicator}" var="varIndicator" varStatus="varCount">
						<c:set var="totalTotalsAct" value="${totalTotalsAct + varIndicator.indicatorAct.total}" />
						<c:set var="totalEffectivesAct" value="${totalEffectivesAct + varIndicator.indicatorAct.effective}" />
						<c:set var="totalObjectiveAct" value="${totalObjectiveAct + varIndicator.indicatorAct.objective}" />
						<c:set var="totalTotalsPro" value="${totalTotalsPro + varIndicator.indicatorPro.total}" />
						<c:set var="totalEffectivesPro" value="${totalEffectivesPro + varIndicator.indicatorPro.effective}" />
						<c:set var="totalObjectivePro" value="${totalObjectivePro + varIndicator.indicatorPro.objective}" />
						<c:choose>
							<c:when test="${varCount.index==0 }">
								<c:set var="fechaIni" value="${varIndicator.date.date}"/>
							</c:when>
							<c:otherwise>
								<c:set var="fechaFin" value="${varIndicator.date.date}"/>
							</c:otherwise>
						</c:choose>
						<tr>
							<td class="negro"><c:out value="${ varIndicator.date.dayOfWeek }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('P', '<fmt:formatDate type="date" value="${varIndicator.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varIndicator.indicatorPro.total }"></c:out></a></td>
							<td style="text-align:right;"><c:out value="${ varIndicator.indicatorPro.effective }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('A', '<fmt:formatDate type="date" value="${varIndicator.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varIndicator.indicatorAct.total }"></c:out></a></td>
							<td style="text-align:right;"><c:out value="${ varIndicator.indicatorAct.effective }"></c:out></td>
						</tr>
					</c:forEach>
					<c:set var="totalActChart" value="${totalTotalsAct}"/>
					<c:set var="effectiveActChart" value="${totalEffectivesAct}"/>
					<c:set var="objectiveActChart" value="${totalObjectiveAct}"/>
					<c:set var="totalProChart" value="${totalTotalsPro}"/>
					<c:set var="effectiveProChart" value="${totalEffectivesPro}"/>
					<c:set var="objectiveProChart" value="${totalObjectivePro}"/>
			
					<tr>
						<td class="negro">SEMANAL</td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('P', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsPro }"></c:out></a></td>
						<td style="text-align:right;"><c:out value="${ totalEffectivesPro }"></c:out></td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadCallDetail('A', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
						<td style="text-align:right;"><c:out value="${ totalEffectivesAct }"></c:out></td>
					</tr>
		    	</tbody>
		    </table>
		</div>
	</div>
	<div class="col-md-4 col-lg-4">
		<div id="calls" style="min-width: 310px; height: 400px; max-width: 600px; float:right"></div>
	</div>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="container row">
	<div class="col-md-8 col-lg-8">
    	<div class="table-responsive">
        	<table class="table table-bordered table-hover table-striped">
          		<thead>
		  			<tr>
		  				<th colspan="5" class="warning"><h5 style="color: #4d4d4d;">Citas</h5></th>
		  			</tr>
		  			<tr>
		  				<th class="warning"></th>
		  				<th class="warning">Prospecto</th>
		  				<th class="warning">Objetivo PRO</th>
		  				<th class="warning">Cliente</th>
		  				<th class="warning">Objetivo ACT</th>
		  			</tr>
			   	</thead>
			   	<tbody class="cuerpo-tabla">
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
							<td class="negro"><c:out value="${ varAppointment.date.dayOfWeek }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('P', '<fmt:formatDate type="date" value="${varAppointment.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varAppointment.indicatorPro.total }"></c:out></a></td>
							<td style="text-align:right;"><c:out value="${ varAppointment.indicatorPro.objective }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('A', '<fmt:formatDate type="date" value="${varAppointment.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varAppointment.indicatorAct.total }"></c:out></a></td>
							<td style="text-align:right;"><c:out value="${ varAppointment.indicatorAct.objective }"></c:out></td>
						</tr>
					</c:forEach>
					<c:set var="totalEffectiveChart" value="${(100*totalTotalsAct)/totalObjectiveAct}"/>
					<c:set var="totalMissingChart" value="${100-totalEffectiveChart}"/>
					<c:set var="totalEffectiveChart2" value="${(100*totalTotalsPro)/totalObjectivePro}"/>
					<c:set var="totalMissingChart2" value="${100-totalEffectiveChart2}"/>
					
					<tr>
						<td class="negro">SEMANAL</td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('P', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsPro }"></c:out></a></td>
						<td style="text-align:right;"><c:out value="${ totalObjectiveAct }"></c:out></td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadAppointmentDetail('A', '<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
						<td style="text-align:right;"><c:out value="${ totalObjectivePro }"></c:out></td>
					</tr>
			   	</tbody>
			</table>
		</div>
	</div> 
	<div class="col-md-4 col-lg-4">
		<div id="dates" style="height: 400px; margin: 0 auto; float: left"></div>	    
	</div>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="container row">
	<div class="col-md-8 col-lg-8">
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
		  			<tr>
		  				<th colspan="5" class="success"><h5 style="color: #4d4d4d;">Cotizaciones</h5></th>
		  			</tr>
		  			<tr>
		  				<th class="success"></th>
		  				<th class="success">Cantidad</th>
		  				<th class="success">Objetivo</th>
		  				<th class="success">Tipo de cliente</th>
		  				<th class="success">Valor</th>
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
							<td class="negro"><c:out value="${ varQuotation.date.dayOfWeek }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadQuotationDetail('<fmt:formatDate type="date" value="${varQuotation.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varQuotation.indicatorAct.total }"></c:out></a></td>
							<td style="text-align:right;"><c:out value="${ varQuotation.indicatorAct.objective }"></c:out></td>
							<td><c:out value="${ varQuotation.indicatorAct.type }"></c:out></td>
							<td style="text-align:right;"><fmt:formatNumber value="${varQuotation.indicatorAct.value}" type="currency"/></td>
						</tr>
					</c:forEach>
					
					<c:set var="totalEffectiveChart3" value="${(100*totalTotalsAct)/totalObjectiveAct}"/>
					<c:set var="totalMissingChart3" value="${100-totalEffectiveChart3}"/>
			
					<tr>
						<td class="negro">SEMANAL</td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadQuotationDetail('<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
						<td style="text-align:right;"><c:out value="${ totalObjectiveAct }"></c:out></td>
						<td></td>
						<td style="text-align:right;"><fmt:formatNumber value="${totalValue}" type="currency"/></td>
					</tr>
			   	</tbody>
			</table>
		</div>
	</div>
	<div class="col-md-4 col-lg-4">
		<div id="quotations" style="height: 400px; margin: 0 auto; float: left"></div>    
	</div>
</div>
<br/>

<c:set var="totalTotalsAct" value="${0}"/>
<c:set var="totalEffectivesAct" value="${0}"/>
<c:set var="totalObjectiveAct" value="${0}"/>
<c:set var="totalTotalsPro" value="${0}"/>
<c:set var="totalEffectivesPro" value="${0}"/>
<c:set var="totalObjectiePro" value="${0}"/>
<c:set var="totaValue" value="${0}"/>

<div class="container row">
	<div class="col-md-8 col-lg-8">
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-striped">
				<thead>
		  			<tr>
		  				<th colspan="5" class="info"><h5 style="color: #4d4d4d;">Concursos</h5></th>
		  			</tr>
		  			<tr>
		  				<th class="info"></th>
		  				<th class="info">Cantidad</th>
		  				<th class="info">Línea de negocio</th>
		  				<th class="info">Fecha</th>
		  			</tr>
			   	</thead>
			   	<tbody class="cuerpo-tabla">
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
							<td class="negro"><c:out value="${ varTender.date.dayOfWeek }"></c:out></td>
							<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadTenderDetail('<fmt:formatDate type="date" value="${varTender.date.date.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ varTender.indicatorAct.total }"></c:out></a></td>
							<td><c:out value="${ varTender.indicatorAct.type }"></c:out></td>
							<td><c:out value="${ varTender.indicatorAct.date }"></c:out></td>
						</tr>
					</c:forEach>
					
					<tr>
						<td class="negro">SEMANAL</td>
						<td style="text-align:right;"><a data-toggle="modal" href="#myModal" onClick="loadTenderDetail('<fmt:formatDate type="date" value="${fechaIni.time}" pattern="yyyy-MM-dd"/>', '<fmt:formatDate type="date" value="${fechaFin.time}" pattern="yyyy-MM-dd"/>');"><c:out value="${ totalTotalsAct }"></c:out></a></td>
						<td></td>
						<td></td>
					</tr>
			   	</tbody>
			</table>
		</div>
	</div>
	
	<div class="col-md-4 col-lg-4">
		<div id="tenders" style="height: 400px; margin: 0 auto; float: left"></div>    
	</div>
</div>

<script>
	$(function () {
		var getColor = {
			    'RED': '#FF0026',
			    'YEL': '#F5CD21',
			    'GRE': '#9FDEA9', 
			    'GRA': '#DFDFDF', 
			    'BLU': '#81A9E1'
			};
		
		Highcharts.chart('calls', {
			chart: {
	            type: 'bar'
	        },
	        title: {
	            text: 'Llamadas'
	        },
	        xAxis: {
	            categories: ['Prospectos', 'Actuales'],
	            title: {
	                text: null
	            }
	        },
	        yAxis: {
	            min: 0,
	            labels: {
	                overflow: 'justify'
	            }
	        },
	        plotOptions: {
	            bar: {
	                dataLabels: {
	                    enabled: true
	                }
	            }
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'top',
	            x: -40,
	            y: 80,
	            floating: true,
	            borderWidth: 1,
	            shadow: true
	        },
	        credits: {
	            enabled: false
	        },
	        series: [{
	            name: 'Efectivas',
	            data: [<c:out value="${effectiveProChart}"></c:out>, <c:out value="${effectiveActChart}"></c:out>],
            	color: getColor['BLU']
	        }, {
	            name: 'Totales',
	            data: [<c:out value="${totalProChart}"></c:out>, <c:out value="${totalActChart}"></c:out>],
            	color: getColor['GRE']
	        }, {
	            name: 'Objetivo',
	            data: [<c:out value="${objectiveProChart}"></c:out>, <c:out value="${objectiveActChart}"></c:out>],
           	 	color: getColor['RED']
	        }]
	    });
		
		Highcharts.chart('dates', {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: 'Semanal'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	                }
	            }
	        },
	        series: 
	        	[{
		        	name: 'Prospectos',
		            center: ['20%'],
		        	data: [{
		        				y: <c:out value="${totalMissingChart2}"></c:out>,
		        				name: 'Faltantes',
		        				color: getColor['GRA']
		        			}, {
		        				y: <c:out value="${totalEffectiveChart2}"></c:out>,
		        				name: 'Totales',
		    	                selected: true,
		    	                sliced: true,
		        				color: getColor['YEL']
		        		  }]
	       		},
	        	{
	        	 	name: 'Actuales',
		            center: ['80%'],
		        	data:  [{
        				y: <c:out value="${totalMissingChart}"></c:out>,
        				name: 'Faltantes',
        				color: getColor['GRA']
        			}, {
        				y: <c:out value="${totalEffectiveChart}"></c:out>,
        				name: 'Totales',
    	                selected: true,
    	                sliced: true,
        				color: getColor['YEL']
        		  }]
	        }]
	    });
		
		Highcharts.chart('quotations', {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: 'Semanal'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	                }
	            }
	        },
	        series: [{
	            name: 'Cotizaciones',
	            colorByPoint: true,
	            data: [{
	                name: 'Faltantes',
	                y: <c:out value="${totalMissingChart3}"></c:out>,
	                color: getColor['GRA']
	            }, {
	                name: 'Totales',
	                y: <c:out value="${totalEffectiveChart3}"></c:out>,
	                sliced: true,
	                selected: true,
	                color: getColor['GRE']
	            }]
	        }]
	    });
		
		Highcharts.chart('tenders', {
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false,
	            type: 'pie'
	        },
	        title: {
	            text: 'Semanal'
	        },
	        tooltip: {
	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	        },
	        plotOptions: {
	            pie: {
	                allowPointSelect: true,
	                cursor: 'pointer',
	                dataLabels: {
	                    enabled: true,
	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	                }
	            }
	        },
	        series: [{
	            name: 'Concursos',
	            colorByPoint: true,
	            data: [
<c:forEach  items="${sessionScope.arrTenderChart}" var="varTenderChart"  varStatus="varCount">
	<c:set var="chart" value="${ (100 * varTenderChart.indicatorAct.total)/totalTotalsAct}" />
	<c:choose>
		<c:when test="${!varCount.last}">
			{
	            name: '<c:out value="${varTenderChart.indicatorAct.type}"></c:out>',
	            y: <c:out value="${chart}"></c:out>
	        },
		</c:when>
		<c:otherwise>
			{
	            name: '<c:out value="${varTenderChart.indicatorAct.type}"></c:out>',
	            y: <c:out value="${chart}"></c:out>
	        }
		</c:otherwise>
	</c:choose>
</c:forEach>    
	             ]
	        }]
	    });
		<c:out value="${ totalTotalsAct }"></c:out>
	});
</script>

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