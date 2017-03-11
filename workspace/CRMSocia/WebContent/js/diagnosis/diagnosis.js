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
		data: {"option":3, "type": type, "clientId":value},
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
		data: {"option":4, "clientId":value},
		success: function(response){
			$("#blTable").html(response);
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
	
}
