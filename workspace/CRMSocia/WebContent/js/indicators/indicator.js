function loadIndicator(){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	$("#indicators").html('');

	var refreshIntervalId = setInterval(function(){
		$.ajax({
			type:"post",
			url:"ControllerTemp",
			data: {option:9, startDate: startDate, endDate: endDate},
			success: function(response){
				$("#indicators").html(response);
				clearInterval(refreshIntervalId);
			},
			error: function(){
				alertify.alert("no funciona");
				clearInterval(refreshIntervalId);
			}
		});
	}, 500);
	
}

$( document ).ready(function() {
	loadIndicator();
});