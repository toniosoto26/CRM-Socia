/**
 * 
 */

/**
 * AS
 */
$( document ).ready(function() {
	
	getInfoCliente("A");
	getInfoProspecto1("P");
});

function getInfoProspecto1(type){
	$.ajax({ 
		type:"post",
		url:"ControllerDiagnosis",
		data: {"option":2, "type": "P"},
		success: function(response){
			$("#selectProspD").html(response);		
			$(".chosen-select").chosen();		
			
		}, 
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
	
}

/*
 * $("#selectProspD").html(response);		
			$(".chosen-select").chosen();		
 * */
function getInfoCliente(type){
	$.ajax({ 
		type:"post",
		url:"ControllerDiagnosis",
		data: {"option":1, "type": "A"},
		success: function(response){
			$("#selectClientD").html(response);		
			$(".chosen-select").chosen();		
			
		}, 
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
	
}

function getDiagnosis(value, type){
	$.ajax({
		type:"post",
		url:"ControllerDiagnosis",
		data: {"option":3, "type": type, "clientId":value, diagnosis: true},
		success: function(response){
			$("#response").html(response);
			if(type == "P"){
				getInfoCliente('A');
			}else{
				getInfoProspecto1("P");
			}
			getBLDetails(value);
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
	
}

function getBLDetails(value){
	$.ajax({
		type:"post",
		url:"ControllerDiagnosis",
		data: {"option":4, "clientId":value, diagnosis: true},
		success: function(response){
			$("#blTable").html(response);
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
}
	
function validaDatos(){
	var acta=document.getElementById("acta").value;
	var nameArchivo=acta.split(".");
	if(acta.length > 0){
		var tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			
			var formdata = new FormData();
			if(document.getElementById("rfc").files.length>0)
				formdata.append("acta", document.getElementById("acta").files[0]);
			
			var xhr = new XMLHttpRequest();
	         xhr.open("POST","/CRMSocia/ControllerDiagnosis?option=5", true);
	         xhr.send(formdata);
	         xhr.onload = function(e) {
	            if (this.status == 200) {
	                if(this.responseText.indexOf("ERROR") != -1)
	                    alertify.alert(this.responseText);
	                else {
	                    alertify.alert(this.responseText);
	                }
	            }
	         };

			return false;
		}
		else{
			alertify.alert("Solo puede Cargar Archivos en Formato PDF");
			return false;
		}
		
	}
	return false;
}
