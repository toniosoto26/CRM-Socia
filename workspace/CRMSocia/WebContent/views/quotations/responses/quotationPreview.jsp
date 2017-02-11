<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<style type="text/css">
	/* -------------------------------------
    INVOICE
	------------------------------------- */
	.invoice {
	  text-align: left;
	  width: 100%;
	}
	.invoice td {
	  padding: 5px 0;
	}
	.invoice .invoice-items td {
	  border-top: #eee 1px solid;
	}
	.invoice .invoice-items .total {
	  border-top: 2px solid #333;
	  border-bottom: 2px solid #333;
	  font-weight: 700;
	}
	.invoice .invoice-items .subtotal {
	  border-top: 2px solid #333;
	  font-weight: 700;
	}
	.invoice .invoice-items .iva {
	  border-top: 2px solid #333;
	  font-weight: 700;
	}
	.invoice .invoice-items .no-border{
	  border-bottom: none;
	  border-top: none;
	}
	.invoice .invoice-items .header td {
	  border-top: 2px solid #333;
	  border-bottom: 2px solid #333;
	  font-weight: 700;
	}
	
	/* -------------------------------------
    OTHER STYLES THAT MIGHT BE USEFUL
	------------------------------------- */
	.aligncenter {
	  text-align: center;
	}
	
	.alignright {
	  text-align: right;
	}
	
	.alignleft {
	  text-align: left;
	}
		
    /* CLIENT-SPECIFIC STYLES */
   	table, td, a{-webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;} /* Prevent WebKit and Windows mobile changing default text sizes *
    table, td{mso-table-lspace: 0pt; mso-table-rspace: 0pt;} /* Remove spacing between tables in Outlook 2007 and up *
    img{-ms-interpolation-mode: bicubic;} /* Allow smoother rendering of resized image in Internet Explorer *

    /* RESET STYLES */
    img{border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none;}
    table{border-collapse: collapse !important;}
    body{height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important;}

    /* iOS BLUE LINKS */
    a[x-apple-data-detectors] {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
    }

    /* MOBILE STYLES */
    @media screen and (max-width: 525px) {

        /* ALLOWS FOR FLUID TABLES */
        .wrapper {
          width: 100% !important;
            max-width: 100% !important;
        }

        /* ADJUSTS LAYOUT OF LOGO IMAGE */
        .logo img {
          margin: 0 auto !important;
        }

        /* USE THESE CLASSES TO HIDE CONTENT ON MOBILE */
        .mobile-hide {
          display: none !important;
        }

        .img-max {
          max-width: 100% !important;
          width: 100% !important;
          height: auto !important;
        }

        /* FULL-WIDTH TABLES *
        .responsive-table {
          width: 100% !important;
        }

        /* UTILITY CLASSES FOR ADJUSTING PADDING ON MOBILE */
        .padding {
          padding: 10px 5% 15px 5% !important;
        }

        .padding-meta {
          padding: 30px 5% 0px 5% !important;
          text-align: center;
        }

        .padding-copy {
             padding: 10px 5% 10px 5% !important;
          text-align: center;
        }

        .no-padding {
          padding: 0 !important;
        }

        .section-padding {
          padding: 50px 15px 50px 15px !important;
        }

        /* ADJUST BUTTONS ON MOBILE */
        .mobile-button-container {
            margin: 0 auto;
            width: 100% !important;
        }

        .mobile-button {
            padding: 15px !important;
            border: 0 !important;
            font-size: 16px !important;
            display: block !important;
        }

    }

    /* ANDROID CENTER FIX */
    div[style*="margin: 16px 0;"] { margin: 0 !important; }*/
</style>

<c:set var="today" value="<%=new Date()%>"/>
<c:set var="subtotal" value="${0}"/>
<fmt:setLocale value="es_MX"/>

<div class="modal-header">
	<a class="close" data-dismiss="modal">&times;</a>
	<h3 style="color:#FFF; text-align:center;">Cotización</h3>
</div>
<div class="modal-body">
	<!-- HEADER -->
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		    <tr>
		        <td bgcolor="#ffffff" align="center">
		            <!--[if (gte mso 9)|(IE)]>
		            <table align="center" border="0" cellspacing="0" cellpadding="0" width="800">
		            <tr>
		            <td align="center" valign="top" width="800">
		            <![endif]-->
		            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 800px;" class="wrapper">
		                <tr>
		                    <td valign="top" style="padding: 15px 0;" class="logo">
		                        <a href="http://gruposocia.com" target="_blank">
		                            <img alt="Logo" src="http://gruposocia.com/wp-content/uploads/2016/06/grupo-socia-logo-jp-hz-01-1.png" width="250" height="60" style="display: block; font-family: Helvetica, Arial, sans-serif; color: #ffffff; font-size: 16px;" border="0">
		                        </a>
		                    </td>
		                    <td align="right">
		                    	<p style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;">Referencia: </p>
		                    	<p style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><fmt:formatDate type="date" value="${today}" pattern="dd 'de' MMMM 'de' yyyy"/>   </p>
		                    </td>
		                </tr>
		            </table>
		            <!--[if (gte mso 9)|(IE)]>
		            </td>
		            </tr>
		            </table>
		            <![endif]-->
		        </td>
		    </tr>
		    <tr>
		        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
		            <!--[if (gte mso 9)|(IE)]>
		            <table align="center" border="0" cellspacing="0" cellpadding="0" width="800">
		            <tr>
		            <td align="center" valign="top" width="800">
		            <![endif]-->
		            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 800px;" class="responsive-table">
		            	<tr>
		            	<td>
				            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;" class="responsive-table">
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="37%" style="width: 37%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Raz&oacute;n Social</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="57%" style="width: 57%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;" id="previewCompanyName"><c:out value="${sessionScope.clientPreview.companyName }"></c:out></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="37%" style="width: 37%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Contacto</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="57%" style="width: 57%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><c:out value="${sessionScope.contactPreview.firstName }"></c:out> <c:out value="${sessionScope.contactPreview.lastName }"></c:out></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="37%" style="width: 37%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Direcci&oacute;n</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="57%" style="width: 57%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;" id="previewCompanyAddress"><c:out value="${addressPreview.street}"></c:out> <c:out value="${addressPreview.extNum}"></c:out> Int. <c:out value="${addressPreview.intNum}"></c:out>, <c:out value="${addressPreview.suburb}"></c:out>, <c:out value="${addressPreview.city}"></c:out>, <c:out value="${addressPreview.state}"></c:out>, <c:out value="${addressPreview.country}"></c:out></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="37%" style="width: 37%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Tel&eacute;fono</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="57%" style="width: 57%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><c:out  value="${contactPreview.phone }"></c:out></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                
				                <tr>
				                    <td style="border-bottom: border-top: 1px solid #eaeaea;">
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="37%" style="width: 37%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>email</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="57%" style="width: 57%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><c:out value="${sessionScope.contactPreview.email }"></c:out></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				            </table>
			            </td>
			            <td width="10%" style="max-width: 10%;"></td>
			            <td>
				            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 100%;" class="responsive-table">
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="27%" style="width: 27%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Proveedor</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="67%" style="width: 67%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;" id="previewCompanyName">SOLUCIONES DE IMPRESIÓN ADMINISTRADA, S.A. DE C.V.</td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="27%" style="width: 27%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Direcci&oacute;n</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="67%" style="width: 67%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;" id="previewCompanyAddress"> Medellín 81, int. 302, Col. Roma Norte</td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="27%" style="width: 27%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="67%" style="width: 67%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;">Del. Cuauhtémoc, DF, C.P.06700</td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td>
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="27%" style="width: 27%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>Contacto</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="67%" style="width: 67%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;">EMMA CRISTINA LÓPEZ MEDINA </td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				                <tr>
				                    <td style="border-bottom: border-top: 1px solid #eaeaea;">
				                        <!-- TWO COLUMNS -->
				                        <table cellspacing="0" cellpadding="0" border="0" width="100%">
				                            <tr>
				                                <td valign="top" style="padding: 0;" class="mobile-wrapper">
				                                    <!-- LEFT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="27%" style="width: 27%;" align="left">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;"><b>email</b></td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                    <!-- RIGHT COLUMN -->
				                                    <table cellpadding="0" cellspacing="0" border="0" width="67%" style="width: 67%;" align="right">
				                                        <tr>
				                                            <td style="padding: 0 0 10px 0;">
				                                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
				                                                    <tr>
				                                                        <td align="left" style="font-family: Arial, sans-serif; color: #333333; font-size: 12px;">elopez@socia.com.mx</td>
				                                                    </tr>
				                                                </table>
				                                            </td>
				                                        </tr>
				                                    </table>
				                                </td>
				                            </tr>
				                        </table>
				                    </td>
				                </tr>
				            </table>
			            </td>
			            </tr>
		            </table>
		            <!--[if (gte mso 9)|(IE)]>
		            </td>
		            </tr>
		            </table>
		            <![endif]-->
		        </td>
		    </tr>
		    <tr>
		        <td bgcolor="#ffffff" align="center" style="padding: 15px;" class="padding">
		            <!--[if (gte mso 9)|(IE)]>
		            <table align="center" border="0" cellspacing="0" cellpadding="0" width="800">
		            <tr>
		            <td align="center" valign="top" width="800">
		            <![endif]-->
		            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 800px;" class="responsive-table">
		            	<tr>
		            		<td>
		                		<table class="invoice"  cellspacing="0" cellpadding="0" border="0" width="100%">
									<tr>
										<td>
											<table class="invoice-items" cellpadding="0" cellspacing="0" style="width:100%;font-family: Arial, sans-serif; color: #333333; font-size: 12px;">
												<tr  class="header aligncenter" style="font-weight:bold;">
													<td>Cantidad</td>
													<td>SKU / No. Parte</td>
													<td>Descripción</td>
													<td>Tiempo de entrega</td>
													<td>Precio unitario</td>
													<td>Subtotal</td>
												</tr>
												<c:forEach  items="${sessionScope.arrQuotationDetail}" var="varQuotation" >
													<c:set var="totalItem" value="${varQuotation.quantity * varQuotation.unitPrice}" />
													<c:set var="subtotal" value="${subtotal + totalItem}" />
													<tr>
														<td><c:out value="${ varQuotation.quantity }"></c:out></td>
														<td><c:out value="${ varQuotation.itemId }"></c:out></td>
														<td></td>
														<td><c:out value="${ varQuotation.estimatedShipping }"></c:out></td>
														<td class="alignright"><fmt:formatNumber value="${varQuotation.unitPrice}" type="currency"/></td>
														<td class="alignright"><fmt:formatNumber value="${totalItem}" type="currency"/></td>
													</tr>
												</c:forEach>
												<c:set var="iva" value="${subtotal * 0.16}" />
												<c:set var="total" value="${subtotal + iva }" />
												<tr>
													<td class="subtotal"></td>
													<td class="subtotal"></td>
													<td class="subtotal"></td>
													<td class="subtotal"></td>
													<td class="subtotal">Subtotal</td>
													<td class="subtotal alignright"><fmt:formatNumber value="${subtotal}" type="currency"/></td>
												</tr>
												<tr>
													<td class="no-border"></td>
													<td class="no-border"></td>
													<td class="no-border"></td>
													<td class="no-border"></td>
													<td class="iva">IVA</td>
													<td class="iva alignright"><fmt:formatNumber value="${iva}" type="currency"/></td>
												</tr>
												<tr>
													<td class="no-border"><b>Moneda:</b></td>
													<td class="no-border"><c:out value="${ sessionScope.quotation.currency }"></c:out></td>
													<td class="no-border"></td>
													<td class="no-border"></td>
													<td class="total">Total</td>
													<td class="total alignright"><fmt:formatNumber value="${total}" type="currency"/></td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
		            		</td>
		            	</tr>

		            </table>
		            <!--[if (gte mso 9)|(IE)]>
		            </td>
		            </tr>
		            </table>
		            <![endif]-->
		        </td>
		    </tr>
		    <tr>
		        <td bgcolor="#ffffff" align="center" style="padding: 15px;">
		            <!--[if (gte mso 9)|(IE)]>
		            <table align="center" border="0" cellspacing="0" cellpadding="0" width="800">
		            <tr>
		            <td align="center" valign="top" width="800">
		            <![endif]-->
		            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 800px;" class="responsive-table">
		                <tr>
		                    <td>
		                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                            <tr>
		                                <td>
		                                    <!-- COPY -->
		                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		                                        <tr>
		                                            <td align="left" style="padding: 0 0 0 0; font-size: 14px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color: #f51616; font-weight:bold; font-style: italic;" class="padding-copy">LOS PRECIOS SON SUJETOS A CAMBIOS SIN PREVIO AVISO.</td>
		                                        </tr>
		                                    </table>
		                                </td>
		                            </tr>
		                        </table>
		                    </td>
		                </tr>
		            </table>
		            <!--[if (gte mso 9)|(IE)]>
		            </td>
		            </tr>
		            </table>
		            <![endif]-->
		        </td>
		    </tr>
		    <tr>
		        <td bgcolor="#ffffff" align="center" style="padding: 20px 0px;">
		            <!--[if (gte mso 9)|(IE)]>
		            <table align="center" border="0" cellspacing="0" cellpadding="0" width="800">
		            <tr>
		            <td align="center" valign="top" width="800">
		            <![endif]-->
		            <!-- UNSUBSCRIBE COPY -->
		            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="max-width: 800px;" class="responsive-table">
		                <tr>
		                    <td align="center" style="font-size: 12px; line-height: 18px; font-family: Helvetica, Arial, sans-serif; color:#666666;">
		                        Medellín 81 302, Roma Norte, Cuauhtémoc, D.F.
		                        <br>
		                    </td>
		                </tr>
		            </table>
		            <!--[if (gte mso 9)|(IE)]>
		            </td>
		            </tr>
		            </table>
		            <![endif]-->
		        </td>
		    </tr>
		</table>
</div>
<div class="modal-footer">
	<a class="btn btn-primary" data-dismiss="modal">Cerrar</a>
</div>