/**
 * AS
 */
$( document ).ready(function() {
	getInfo("P");
	getInfo("A");
});

function getInfo(type){
	$.ajax({
		type:"post",
		url:"ControllerDiagnosis",
		data: {"option":1, "type": type},
		success: function(response){
			if(type=="P"){
				$("#selectProspD").html(response);
				$(".chosen-select").chosen();				
			}else{
				$("#selectClientD").html(response);
				$(".chosen-select").chosen();				
			}
			
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
		data: {"option":2, "type": type, "clientId":value},
		success: function(response){
			$("#response").html(response);
			if(type == "P"){
				getInfo("A");
			}else{
				getInfo("P");
			}
			
		},
		error: function(){
			alertify.alert("no funciona");
			
		}
	})
	
}
