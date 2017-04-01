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
						"passwd": passwdLogin,
						"opc"	: 1
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


function activeSession(){
	var datos		=	{
			
			"opc"	: 2
			}
	$.ajax({
		type: "post",
		url : "ControllerLogin",
		data: datos,
		success: function(response){
			if(trim(response) === "correcto"){
				return true;
			}
			else{
				alertify.alert("Sesion terminada.")
				document.location.href	=	"index.jsp";
			}
			$("#mostrar").show();
		},
		error: function(){
			//$("#result").html("Datos incorrectos.");
			alertify.alert("Error");
		}
	});
	
}


function validarCampos(user,passwd){
	if(user == "" || passwd == ""){
		alertify.alert("No debe haber campos vacios.")
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
			$("#chosenContact").chosen();
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
			$("#chosenClient").chosen();
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}


function loadClientType(selected){
	var clientId = 1;
	if(selected != undefined)
		clientId = selected.value;

	
	$.ajax({
		type:"post",
		url:"ControllerTemp",
		data: {
			"option":13, 
		    clientId: clientId
		},
		success: function(response){
			$("#clientTypeContainer").html(response);
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	});
}

function selectContact(selected){
	var clientId = 1;
	if(selected != undefined)
		clientId = selected.value;
	$.ajax({
		type:"post",
		url:"Controller",
		data: {
			option:2,
			clientId: clientId
		},
		success: function(response){
			$("#selectContact").html(response);
			$("#chosenContact").chosen();
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
			$("#chosenPosition").chosen();
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
			$("#chosenDivision").chosen();
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
					
					var today = moment().format('YYYY-MM-DD');
					var end = moment().subtract(7, "day").format('YYYY-MM-DD');
					
					$("#pageContent").removeClass("welcome");
					$("#pageHeader").html('<ol class="breadcrumb">'+
							  '<li><a href="#">Inicio</a></li>'+
							  '<li>Llamadas</li>'+
							  '<li class="active">Historial de llamadas</li>'+
							'</ol>');
					$("#pageContent").load("CallLog.jsp");
					
					setTimeout(function(){
						$('#dtp_input1').val(end);
						$('#dtp_input2').val(today);
						ValidaIndicadorLlamadas();
					}, 500);
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
	//alert("Entre a la maldita validacion");
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
			$("#bdmI").chosen();
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


function sendMailCall(opcion){
	$.ajax({
		type: "post",
		url : "Controller",
		data: {
			option:opcion
		},
		beforeSend: function(){
			alertify.set({ delay: 3000 });
			alertify.log("<center><i class='fa fa-cog fa-spin fa-3x fa-fw'></i><br> Enviando...</center>");
		}, 
		
		success: function(response){
			if(trim(response)=="correcto"){
				alertify.alert("Correo enviado correctamente");
				$('#addQuotation').find("input[type=text], textarea, select, input[type=number]").val("");
			}
			else{
				alertify.alert("Incorrecto");			
			}
			console.log("success");
		},
		error: function(){
			alert("Error");
		}
	});
	
	return false;
}



function openSecondaryPanel(close, options){
	if(options == 0){
		$("#openPanel").html(
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\', '+options+');">Citas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\', '+options+');">Cotizaciones</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\', '+options+');">Calendario</button>');
	}
	if(options == 1){
		$("#openPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\', '+options+');">Llamadas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\', '+options+');">Citas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\', '+options+');">Calendario</button>');
	}
	if(options == 2){
		$("#openPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\', '+options+');">Llamadas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'appointment\', '+options+');">Citas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\', '+options+');">Cotizaciones</button>');
	}
	if(options == 3){
		$("#openPanel").html('<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'call\', '+options+');">Llamadas</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'quotation\', '+options+');">Cotizaciones</button>&nbsp;&nbsp;'+
				'<button type="button" class="btn btn-primary" onClick="selectSecondaryPanel(\'calendar\', '+options+');">Calendario</button>');
	}
	
	if(close == 1){
		$("#secondaryPanel").removeClass('col-md-6');
		$("#secondaryPanel").removeClass('col-sm-6');
		$("#primaryPanel").css({"border-right": ""});
		
		$("#secondaryPanel").html('');
		
		$("#primaryPanel").removeClass('col-md-6');
		$("#primaryPanel").removeClass('col-sm-6');
		
		$("#openPanel").html('<small>Haz clic para abrir un panel secundario </small><button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(0,'+options+');" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Segundo Panel</button>');
	}
}

function selectSecondaryPanel(optionName, options){
	$("#secondaryPanel").addClass('col-md-6');
	$("#secondaryPanel").addClass('col-sm-6');
	$("#primaryPanel").css({"border-right": "1px solid rgba(0,0,0,0.05)"});

	$("#primaryPanel").addClass('col-md-6');
	$("#primaryPanel").addClass('col-sm-6');
	
	$("#openPanel").html('<button type="button" class="btn btn-default btn-sm" onclick="openSecondaryPanel(1,'+options+');" >Cerrar <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> </button>');
	
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


