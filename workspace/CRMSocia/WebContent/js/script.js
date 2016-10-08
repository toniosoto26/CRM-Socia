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


function trim(cadena){
	var retorno=cadena.replace(/^\s+/g,'');
	retorno=retorno.replace(/\s+$/g,'');
	return retorno;
}