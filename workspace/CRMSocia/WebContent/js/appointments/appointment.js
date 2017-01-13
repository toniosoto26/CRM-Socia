/**
 * Antonio Soto 
 */

$( document ).ready(function() {
	selectClient('appointment');
	selectBDM();
	
	
	$("#modified").hide();
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


$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  var target = $(e.target).attr("href") // activated tab
  
  if(target == "#add"){
	  $("#street").prop('required',true);
	  $("#intNum").prop('required',true);
	  $("#city").prop('required',true);
	  $("#zipCode").prop('required',true);
	  $("#extNum").prop('required',true);
	  $("#suburb").prop('required',true);
	  $("#state").prop('required',true);
	  $("#country").prop('required',true);
  }
  else{
	  $("#street").prop('required',false);
	  $("#intNum").prop('required',false);
	  $("#city").prop('required',false);
	  $("#zipCode").prop('required',false);
	  $("#extNum").prop('required',false);
	  $("#suburb").prop('required',false);
	  $("#state").prop('required',false);
	  $("#country").prop('required',false);
  }
});


function uploadInfo(selected){
	var info = selected.value;
	var arr = info.split(',');
	var contactId	=	arr[0];
	var	phone		=	arr[1];
	var	email		=	arr[2];
	var	nameI		=	arr[3];
	
	$("#modified").hide();
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
		$("#phoneContactH").val(trim(phone));
		$("#emailContactH").val(trim(email));
		$("#phoneContact").attr("readonly",false);
		$("#emailContact").attr("readonly",false);
		$("#idContactI").val(contactId);
		$("#idNameI").val(trim(nameI));
	}
	
}

function validateCon(){
	

	var	rz			=	$("#chosenClient").val();
	var	days		=	$("#dtp_input2").val();
	var	hrs			=	$("#dtp_input3").val();
	var	contact		=	$("#contactI").val();
	var phoneI		=	$("#phoneContact").val();
	var	emailI		=	$("#emailContact").val();
	var	bdmI		=	$("#bdmI").val();
	var	nameI		=	$("#idNameI").val();
	var activeTab	= 	$('.nav-tabs .active').text();
	
	
	if(activeTab == "SELECCIONAR"){
		if($("#address-select").val() != undefined){
			if($("#address-select").val()==""){
				alertify.alert("Por favor, selecciona una dirección");
				return false;
			}
		}
		else{
			alertify.alert("Por favor, agrega una dirección");
			return false;
		}
	}
	if(rz	== 5){
		alertify.alert("Debe seleccionar Razón Social.");
		return false;
	}else if(days == ""){
		alertify.alert("Debe seleccionar una fecha.");
		return false;
	}else if(hrs == ""){
		alertify.alert("Debe seleccionar una hora.");
		return false;
	}else if(contact == ""){
		alertify.alert("Debe seleccionar un contacto.");
		return false;
	}else if(phoneI == ""){
		alertify.alert("Debe seleccionar un telefono.");
		return false;
	}else if(emailI == ""){
		alertify.alert("Debe seleccionar un email.");
		return false;
	}else if(bdmI == ""){
		alertify.alert("Debe seleccionar DBM.");
		return false;
	}else{
		return true;
	}
	
		
}

function reviewAppo(){
	var	rz		=	$("#chosenClient");
	var	contact	=	$("#contactI").val();
	var arr = contact.split(',');
	var contactId	=	arr[0];
	var	days	=	$("#dtp_input2").val();
	var	hrs		=	$("#dtp_input3").val();
	
	var datos = {
			"rz"		:	rz.val(),
			"contact"	:	contactId,
			"days"		:	days,
			"hrs"		:	hrs,
			"opc"		:	5
			};
	$.ajax({
		type: "post",
		url : "ControllerAppointment",
		data: datos,
		success: function(response){
			
			if(response == ""){
				alertify.alert("vacio");
				return true;
			}else{
				alertify.alert("lleno");
				return confirm(trim(response));
			}
		},
		error: function(){
			alertify.alert("Error");
		}
	});
	
}

/**
 * Antonio Soto 
 */

$( document ).ready(function() {
	selectClient('appointment');
	selectBDM();
	
	
	$("#modified").hide();
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


$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
  var target = $(e.target).attr("href") // activated tab
  
  if(target == "#add"){
	  $("#street").prop('required',true);
	  $("#intNum").prop('required',true);
	  $("#city").prop('required',true);
	  $("#zipCode").prop('required',true);
	  $("#extNum").prop('required',true);
	  $("#suburb").prop('required',true);
	  $("#state").prop('required',true);
	  $("#country").prop('required',true);
  }
  else{
	  $("#street").prop('required',false);
	  $("#intNum").prop('required',false);
	  $("#city").prop('required',false);
	  $("#zipCode").prop('required',false);
	  $("#extNum").prop('required',false);
	  $("#suburb").prop('required',false);
	  $("#state").prop('required',false);
	  $("#country").prop('required',false);
  }
});


function uploadInfo(selected){
	var info = selected.value;
	var arr = info.split(',');
	var contactId	=	arr[0];
	var	phone		=	arr[1];
	var	email		=	arr[2];
	var	nameI		=	arr[3];
	
	$("#modified").hide();
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
		$("#phoneContactH").val(trim(phone));
		$("#emailContactH").val(trim(email));
		$("#phoneContact").attr("readonly",false);
		$("#emailContact").attr("readonly",false);
		$("#idContactI").val(contactId);
		$("#idNameI").val(trim(nameI));
	}
	
}

function validateCon(){
	

	var	rz			=	$("#chosenClient").val();
	var	days		=	$("#dtp_input2").val();
	var	hrs			=	$("#dtp_input3").val();
	var	contact		=	$("#contactI").val();
	var phoneI		=	$("#phoneContact").val();
	var	emailI		=	$("#emailContact").val();
	var	bdmI		=	$("#bdmI").val();
	var	nameI		=	$("#idNameI").val();
	var activeTab	= 	$('.nav-tabs .active').text();
	
	
	if(activeTab == "SELECCIONAR"){
		if($("#address-select").val() != undefined){
			if($("#address-select").val()==""){
				alertify.alert("Por favor, selecciona una dirección");
				return false;
			}
		}
		else{
			alertify.alert("Por favor, agrega una dirección");
			return false;
		}
	}
	if(rz	== 5){
		alertify.alert("Debe seleccionar Razón Social.");
		return false;
	}else if(days == ""){
		alertify.alert("Debe seleccionar una fecha.");
		return false;
	}else if(hrs == ""){
		alertify.alert("Debe seleccionar una hora.");
		return false;
	}else if(contact == ""){
		alertify.alert("Debe seleccionar un contacto.");
		return false;
	}else if(phoneI == ""){
		alertify.alert("Debe seleccionar un telefono.");
		return false;
	}else if(emailI == ""){
		alertify.alert("Debe seleccionar un email.");
		return false;
	}else if(bdmI == ""){
		alertify.alert("Debe seleccionar DBM.");
		return false;
	}else{
		return true;
	}
	
		
}

function reviewAppo(){
	var	rz		=	$("#chosenClient");
	var	contact	=	$("#contactI").val();
	var arr = contact.split(',');
	var contactId	=	arr[0];
	var	days	=	$("#dtp_input2").val();
	var	hrs		=	$("#dtp_input3").val();
	
	var datos = {
			"rz"		:	rz.val(),
			"contact"	:	contactId,
			"days"		:	days,
			"hrs"		:	hrs,
			"opc"		:	5
			};
	$.ajax({
		type: "post",
		url : "ControllerAppointment",
		data: datos,
		success: function(response){
			
			if(response == ""){
				alertify.alert("vacio");
				return true;
			}else{
				alertify.alert("lleno");
				return confirm(trim(response));
			}
		},
		error: function(){
			alertify.alert("Error");
		}
	});
	
}

function saveInfo(){
	if(validateCon()){
		//alert("-------------> "+reviewAppo());
		//if(reviewAppo()){
			
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
			
			var activeTab	= 	$('.nav-tabs .active').text();
			
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
				data: $("#addAppointment").serialize()+"&opc=3&activeTab="+activeTab,
				success: function(response){
					//alertify.alert(trim(response));
					alert("------------> "+response);
					$("#pageContent").load("/CRMSocia/views/appointments/generateAppointments.jsp");
					return false;
				},
				error: function(){
					alertify.alert("Error");
					return false;
				}
			});
		//}
		
	}
	return false;
}

function validateMod(){
	var	rz		=	$("#chosenClient");
	var phone	=	$("#phoneContact");
	var	email	=	$("#emailContact");
	
	if(rz.val() == 5){
		alertify.alert("Debe seleccionar Razón Social.");
		return false;
	}else if(phone.val() == ""){
		alertify.alert("El campo de telefono no debe de ser vacio.");
		return false;
	}else if(email.val() == ""){
		alertify.alert("El campo de email no debe de ser vacio.");
		return false;
	}else{
		return true;
	}
}

function modifiedInfo(){
	
	var phone	=	$("#phoneContact");
	var	phoneM	=	$("#phoneContactH");
	var	email	=	$("#emailContact");
	var	emailM	=	$("#emailContactH");
	var	contact	=	$("#contactI");
	
	if(contact.val() != 0 && (phone.val() !== phoneM.val() || email.val() !== emailM.val())){
		$("#modified").show();
		if(phone.val() == ""){
			alertify.alert("El campo Telefono no debe ser vacio.");
			return false;
		}else if(email.val() == ""){
			alertify.alert("El campo Email no debe ser vacio.");
			return false;
		}else{
			return true;
		}
	}
	else{
		$("#modified").hide();
		return false;
	}
	
}

function SaveModifiedInformation(){
	if(modifiedInfo()){
		var	rz		=	$("#chosenClient");
		var phone	=	$("#phoneContact");
		var	email	=	$("#emailContact");
		var	contact	=	$("#contactI").val();
		var arr = contact.split(',');
		var contactId	=	arr[0];
		
		var datos = {
					"rz"	:	rz.val(),
					"phone"	:	phone.val(),
					"email"	:	email.val(),
					"contact":	contactId,
					"opc"	:	4
					};
		
		$.ajax({
			type: "post",
			url : "ControllerAppointment",
			data: datos,
			success: function(response){
				alertify.alert(trim(response));
			},
			error: function(){
				alertify.alert("Error");
			}
		});
		
	}
}

function loadAddressInfo(selected){
	var clientId = selected.value;
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: {
			option: 1, 
			clientId: clientId
		},
		success: function(response){
			$("#addressInfo").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alert("Error");
		}
	});
}


function validateMod(){
	var	rz		=	$("#chosenClient");
	var phone	=	$("#phoneContact");
	var	email	=	$("#emailContact");
	
	if(rz.val() == 5){
		alertify.alert("Debe seleccionar Razón Social.");
		return false;
	}else if(phone.val() == ""){
		alertify.alert("El campo de telefono no debe de ser vacio.");
		return false;
	}else if(email.val() == ""){
		alertify.alert("El campo de email no debe de ser vacio.");
		return false;
	}else{
		return true;
	}
}

function modifiedInfo(){
	
	var phone	=	$("#phoneContact");
	var	phoneM	=	$("#phoneContactH");
	var	email	=	$("#emailContact");
	var	emailM	=	$("#emailContactH");
	var	contact	=	$("#contactI");
	
	if(contact.val() != 0 && (phone.val() !== phoneM.val() || email.val() !== emailM.val())){
		$("#modified").show();
		if(phone.val() == ""){
			alertify.alert("El campo Telefono no debe ser vacio.");
			return false;
		}else if(email.val() == ""){
			alertify.alert("El campo Email no debe ser vacio.");
			return false;
		}else{
			return true;
		}
	}
	else{
		$("#modified").hide();
		return false;
	}
	
}

function SaveModifiedInformation(){
	if(modifiedInfo()){
		var	rz		=	$("#chosenClient");
		var phone	=	$("#phoneContact");
		var	email	=	$("#emailContact");
		var	contact	=	$("#contactI").val();
		var arr = contact.split(',');
		var contactId	=	arr[0];
		
		var datos = {
					"rz"	:	rz.val(),
					"phone"	:	phone.val(),
					"email"	:	email.val(),
					"contact":	contactId,
					"opc"	:	4
					};
		
		$.ajax({
			type: "post",
			url : "ControllerAppointment",
			data: datos,
			success: function(response){
				alertify.alert(trim(response));
			},
			error: function(){
				alertify.alert("Error");
			}
		});
		
	}
}

function loadAddressInfo(selected){
	var clientId = selected.value;
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: {
			option: 1, 
			clientId: clientId
		},
		success: function(response){
			$("#addressInfo").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alert("Error");
		}
	});
}
