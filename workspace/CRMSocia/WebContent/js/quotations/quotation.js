/**
 * Quotation functions 
 */

var itemNum = 1;
var option = 0;

function addProduct(){
	$('#productsTable > tbody:last-child').append('<tr>'+
													'<td><div id="itemNum'+itemNum+'"><div/></td>'+
													'<td><input required style="width:100%;" type="number" class="form-control" name="quantity'+itemNum+'" /></td>'+
													'<td><div id="description'+itemNum+'"><input required style="width:100%;" type="text" class="form-control" name="description'+itemNum+'" /></div></td>'+
													'<td><input required style="width:100%;" type="text" class="form-control" name="warranty'+itemNum+'" /></td>'+
													'<td><input required style="width:100%;" type="text" class="form-control" name="estimatedShipping'+itemNum+'" /></td>'+
													'<td><input style="width:100%;" type="text" pattern="^[0-9]*[\.]?[0-9]*$" class="form-control" name="unitPrice'+itemNum+'" required /><input type="hidden" value="false" name="addItem'+itemNum+'" id="addItem'+itemNum+'"  /></td>'+
												  '</tr>');
	$('#totalProducts').val(itemNum);
	loadItemsInfo(itemNum);
	
	itemNum++;
}

function displayExchangeRate(selected){
	var currency = selected.value;
	
	if(currency === "USD"){
		$("#exchangeRateInp").prop('required',true);
		$("#exchangeRate").css( "display", "block" );
		
	}
	else{
		$("#exchangeRate").css( "display", "none" );
		$("#exchangeRateInp").prop('required',false);
	}
}

function loadItemsInfo(number){
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: {
			option: 4,
			itemIndex: number
		},
		async: false,
		success: function(response){
			$("#itemNum"+number).html(response);
		},
		error: function(){
			alert("Error");
		}
	});
}

function loadDescription(selected, number){
	var itemId = selected.value;
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: {
			option: 5, 
			itemId: itemId,
			itemIndex: number
		},
		success: function(response){
			$("#description"+number).html(response);
		},
		error: function(){
			alert("Error");
		}
	});
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

function sendMail(optionSelected){
	option = optionSelected;
}

function addQuotation(){
	var activeTab = $('.nav-tabs .active').text();
	
	if($("#chosenClient").val()== "5"){ //Corregir
		alertify.alert("Por favor, selecciona un cliente");
		return false;
	}
	
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
	
	if($("#chosenContact").val()== "5"){ //Corregir
		alertify.alert("Por favor, selecciona un contacto");
		return false;
	}
	
	for(var i = 1; i < itemNum; i ++){
		if($("#itemId"+i).val()==""){
			alertify.alert("Por favor, selecciona artículos para todas las partidas");
			return false;
		}
	}
	
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: $("#addQuotation").serialize()+"&option="+option+"&activeTab="+activeTab,
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

function changeInput(index){
	$("#itemNum"+index).html('<input required style="width:100%;" type="text" class="form-control" name="itemNum'+index+'" />');
	$('#addItem'+index).val('true');
}

$( document ).ready(function() {
	selectClient();
    addProduct();
    
	// Support for AJAX loaded modal window.
	// Focuses on first input textbox after it loads the window.
	$('[data-toggle="modal"]').click(function(e) {
		e.preventDefault();
		var url = $(this).attr('href');
		var activeTab = $('.nav-tabs .active').text();
		
		$.ajax({
			type: "post",
			url : "ControllerTemp",
			data: $("#addQuotation").serialize()+"&option=3&activeTab="+activeTab,
			async: false
		});
		
		if (url.indexOf('#') == 0) {
			$(url).modal('open');
		} else {
			$.get(url, function(data) {
				$('<div class="modal fade">' + data + '</div>').modal();
			});
		}
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
