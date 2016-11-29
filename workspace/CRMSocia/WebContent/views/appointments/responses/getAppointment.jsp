<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'Calendario',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			lang: 'en',
			defaultDate: '2016-11-12', 
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
			events: <c:choose>
					<c:when test="${not empty sessionScope.calendarAppointment}">
						[
						<c:forEach items="${sessionScope.calendarAppointment}" var="calendar" varStatus="calenCount">
							{
								title: 'Cita con <c:out value="${calendar.companyName}"></c:out>',
								start: '<c:out value="${calendar.date}"></c:out>'
							},
						</c:forEach>
							{
								title: 'Test',
								start: '2016-11-21'
							}
						]
					</c:when>
					<c:otherwise>
					
					</c:otherwise>
				</c:choose>
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