$( document ).ready(function() {
	 activeSession();
	 $('.form_datetime').datetimepicker({
	        language:  'es',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			forceParse: 0,
	        showMeridian: 1
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
		$('.form_time').datetimepicker({
	        language:  'es',
	        weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 1,
			minView: 0,
			maxView: 1,
			forceParse: 0
	    });
		
		/*$('#dtp_input1').val("2017-01-23");
		$('#dtp_input2').val("2017-01-30");
		ValidaIndicadorLlamadas();*/
});

function ValidaIndicadorLlamadas(){
	var fech1=$("#dtp_input1").val(); 
	var fech2=$("#dtp_input2").val(); 
	if(fech1== ""){
		showAlert("Fecha inicio no puede ser vacia","danger","alertaFecha");
	}
	else if(fech2== ""){
		showAlert("Fecha Corte no puede ser vacia","danger","alertaFecha");
	}
	else{
		
		var datos= {fechaIni:fech1,
				fechaFin:fech2,
				option:8};
		
		if(activeSession()){
			$.ajax({
				url: "Controller",
				type :"post",
				data :datos,
				beforeSend: function(){$('#tablaLlamadas').html("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Cargando...</center>");}, 
				 success: function(dataResponse){
		        	
		        	 setTimeout(function(){
		        		 $('#tablaLlamadas').html(dataResponse);
		        	 }, 2000);
		         },
		         error: function(XMLHttpRequest, textStatus, errorThrown){showAlert(errorThrown,"danger","alertaFecha");}
			});
		}
	}
	
}
