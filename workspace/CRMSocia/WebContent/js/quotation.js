/**
 * Quotation functions 
 */

var itemNum = 1;

function addProduct(){
	$('#productsTable > tbody:last-child').append('<tr>'+
													'<td><input type="text" class="form-control" name="itemNum'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="quantity'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="description'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="warranty'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="estimatedShipping'+itemNum+'" /></td>'+
													'<td><input type="text" class="form-control" name="unitPrice'+itemNum+'" /></td>'+
												  '</tr>');
	$('#totalProducts').val(itemNum);
	
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

$( document ).ready(function() {
	selectClient();
    addProduct();
    
    	
    	// Support for AJAX loaded modal window.
    	// Focuses on first input textbox after it loads the window.
    	$('[data-toggle="modal"]').click(function(e) {
    		e.preventDefault();
    		var url = $(this).attr('href');
    		if (url.indexOf('#') == 0) {
    			$(url).modal('open');
    		} else {
    			$.get(url, function(data) {
    				$('<div class="modal fade">' + data + '</div>').modal();
    			});
    		}
    	});
});

