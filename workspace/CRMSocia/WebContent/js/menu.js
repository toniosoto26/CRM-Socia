	/*Menu-toggle*
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
    });

    /*Scroll Spy*
    $('body').scrollspy({ target: '#spy', offset:80});

    /*Smooth link animation*
    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);
                return false;
            }
        }
    });
    
    /**  Loading menus */
    function loadMenu(menuName){
    	alert('1');
    	if(menuName === "call"){
    		$("#pageContent").load("call.jsp");
    	}else if(menuName === "quotation"){
    		$("#pageContent").load("quotation.jsp");
    	}else if(menuName === "calendar"){
    		alert('here');
    		$("#pageContent").load("../views/calendar/calendar.jsp");
    	}
    }
    