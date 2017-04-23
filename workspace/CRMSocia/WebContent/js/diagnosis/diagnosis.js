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
		data: {"option":2, "type": "P", diagnosis: true},
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
		data: {"option":1, "type": "A", diagnosis: true},
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
	
function validaDatos(){
	
	var cliente=document.getElementById("selectClientD_").value;
	var prospecto=document.getElementById("selectProspD_").value;
	var clienteIn=0;
	
	if(cliente==0 && prospecto==0){
		alertify.alert("Debe seleccionar un cliente o prospecto");
		return false;
	}
	
	if(cliente>0){
		clienteIn=cliente;
	}
	else{
		clienteIn=prospecto;
	}
	

	var acta=document.getElementById("acta").value;
	var rfc=document.getElementById("rfc").value;
	var r1=document.getElementById("r1").value;
	var domicilio=document.getElementById("domicilio").value;
	var EdoFinanciero=document.getElementById("EdoFinanciero").value;
	var formatoEspecial=document.getElementById("formatoEspecial").value;
	var IdLegal=document.getElementById("IdLegal").value;
	var cuenta=document.getElementById("cuenta").value;
	

	var arrDocuments=[];
	var nameArchivo="";
	var formdata = new FormData();
	var noSonPdf=0;
	
	if(acta.length > 0){
		nameArchivo=acta.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("acta", document.getElementById("acta").files[0]);
			arrDocuments.push(acta);
		}
		else{
			noSonPdf++;
		}
		
	}
	
	if(rfc.length > 0){
		nameArchivo=rfc.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("rfc", document.getElementById("rfc").files[0]);
			arrDocuments.push(rfc);
		}
		else{
			noSonPdf++;
		}
	}
	if(r1.length > 0){
		nameArchivo=r1.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("r1", document.getElementById("r1").files[0]);
			arrDocuments.push(r1);
		}
		else{
			noSonPdf++;
		}
	}
	if(domicilio.length > 0){
		nameArchivo=domicilio.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("domicilio", document.getElementById("domicilio").files[0]);
			arrDocuments.push(domicilio);
		}
		else{
			noSonPdf++;
		}
	}
	if(EdoFinanciero.length > 0){
		nameArchivo=EdoFinanciero.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("EdoFinanciero", document.getElementById("EdoFinanciero").files[0]);
			arrDocuments.push(EdoFinanciero);
		}
		else{
			noSonPdf++;
		}
	}
	if(formatoEspecial.length > 0){
		nameArchivo=formatoEspecial.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("formatoEspecial", document.getElementById("formatoEspecial").files[0]);
			arrDocuments.push(formatoEspecial);
		}
		else{
			noSonPdf++;
		}
	}
	if(IdLegal.length > 0){
		nameArchivo=IdLegal.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("IdLegal", document.getElementById("IdLegal").files[0]);
			arrDocuments.push(IdLegal);
		}
		else{
			noSonPdf++;
		}
	}
	if(cuenta.length > 0){
		nameArchivo=cuenta.split(".");
		tam=nameArchivo.length;
		if(nameArchivo[tam-1]=="pdf" || nameArchivo[tam-1]=="PDF"){
			formdata.append("cuenta", document.getElementById("cuenta").files[0]);
			arrDocuments.push(cuenta);
		}
		else{
			noSonPdf++;
		}
	}
	
	if(arrDocuments.length == 0){
		alertify.alert("Debe al menos cargar un archivo pdf");
		return false;
	}
	
	
	var xhr = new XMLHttpRequest();
    xhr.open("POST","/CRMSocia/ControllerDiagnosis?option=5&cliente="+clienteIn, true);
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
