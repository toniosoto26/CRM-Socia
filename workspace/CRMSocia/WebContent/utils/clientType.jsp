<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<div id="radioBtnClient" class="btn-group">
    <span class="btn btn-primary btn-sm active" data-toggle="clientType" data-value="1" <c:choose><c:when test="${sessionScope.clientType=='A' }">disabled</c:when></c:choose>>ACTUAL</span>
    <span class="btn btn-default btn-sm notActive" data-toggle="clientType" data-value="0" <c:choose><c:when test="${sessionScope.clientType=='A' }">disabled</c:when></c:choose>>PROSPECTO</span>
</div>
<input type="hidden" name="clientType" id="clientType" value="<c:choose><c:when test="${sessionScope.clientType=='A' }">1</c:when><c:otherwise>0</c:otherwise></c:choose>">

<c:choose>
	<c:when test="${sessionScope.clientType=='P' }">
		<script>
			$(document).ready(function(){
				 activeSession(); 
				
				 let clientType = <c:choose><c:when test="${sessionScope.clientType=='A' }">1</c:when><c:otherwise>0</c:otherwise></c:choose>;
				 
				 if(clientType == 0){
					 $('span[data-toggle="clientType"]').not('[data-value="0"]').removeClass('active btn-primary').addClass('notActive btn-default');
				     $('span[data-toggle="clientType"][data-value="0"]').removeClass('notActive btn-default').addClass('active btn-primary');
				 }
		        
				 $('#radioBtnClient span').on('click', function(){
			        var sel = $(this).data('value');
			        var tog = $(this).data('toggle');
			        $('#'+tog).val(sel);
			        // You can change these lines to change classes (Ex. btn-default to btn-danger)
			        $('span[data-toggle="'+tog+'"]').not('[data-value="'+sel+'"]').removeClass('active btn-primary').addClass('notActive btn-default');
			        $('span[data-toggle="'+tog+'"][data-value="'+sel+'"]').removeClass('notActive btn-default').addClass('active btn-primary');
			    });
				
			});
		</script>
	</c:when>
</c:choose>