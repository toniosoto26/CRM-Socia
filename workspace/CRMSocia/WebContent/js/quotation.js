/**
 * Quotation functions 
 */

function addProduct(){
	$('#productsTable > tbody:last-child').append('<tr><td><input type="text" class="form-control" id="itemNum" /></td><td><input type="text" class="form-control" id="quantity" /></td><td><input type="text" class="form-control" id="description" /></td><td><input type="text" class="form-control" id="warranty" /></td><td><input type="text" class="form-control" id="estimatedShipping" /></td><td><input type="text" class="form-control" id="unitPrice" /></td></tr>');
}