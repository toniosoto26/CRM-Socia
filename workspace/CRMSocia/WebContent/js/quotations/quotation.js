/**
 * Quotation functions 
 */

var itemNum = 1;

function addProduct(){
	$('#productsTable > tbody:last-child').append('<tr>'+
													'<td><div id="itemNum'+itemNum+'"><div/></td>'+
													'<td><input type="text" class="form-control" name="quantity'+itemNum+'" /></td>'+
													'<td><div id="description'+itemNum+'"><input type="text" class="form-control" name="description'+itemNum+'" /></div></td>'+
													'<td><input type="text" class="form-control" name="warranty'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="estimatedShipping'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="unitPrice'+itemNum+'" /></td>'+
												  '</tr>');
	$('#totalProducts').val(itemNum);
	loadItemsInfo(itemNum);
	
	itemNum++;
}

function displayExchangeRate(selected){
	var currency = selected.value;
	
	if(currency === "USD"){
		$("#exchangeRate").css( "display", "block" );
	}
	else{
		$("#exchangeRate").css( "display", "none" );
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
			console.log(response);
			console.log(number);
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

function addQuotation(){
	var activeTab = $('.nav-tabs .active').text();
	
	$.ajax({
		type: "post",
		url : "ControllerTemp",
		data: $("#addQuotation").serialize()+"&option=2&activeTab="+activeTab,
		success: function(response){
			console.log("success");
			//$("#addressInfo").html(response);
			//$(".chosen-select").chosen();
		},
		error: function(){
			alert("Error");
		}
	});
	
	return false;
}

function preview(){
	
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

