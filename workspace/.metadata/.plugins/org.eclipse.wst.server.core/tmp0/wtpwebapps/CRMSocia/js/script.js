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
				$("#result").html(response);
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