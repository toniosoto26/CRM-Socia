/**
 * Antonio Soto 
 */

$( document ).ready(function() {
	selectClient();
	selectBDM();
	
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

function uploadInfo(selected){
	var info = selected.value;
	var arr = info.split(',');
	var contactId	=	arr[0];
	var	phone		=	arr[1];
	var	email		=	arr[2];
	var	nameI		=	arr[3];
	
	
	if(info == 0){
		$("#phoneContact").val("");
		$("#emailContact").val("");
		$("#idContactI").val("");
		$("#phoneContact").attr("readonly","readonly");
		$("#emailContact").attr("readonly","readonly");
		$("#idNameI").val("");
		
	}else{
		$("#phoneContact").val(trim(phone));
		$("#emailContact").val(trim(email));	
		$("#phoneContact").attr("readonly",false);
		$("#emailContact").attr("readonly",false);
		$("#idContactI").val(contactId);
		$("#idNameI").val(trim(nameI));
	}
	
}

function validateCon(){
	
	
	var	rz		=	$("#chosenClient").val();
	var	days	=	$("#dtp_input2").val();
	var	hrs		=	$("#dtp_input3").val();
	var	contact	=	$("#contactI").val();
	var phoneI	=	$("#phoneContact").val();
	var	emailI	=	$("#emailContact").val();
	var	bdmI	=	$("#bdmI").val();
	var	nameI	=	$("#idNameI").val();
	
	if(rz	=== 5){
		alert("Debe seleccionar Razón Social.");
		return false;
	}else if(days == ""){
		alert("Debe seleccionar una fecha.");
		return false;
	}else if(hrs == ""){
		alert("Debe seleccionar una hora.");
		return false;
	}else if(contact == ""){
		alert("Debe seleccionar un contacto.");
		return false;
	}else if(phoneI == ""){
		alert("Debe seleccionar un telefono.");
		return false;
	}else if(emailI == ""){
		alert("Debe seleccionar un email.");
		return false;
	}else if(bdmI == ""){
		alert("Debe seleccionar DBM.");
		return false;
	}else{
		return true;
	}
		
}

function saveInfo(){
	if(validateCon()){
		var	rz		=	$("#chosenClient").val();
		var	days	=	$("#dtp_input2").val();
		var	hrs		=	$("#dtp_input3").val();
		var	contact	=	$("#contactI").val();
		var arr = contact.split(',');
		var contactId	=	arr[0];
	
		
		var phoneI	=	$("#phoneContact").val();
		var	emailI	=	$("#emailContact").val();
		var	bdmI	=	$("#bdmI").val();
		var	nameI	=	$("#idNameI").val();
		
		var	datos ={
					"rz"		:	rz,
					"days"		:	days,
					"hrs"		:	hrs,
					"contact"	:	contactId,
					"phoneI"	:	phoneI,
					"emailI"	:	emailI,
					"bdmI"		:	bdmI,
					"nameI"		:	nameI,
					"opc"		:	3
					}
		
		$.ajax({
			type: "post",
			url : "ControllerAppointment",
			data: datos,
			success: function(response){
				alert(trim(response));
				$("#pageContent").load("/CRMSocia/views/appointments/generateAppointments.jsp");
			},
			error: function(){
				alert("Error");
			}
		});
	}
}