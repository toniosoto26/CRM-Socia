<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li class="active">Calendario</li>
</ol>
<div class="panel">
	<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>
</div>
<div class="titulo"><h3>Calendario</h3></div>

<link href='/CRMSocia/css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/CRMSocia/css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/CRMSocia/js/calendar/moment.min.js'></script>
<script src='/CRMSocia/js/calendar/fullcalendar.js'></script>
<script src='/CRMSocia/js/calendar/lang/es.js'></script>

<script>
$(document).ready(function() {
	$.ajax({
		type: "post",
		url : "ControllerAppointment",
		data: {opc: 6},
		success: function(response){
			$("#resultAppointment").html(response);
		},
		error: function(){
			alertify.alert("Error");
		}
	});
});
</script>

<div id="resultAppointment">
	<input type="hidden" id="calendarAppo">
</div>