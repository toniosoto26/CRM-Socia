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
					alert("Acceso incorrecto.")
				$("#mostrar").show();
			},
			error: function(){
				//$("#result").html("Datos incorrectos.");
				alert("Error");
			}
		});
	}
}

function validarCampos(user,passwd){
	if(user == "" || passwd == ""){
		alert("No debe de haber campos vacios.")
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
			alert("Error");
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
			alert("Error");
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
			alert("Error");
		}
	});
}

function selectClient(){
	
	$.ajax({
		type:"post",
		url:"Controller",
		data: {"option":1},
		success: function(response){
			$("#selectClient").html(response);
			$(".chosen-select").chosen();
		},
		error: function(){
			alert("no funciona");
			
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
			alert("no funciona");
			
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
			alert("no funciona");
			
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
			alert("no funciona");
			
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
		alert(validacion);
	}
	else{
		
		$.ajax({
			type: "post",
			url : "Controller",
			data: $("#formCalls").serialize()+"&option=4&variable="+variable,
			success: function(response){
				if(trim(response)=="correcto"){
					alert("Insertado Correctamente");
					$("#form1").html("");
				}
				else{
					alert("Incorrecto");
				}
			},
			error: function(){
				alert("Error");
			}
		});
		
		
		
		
		
	}
	
}

function validateCalls(){
	var mensaje="";
	if($("#observation").val() == ""){
		mensaje="Es necesario Capturar las observaciones ";
	}
	if($("#companyPhone").val() == ""){
		mensaje="Es necesario Capturar telefono ";
	}
	if($("#companyEmail").val() == ""){
		mensaje="Es necesario Capturar email ";
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
			alert("no jalo");
			
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
			alert("Error");
		}
	});
}


