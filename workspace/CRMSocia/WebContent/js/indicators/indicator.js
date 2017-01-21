function loadIndicator(){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	$("#indicators").html('');

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

$( document ).ready(function() {
	loadIndicator();
});

function loadCallDetail(type, fechaIni, fechaFin){
	var datos= {fechaIni:fechaIni,
				fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
				clientType: type,
				option:8};
	
	$.ajax({
		url: "Controller",
		type :"post",
		data :datos,
		beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
         success: function(dataResponse){
        	 setTimeout(function(){
        		 $('#modalContent').html(dataResponse);
        		 $(".modal-title").text('Llamadas');
        	 }, 2000);
         },
         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
	});
}

function loadAppointmentDetail(type, fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			clientType: type,
			option:10
	};
	
	$.ajax({
		url: "ControllerTemp",
		type :"post",
		data :datos,
		beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
         success: function(dataResponse){
        	 setTimeout(function(){
        		 $('#modalContent').html(dataResponse);
        		 $(".modal-title").text('Citas');
        	 }, 2000);
         },
         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
	});
}

function loadTenderDetail(fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			option:11
	};
	
	$.ajax({
		url: "ControllerTemp",
		type :"post",
		data :datos,
		beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
         success: function(dataResponse){
        	 setTimeout(function(){
        		 $('#modalContent').html(dataResponse);
        		 $(".modal-title").text('Concursos');
        	 }, 2000);
         },
         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
	});
}

function loadQuotationDetail(fechaIni, fechaFin){
	var datos= {
			fechaIni:fechaIni,
			fechaFin:(fechaFin==undefined?fechaIni:fechaFin),
			option:12
	};
	
	$.ajax({
		url: "ControllerTemp",
		type :"post",
		data :datos,
		beforeSend: function(){$('#modalContent').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");},
         success: function(dataResponse){
        	 setTimeout(function(){
        		 $('#modalContent').html(dataResponse);
        		 $(".modal-title").text('Cotizaciones');
        	 }, 2000);
         },
         error: function(XMLHttpRequest, textStatus, errorThrown){alertify.alert(errorThrown);}
	});
}