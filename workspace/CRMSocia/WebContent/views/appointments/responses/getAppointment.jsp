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
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventClick: function(calEvent, jsEvent, view) {
				viewCalendarDetail(calEvent.id);
		        
		        // change the border color just for fun
		        $(this).css('border-color', 'red');
		    },
			events: [
						<c:choose>
							<c:when test="${not empty sessionScope.calendarTender}">
								<c:forEach items="${sessionScope.calendarTender}" var="calendar" varStatus="calenCount">
									{
										<c:choose>
											<c:when test="${calendar.startUpDate != null}">
												id: 'ten-<c:out value="${calendar.tenderId}"></c:out>',
												title: 'Inicio gestión <c:out value="${calendar.companyName}"></c:out> en <c:out value="${calendar.businessLineName}"></c:out>',
												start: '<c:out value="${calendar.startUpDate}"></c:out>',
												color: '#57d896'
											</c:when>
											<c:otherwise>
												id: 'ten-<c:out value="${calendar.tenderId}"></c:out>',
												title: 'Concurso <c:out value="${calendar.companyName}"></c:out> en <c:out value="${calendar.businessLineName}"></c:out>',
												start: '<c:out value="${calendar.deadline}"></c:out>',
												color: '#de2c16'
											</c:otherwise>
										</c:choose>
									},
								</c:forEach>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${not empty sessionScope.calendarAppointment}">
								<c:forEach items="${sessionScope.calendarAppointment}" var="calendar" varStatus="calenCount">
									<c:choose>
										<c:when test="${!calenCount.last}">
											{
												id: 'apo-<c:out value="${calendar.crmAppointmentId}"></c:out>',
												title: 'Cita con <c:out value="${calendar.companyName}"></c:out>',
												start: '<c:out value="${calendar.date}"></c:out>',
												color: '#6083e4'
											},
										</c:when>
										<c:otherwise>
											{
												id: 'apo-<c:out value="${calendar.crmAppointmentId}"></c:out>',
												title: 'Cita con <c:out value="${calendar.companyName}"></c:out>',
												start: '<c:out value="${calendar.date}"></c:out>',
												color: '#6083e4'
											}
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:when>
						</c:choose>
					]
		});
	});
</script>

<div id='calendar'></div>

<!-- Modal -->
<div class="modal fade" id="detailModal" role="dialog">
	<div class="modal-dialog" style="width:60%">
    	<!-- Modal content-->
      	<div class="modal-content">
        	<div class="modal-header">
          		<button type="button" class="close" data-dismiss="modal">&times;</button>
          		<h4 class="modal-title">Detalle</h4>
        	</div>
        	<div class="modal-body" id="detailModalContent"></div>
      	</div>
    </div>
</div>