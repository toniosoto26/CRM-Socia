$( document ).ready(function() {
	
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
});

function ValidaIndicadorLlamadas(){
	/* var fech1=$("#fechaIni").val(); 
	var fech2=$("#fechaFin").val(); */
	var fech1="01/01/2016";
	var fech2="10/01/2017";
	var user=45;
	if(fech1== ""){
		showAlert("Fecha inicio no puede ser vacia","danger","alertaFecha");
	}
	else if(fech2== ""){
		showAlert("Fecha Corte no puede ser vacia","danger","alertaFecha");
	}
	else{
		
		var datos= {fechaIni:fech1,
				fechaFin:fech2,
				idUser:user,
				option:8};
		
		$.ajax({
			url: "Controller",
			type :"post",
			data :datos,
			beforeSend: function(){$('#tablaLlamadas').html("<center><img src='/images/ajax-loader (1).gif' border='0'><br> Cargando...</center>");},
	         success: function(dataResponse){
	        	
	        	 setTimeout(function(){
	        		 $('#tablaLlamadas').html(dataResponse);
	        		        $('#tablaCalls').DataTable({
	        		                responsive: true,
	        		                "iDisplayLength":100,
	        		                "bSort": true,
	        		                "dom": 'Bfrtip',
	        		                buttons: [
	        		                    'copy', 'csv', 'excel', 'pdf', 'print'
	        		                ],
	        		                "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
	        		                    if ( aData[1].substring(0,15) == "OPCION1" )
	        		                    {
	        		                        $('td', nRow).css('background-color', '#81BEF7');
	        		                    }
	        		                    else if ( aData[1] == "OPCION2" )
	        		                    {
	        		                        $('td', nRow).css('background-color', '#40FF00');
	        		                    }
	        		                    else if ( aData[1] == "OPCION3" )
	        		                    {
	        		                        $('td', nRow).css('background-color', '#FAAC58');
	        		                    }
	        		                }
	        		        });
	        		    
	        	 }, 2000);
	         },
	         error: function(XMLHttpRequest, textStatus, errorThrown){showAlert(errorThrown,"danger","alertaFecha");}
		});
		
	}
	
	
}
