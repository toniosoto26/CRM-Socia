/**
 * 
 */

function validar(){
	$("#mostrar").hide();
	$("#result").html("");
	var userLogin	=	$("#user").val();
	var	passwdLogin	=	$("#passwd").val();
	var	validar		=	validarCampos(userLogin,passwdLogin);
	var datos		=	{
						"user" : userLogin,
						"passwd": passwdLogin  
						}
	if(validar){
		$.ajax({
			type: "post",
			url : "ControllerLogin",
			data: datos,
			success: function(response){
				if(trim(response) === "correcto")
					document.location.href	=	"home.jsp";
				else
					alertify.alert("Acceso incorrecto.")
				$("#mostrar").show();
			},
			error: function(){
				//$("#result").html("Datos incorrectos.");
				alertify.alert("Error");
			}
		});
	}
}

function validarCampos(user,passwd){
	if(user == "" || passwd == ""){
		alertify.alert("No debe de haber campos vacios.")
		return false;
	}else{
		return true;
	}
}

function loadClientInfo(selected){
	var clientId = selected.value;
	$.ajax({
		type: "post",
		url : "Controller",
		data: {
			option: 2, 
			clientId: clientId
		},
		success: function(response){
			$("#clientInfo").html(response);
		},
		error: function(){
			alertify.alert("Error");
		}
	});
}


function LoadCountCall(selected){
	var clientId = selected.value;
	$.ajax({
		type: "post",
		url : "Controller",
		data: {
			option: 7, 
			clientId: clientId
		},
		success: function(response){
			$("#countCalls").html(response);
		},
		error: function(){
			alertify.alert("Error");
		}
	});
}
function loadContactInfo(selected){
	var contactId = selected.value;
	$.ajax({
		type: "post",
		url : "Controller",
		data: {
			option: 3, 
			contactId: contactId
		},
		success: function(response){
			$("#contactInfo").html(response);
		},
		error: function(){
			alertify.alert("Error");
		}
	});
}

function selectClient(view){
	$.ajax({
		type:"post",
		url:"Controller",
		data: {"option":1, view: view},
		success: function(response){
			$("#selectClient").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}

function selectContact(){
	var clientId = 1;
	$.ajax({
		type:"post",
		url:"Controller",
		data: {
			option:2,
			clientId: clientId
		},
		success: function(response){
			$("#selectContact").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}

function selectPosition(){
	$.ajax({
		type:"post",
		url:"Controller",
		data: {
			option:6
		},
		success: function(response){
			$("#selectPosition").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}

function selectDivision(){
	$.ajax({
		type:"post",
		url:"Controller",
		data: {
			option:5
			
		},
		success: function(response){
			$("#selectDivision").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}

function pintar(variable){
	
	if(variable==0){
		$("#form1").load("views/newClient.jsp");
	}
	else if(variable==1){
		$("#form1").load("views/searchClient.jsp");
	}
	else if(variable==2){
		$("#form2").load("views/newContact.jsp");
	}
	else if(variable==3){
		$("#form2").load("views/searchContact.jsp");
	}
}

function registreCall(variable){
	var validacion=validateCalls();
	
	if(validacion!= ""){
		alertify.alert(validacion);
	}
	else{
		
		$.ajax({
			type: "post",
			url : "Controller",
			data: $("#formCalls").serialize()+"&option=4&variable="+variable,
			success: function(response){
				if(trim(response)=="correcto"){
					alertify.alert("Insertado Correctamente");
					$("#form1").html("");
				}
				else{
					alertify.alert("Incorrecto");
				}
			},
			error: function(){
				alertify.alert("Error");
			}
		});
	}
	
	return false;
}

function validateCalls(){
	
	alert("Entre a la maldita validacion");
	var mensaje="";
	
		if($("#chosenClient").val() == 0){
			mensaje= "Debe seleccionar un Cliente";
		}
		if($("#chosenDivision").val() == 0){
			mensaje= "Debe seleccionar un Área";
		}
		if($("#chosenPosition").val() == 0){
			mensaje= "Debe seleccionar un puesto";
		}
	
	
	return mensaje;
}

function trim(cadena){
	var retorno=cadena.replace(/^\s+/g,'');
	retorno=retorno.replace(/\s+$/g,'');
	return retorno;
}

function selectBDM(){
	$.ajax({
		type:"post",
		url:"ControllerAppointment",
		data: {"opc":1},
		success: function(response){
			$("#selectBDM").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alertify.alert("no funcionó");
		}
	})
}

function loadContactAppointment(selected){
	var contactId = selected.value;
	$.ajax({
		type: "post",
		url : "ControllerAppointment",
		data: {
			"opc": 2, 
			"contactId": contactId
		},
		success: function(response){
			$("#result").html(response);
		},
		error: function(){
			alertify.alert("Error");
		}
	});
}

function openSecondaryPanel(close, options){
	if(options == 0){
		$("#secondaryPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\');">Cotizaciones</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\');">Citas</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\');">Calendario</button>');
	}
	if(options == 1){
		$("#secondaryPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\');">Llamadas</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\');">Citas</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\');">Calendario</button>');
	}
	if(options == 2){
		$("#secondaryPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\');">Llamadas</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\');">Cotizaciones</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\');">Citas</button>');
	}
	if(options == 3){
		$("#secondaryPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\');">Llamadas</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\');">Cotizaciones</button>'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\');">Calendario</button>');
	}
	
	if(close == 0){
		$("#secondaryPanel").addClass('col-md-6');
		$("#secondaryPanel").addClass('col-sm-6');
		$("#primaryPanel").css({"border-right": "1px solid rgba(0,0,0,0.05)"});
	
		$("#primaryPanel").addClass('col-md-6');
		$("#primaryPanel").addClass('col-sm-6');
		
		$("#openPanel").html('<button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(1,'+options+');" >Cerrar <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </button>');
	}
	else if(close == 1){
		$("#secondaryPanel").removeClass('col-md-6');
		$("#secondaryPanel").removeClass('col-sm-6');
		$("#primaryPanel").css({"border-right": ""});
		
		$("#secondaryPanel").html('');
		
		$("#primaryPanel").removeClass('col-md-6');
		$("#primaryPanel").removeClass('col-sm-6');
		
		$("#openPanel").html('<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,'+options+');" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>');
	}
}

function selectSecondaryPanel(optionName){
	if(optionName === "call"){
		$("#secondaryPanel").load("call.jsp");
	}else if(optionName === "quotation"){
		$("#secondaryPanel").load("/CRMSocia/views/quotations/quotation.jsp");
	}else if(optionName === "calendar"){
		$("#secondaryPanel").load("/CRMSocia/views/calendar/calendar.jsp");
	}else if(optionName === "appointment"){
		$("#secondaryPanel").load("/CRMSocia/views/appointments/generateAppointments.jsp");
	}else if(optionName === "diagnosis"){
		$("#secondaryPanel").load("/CRMSocia/views/diagnosis/diagnosis.jsp");
	}

}


function showAlert(message,typeAlert,nameDiv){
    var alert= '<div class="alert alert-'+typeAlert+' alert-dismissible" role="alert">';
    alert += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
    alert += message+'</div>';

    $("#"+nameDiv).html(alert);
}


