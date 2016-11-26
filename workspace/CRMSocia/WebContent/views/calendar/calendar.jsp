<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<ol class="breadcrumb">
  <li><a href="#">Inicio</a></li>
  <li class="active">Calendario</li>
</ol>
<div class="titulo"><h3>Calendario</h3></div>

<link href='/CRMSocia/css/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/CRMSocia/css/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/CRMSocia/js/calendar/moment.min.js'></script>
<script src='/CRMSocia/js/calendar/fullcalendar.js'></script>
<script src='/CRMSocia/js/calendar/lang/es.js'></script>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'Calendario',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			lang: 'es',
			defaultDate: '2017-10-12',
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				var title = prompt('Event Title:');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'Cita con proveedor',
					start: '2017-10-01'
				},
				{
					title: 'Junta',
					start: '2017-10-07',
					end: '2017-10-10'
				},
				{
					id: 999,
					title: 'Reenviar cotización',
					start: '2017-10-10T16:00:00'
				},
				{
					id: 999,
					title: 'Fecha concurso',
					start: '2017-10-16T16:00:00'
				},
				{
					title: 'Cita con proveedor',
					start: '2017-10-11',
					end: '2017-10-13'
				},
				{
					title: 'Junta',
					start: '2017-10-12T10:30:00',
					end: '2017-10-12T12:30:00'
				},
				{
					title: 'Comida',
					start: '2017-10-12T12:00:00'
				},
				{
					title: 'Cita con proveedor',
					start: '2017-10-12T14:30:00'
				},
				{
					title: 'Confirmar cotización',
					start: '2017-10-12T17:30:00'
				},
				{
					title: 'Capacitación',
					start: '2017-10-12T20:00:00'
				},
				{
					title: 'Cita con proveedor',
					start: '2017-10-13T07:00:00'
				},
				{
					title: 'Click para Google',
					url: 'http://google.com/',
					start: '2017-10-28'
				}
			]
		});
	});
</script>
<style>
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>

<div id='calendar'></div>