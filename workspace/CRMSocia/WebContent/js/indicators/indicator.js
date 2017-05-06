function loadIndicator(){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	$("#indicators").html('');

	if(activeSession()){
		$.ajax({
			type:"post",
			url:"ControllerTemp",
			data: {option:9, startDate: startDate, endDate: endDate},
			beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");}, 
			success: function(response){
				setTimeout(function(){
					$("#indicators").html(response);
	        	 }, 500);
			},
			error: function(){
				alertify.alert("no funciona");
			}
		});
	}
}

$( document ).ready(function() {
	loadIndicator();
});

function loadCallDetail(type, fechaIni, fechaFin){
	var datos= {fechaIni:fechaIni,
				fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
				clientType: type,
				option:8};
	$(".modal-title").text('Llamadas');
	
	if(activeSession()){
		$.ajax({
			url: "Controller",
			type :"post",
			data :datos,
			beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
	         success: function(dataResponse){
	        	 setTimeout(function(){
	        		 $('#modalContent').html(dataResponse);
	        	 }, 2000);
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
		});
	}
}

function loadAppointmentDetail(type, fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			clientType: type,
			option:10
	};
	
	$(".modal-title").text('Citas');
	if(activeSession()){
		$.ajax({
			url: "ControllerTemp",
			type :"post",
			data :datos,
			beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
	         success: function(dataResponse){
	        	 setTimeout(function(){
	        		 $('#modalContent').html(dataResponse);
	        	 }, 2000);
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
		});
	}
}

function loadTenderDetail(fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			option:11
	};

	$(".modal-title").text('Concursos');
	if(activeSession()){
		$.ajax({
			url: "ControllerTemp",
			type :"post",
			data :datos,
			beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
	         success: function(dataResponse){
	        	 setTimeout(function(){
	        		 $('#modalContent').html(dataResponse);
	        	 }, 2000);
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
		});
	}
}

function loadQuotationDetail(fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			option:12
	};
	$(".modal-title").text('Cotizaciones');
	
	if(activeSession()){
		$.ajax({
			url: "ControllerTemp",
			type :"post",
			data :datos,
			beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
	         success: function(dataResponse){
	        	 setTimeout(function(){
	        		 $('#modalContent').html(dataResponse);
	        	 }, 2000);
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
		});
	}
}