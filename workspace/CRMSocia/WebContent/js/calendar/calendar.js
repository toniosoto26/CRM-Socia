
$(document).ready(function() {
	if(activeSession()){
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
	}
	
	selectClient('call');
	selectBusinessLine();
});

$('.form_date').datetimepicker({
    language:  'es',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});


function selectBusinessLine(){
	if(activeSession()){
		$.ajax({
			type:"post",
			url:"ControllerTemp",
			data: {"option":7},
			success: function(response){
				$("#selectBusinessLine").html(response);
				$(".chosen-select").chosen();
			},
			error: function(){
				alertify.alert("no funciona");
			}
		});
	}
}

function addTender(){
	
	if($("#chosenClient").val()== "0"){
		alertify.alert("Por favor, selecciona un cliente");
		return false;
	}
	
	if($("#business-select").val()== ""){
		alertify.alert("Por favor, selecciona una línea de negocio");
		return false;
	}
	
	if($("#dtp_input3").val()== ""){
		alertify.alert("Por favor, selecciona fecha de cierre");
		return false;
	}
	
	if(activeSession()){
		$.ajax({
			type: "post",
			url : "ControllerTemp",
			data: $("#addTender").serialize()+"&option=8",
			success: function(response){
				if(trim(response)>0){
			        var firstDate = $("#dtp_input1").val();
			        var secondDate = $("#dtp_input2").val();
			        var thirdDate = $("#dtp_input3").val();
			        
					var fourthDate = moment(secondDate).clone().subtract(2, 'month');
			        
					var client = $("#chosenClient :selected").text();
					var businessLine = $("#business-select :selected").text();
	
			        var firstEvent = {
			          id: 'ten-'+response.trim(),
			          title:"Inicio gestión "+client+" en "+businessLine,
			          start: firstDate,
			          color: '#4395ff'
			        };
			        
			        var secondEvent = {
			          id: 'ten-'+response.trim(),
			          title:"Concurso "+client+" en "+businessLine,
			          start: secondDate,
			          color: '#0ee196'
			        };
			        
			        var thirdEvent = {
			          id: 'ten-'+response.trim(),
			          title:"Entrega de RFP para "+client+" en "+businessLine,
			          start: thirdDate,
			          color: '#ff0026'
			        };
			        
			        var fourthEvent = {
			          id: 'ten-'+response.trim(),
			          title:"Preparación para "+client+" en "+businessLine,
			          start: fourthDate.format('YYYY-MM-DD'),
			          color: '#fbb45e'
			        };
			        
			        $('#calendar').fullCalendar( 'renderEvent', firstEvent, true);
			        $('#calendar').fullCalendar( 'renderEvent', secondEvent, true);
			        $('#calendar').fullCalendar( 'renderEvent', thirdEvent, true);
			        $('#calendar').fullCalendar( 'renderEvent', fourthEvent, true);
					
					alertify.alert("Fecha concurso guardada correctamente");
					$('#addTender').find("input[type=text], textarea, select, input[type=number]").val("");
	
					$('#myModal').modal('toggle');
				}
				else{
					alertify.alert("Incorrecto");			
				}
				console.log("success");
			},
			error: function(){
				alertify.alert("Error");
			}
		});
	}
		
	return false;
}

function viewCalendarDetail(calendarEvent){
	$('#detailModal').modal('toggle');
	
	if(activeSession()){
		$.ajax({
			type:"post",
			url:"ControllerTemp",
			data: {"option":14, event: calendarEvent },
			beforeSend: function(){$('#detailModalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");}, 
			success: function(response){
				$("#detailModalContent").html(response);
				if(calendarEvent.includes("ten")){
					$(".modal-title").text("Detalle concurso");
				}
				else{
					$(".modal-title").text("Detalle cita");
				}
			},
			error: function(){
				alertify.alert("no funciona");
			}
		});
	}
}