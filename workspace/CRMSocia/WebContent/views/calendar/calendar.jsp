<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<div class="row">
	<div id="primaryPanel" class="col-sm-12 col-md-12">
		<div id="resultAppointment">
			<input type="hidden" id="calendarAppo">
		</div>
	</div>
	<div id="secondaryPanel">
	</div>
</div>