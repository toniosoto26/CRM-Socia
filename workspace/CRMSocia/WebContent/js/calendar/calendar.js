
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
	})
}

function addTender(){
	
	if($("#chosenClient").val()== "5"){ //Corregir
		alertify.alert("Por favor, selecciona un cliente");
		return false;
	}
	
	if($("#business-select").val()== ""){
		alertify.alert("Por favor, selecciona una línea de negocio");
		return false;
	}
	
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: $("#addTender").serialize()+"&option=8",
		success: function(response){
			if(trim(response)=="correcto"){
		        var firstDate = $("#dtp_input1").val();
		        var secondDate = $("#dtp_input2").val();
				var client = $("#chosenClient :selected").text();
				var businessLine = $("#business-select :selected").text();

		        var firstEvent = {
		          title:"Inicio gestión "+client+" en "+businessLine,
		          start: firstDate,
		        };
		        
		        var secondEvent = {
		          title:"Concurso "+client+" en "+businessLine,
		          start: secondDate,
		        };
		        
		        $('#calendar').fullCalendar( 'renderEvent', firstEvent, true);
		        $('#calendar').fullCalendar( 'renderEvent', secondEvent, true);
				
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
	
	return false;
}

function viewCalendarDetail(calendarEvent){
	$('#detailModal').modal('toggle');
	
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
	})
}