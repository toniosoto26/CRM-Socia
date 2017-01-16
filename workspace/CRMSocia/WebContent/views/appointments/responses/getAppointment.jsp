<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	var today = moment().format('YYYY-MM-DD');

	$(document).ready(function() {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay,listWeek'
			},
			lang: 'en',
			defaultDate: today, 
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				/*var eventData;
				eventData = {
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true*/
				
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventClick: function(calEvent, jsEvent, view) {

		        alert('Event: ' + calEvent.title);
		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
		        alert('View: ' + view.name);

		        // change the border color just for fun
		        $(this).css('border-color', 'red');

		    },
			events: [
						<c:choose>
							<c:when test="${not empty sessionScope.calendarAppointment}">
								<c:forEach items="${sessionScope.calendarAppointment}" var="calendar" varStatus="calenCount">
									{
										title: 'Cita con <c:out value="${calendar.companyName}"></c:out>',
										start: '<c:out value="${calendar.date}"></c:out>',
										color: '#6083e4'
									},
								</c:forEach>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${not empty sessionScope.calendarTender}">
								<c:forEach items="${sessionScope.calendarTender}" var="calendar" varStatus="calenCount">
									{
										<c:choose>
											<c:when test="${calendar.startUpDate != null}">
												title: 'Inicio gestión <c:out value="${calendar.companyName}"></c:out> en <c:out value="${calendar.businessLineName}"></c:out>',
												start: '<c:out value="${calendar.startUpDate}"></c:out>',
												color: '#57d896'
											</c:when>
											<c:otherwise>
												title: 'Concurso <c:out value="${calendar.companyName}"></c:out> en <c:out value="${calendar.businessLineName}"></c:out>',
												start: '<c:out value="${calendar.deadline}"></c:out>',
												color: '#de2c16'
											</c:otherwise>
										</c:choose>
									},
								</c:forEach>
							</c:when>
						</c:choose>
						{
							title: 'Test',
							start: '2016-12-08'
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