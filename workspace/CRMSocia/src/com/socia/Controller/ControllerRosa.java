package com.socia.Controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.AddressDAO;
import com.socia.DAO.AppointmentDAO;
import com.socia.DAO.BusinessLineDAO;
import com.socia.DAO.ClientDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.DateDAO;
import com.socia.DAO.IndicatorDAO;
import com.socia.DAO.ItemDAO;
import com.socia.DAO.MailDAO;
import com.socia.DAO.QuotationDAO;
import com.socia.DAO.QuotationDetailDAO;
import com.socia.DAO.TenderDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.AddressDTO;
import com.socia.DTO.AppointmentDTO;
import com.socia.DTO.AppointmentLogDTO;
import com.socia.DTO.BusinessLineDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.DateDTO;
import com.socia.DTO.IndicatorDTO;
import com.socia.DTO.ItemDTO;
import com.socia.DTO.LoginDTO;
import com.socia.DTO.QuotationDTO;
import com.socia.DTO.QuotationDetailDTO;
import com.socia.DTO.QuotationLogDTO;
import com.socia.DTO.TenderDTO;
import com.socia.DTO.TenderLogDTO;

/**
 * Servlet implementation class ControllerTemp
 */
@WebServlet("/ControllerTemp")
public class ControllerRosa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerRosa() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession				session		=	request.getSession();
		/** Parameters */
		int								option					=	Integer.parseInt(request.getParameter("option"));
		int								clientId				= 	0;
		String							itemId					=	"";
		String							warranty				=	"";
		double							unitPrice				=	0;
		double							margin					=	0;
		int								quantity				=	0;
		String							estimatedShipping		=	"";
		int								contactId				=	0;
		String							currency				=	"";
		double							exchangeRate			=	0;
		int								totalProducts			=	0;
		int								quotationId				= 	0;
		String							addItem					=	"";
		String							description				=	"";
		
		String							activeTab				=	"";
		int 							addressId				=	0;
		String 							street					=	"";
		String							extNum					=	"";
		String 							intNum					=	"";
		String 							suburb					=	"";
		String							city					=	"";
		String							state					=	"";
		String							country					=	"";
		String							zipCode					=	"";
		
		StringBuilder					body;
		String[]						to						= 	{"jossoto14@gmail.com", "vidal.sistemas@hotmail.com"};
		String[]						cc						=	{""};
		
		int 							itemIndex 				=	0; 
		boolean							insert					= 	false;
		
		int 							tenderId				=	0;
		String							startUpDate				=	"";
		String							deadline				=	"";
		String							requirements			=	"";
		String							comments				=	"";
		int								businessLineId			=	0;
		String							decisionMaker			=	"";
		String		 					currentBrand			=	"";
		
		Date							startDate				=	null;
		Date							endDate					=	null;
		SimpleDateFormat 				formatter	 			=	new SimpleDateFormat("yyyy-MM-dd");
		String 							fechaIni				=	"";
		String 							fechaFin				=	"";
		String 							clientType				=	"";
		
		String							eventId					=	"";
		
		/** DAO */
		ItemDAO							objItem					=	new ItemDAO();
		MailDAO							objMail					=	new MailDAO();
		ClientDAO						objClient				=	new ClientDAO();
		ContactDAO						objContact				=	new ContactDAO();
		AddressDAO						objAddress 				= 	new AddressDAO();
		QuotationDAO					objQuotation			=	new QuotationDAO();
		ConsecutiveDAO					objConsecutive			=	new ConsecutiveDAO();
		QuotationDetailDAO				objQuotationDetail		=	new QuotationDetailDAO();
		BusinessLineDAO					objBusinessLine			=	new BusinessLineDAO();
		TenderDAO						objTender				=	new TenderDAO();
		IndicatorDAO					objIndicator			=	new IndicatorDAO();
		DateDAO							objDate					=	new DateDAO();
		AppointmentDAO					objAppointment			=	new AppointmentDAO();
		
		/** DTO*/
		ItemDTO							item;
		ClientDTO						client;
		AddressDTO						address					=	null;
		ArrayList<AddressDTO>			arrAddress				= 	new ArrayList<AddressDTO>();
		ContactDTO						contact;
		QuotationDTO					quotation;
		QuotationDetailDTO				quotationDetail;
		ArrayList<QuotationDetailDTO> 	arrQuotationDetail		=	new ArrayList<QuotationDetailDTO>();
		ArrayList<BusinessLineDTO>		arrBusinessLine			= 	new ArrayList<BusinessLineDTO>();
		TenderDTO						tender					=	null;
		ArrayList<DateDTO>				arrDate					= 	new ArrayList<DateDTO>();
		ArrayList<IndicatorDTO>			arrCallIndicator		= 	new ArrayList<IndicatorDTO>();
		ArrayList<IndicatorDTO>			arrAppointmentIndicator	= 	new ArrayList<IndicatorDTO>();
		ArrayList<IndicatorDTO>			arrQuotationIndicator	= 	new ArrayList<IndicatorDTO>();
		ArrayList<IndicatorDTO>			arrTenderIndicator		= 	new ArrayList<IndicatorDTO>();
		ArrayList<IndicatorDTO>			arrTenderChart			= 	new ArrayList<IndicatorDTO>();
		ArrayList <AppointmentLogDTO> 	arrAppointmentLog		=	new ArrayList <AppointmentLogDTO>();
		ArrayList <TenderLogDTO> 		arrTenderLog			=	new ArrayList <TenderLogDTO>();
		ArrayList <QuotationLogDTO> 	arrQuotationLog			=	new ArrayList <QuotationLogDTO>();
		AppointmentDTO					appointmentDetail		=	null;
		
		/** URL */
		String							url					=	"";
		
		/** Transaction */
		TransactionDAO					transaction			= new TransactionDAO();
		ArrayList<StringBuilder>		queries				= new ArrayList<StringBuilder>();
		
		if(option == 1){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			arrAddress = objAddress.getAddressByClient(clientId);
			
			session.removeAttribute("arrAddress");
			if(arrAddress.size() > 0)
				session.setAttribute("arrAddress", arrAddress);
			else
				session.setAttribute("arrAddress", null);
			
			url = "utils/selectAddress.jsp";
		}else if(option == 2 || option == 3 || option == 6){
			/** Address */
			activeTab = request.getParameter("activeTab");
			
			if(activeTab.equals("SELECCIONAR")){
				addressId = Integer.parseInt(request.getParameter("addressId"));
			}else if(activeTab.equals("AGREGAR")){
				addressId = objConsecutive.getConsecutive("addresses");

				street = request.getParameter("street");
				extNum = request.getParameter("extNum");
				intNum = request.getParameter("intNum");
				suburb = request.getParameter("suburb");
				city = request.getParameter("city");
				state = request.getParameter("state");
				country = request.getParameter("country");
				zipCode = request.getParameter("zipCode");
				
				address = new AddressDTO(addressId, street, extNum, intNum, suburb, city, state, country, zipCode);
			}
			
			/** Quotation */
			clientId = Integer.parseInt(request.getParameter("clientId"));
			contactId = Integer.parseInt(request.getParameter("contactId"));
			currency = request.getParameter("currency");
			deadline = request.getParameter("deadline");
			
			if(request.getParameter("currency") == "USD")
				exchangeRate = Double.parseDouble(request.getParameter("exchangeRate"));
			totalProducts = Integer.parseInt(request.getParameter("totalProducts"));
			
			if(option == 2 || option == 6)
				quotationId = objConsecutive.getConsecutive("quotations");
			
			quotation = new QuotationDTO(quotationId, addressId, clientId, currency, exchangeRate, deadline, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
			
			/** Quotation details*/
			for(int index = 1; index <= totalProducts; index++){
				addItem = "";
				
				itemId = request.getParameter("itemNum"+index);
				quantity = Integer.parseInt(request.getParameter("quantity"+index));
				warranty = request.getParameter("warranty"+index);
				estimatedShipping = request.getParameter("estimatedShipping"+index);
				unitPrice = Double.parseDouble(request.getParameter("unitPrice"+index));
				margin = Double.parseDouble(request.getParameter("margin"+index));
				
				addItem = request.getParameter("addItem"+index);
				
				if(addItem.equals("true")){ 
					description = request.getParameter("description"+index);
					item = new ItemDTO(itemId, description, "PZA", currency, 0.16, unitPrice);
					queries = objItem.insertNewItem(item, queries);
				}
				else{
					item = objItem.getItemById(itemId);
					description = item.getDescription();
				}
					
				quotationDetail = new QuotationDetailDTO(quotationId, itemId, description, warranty, unitPrice, margin, quantity, estimatedShipping);
				arrQuotationDetail.add(quotationDetail);
			}
				
			if(address == null)
				address = objAddress.getAddressById(addressId);
				
			client = objClient.getClientById(clientId);
			contact = objContact.getContactsById(contactId);
			
			if(option == 2 || option == 6){
				/** INSERTS */
				try
				{
					if(activeTab.equals("AGREGAR")){
						queries = objAddress.insertAddress(address, queries);
						queries = objAddress.insertContactAddress(clientId, addressId, queries);
					}
					
					queries = objQuotation.insertQuotation(quotation, queries);
					queries = objQuotationDetail.insertQuotationDetails(arrQuotationDetail, queries);
					
					transaction.openConnection();
					transaction.insertAll(queries);
					
					transaction.commit();
					
					insert = true;
					body = objQuotation.generateMail(client, contact, address, quotation, arrQuotationDetail);
					cc[0] =  ((LoginDTO)session.getAttribute("sessionLogin")).getEmail();
					
					if(option == 2){
						objMail.sendFromGMail("rosa.mendiola.i", "swaqloi8t5o9nh.,", to, cc, "Cotización", body.toString());
					}
					else if(option == 6){
						objQuotation.generateExcelFile(client, contact, address, quotation, arrQuotationDetail);
						objMail.sendFromGMailAttachment("rosa.mendiola.i", "swaqloi8t5o9nh.,", to, cc, "Cotización", body.toString(),"cotizacion.xls","cotizacion.xls");
					}
					
				}catch(Exception exception){
					insert = false;
					transaction.rollback();
					exception.printStackTrace();
				}finally{
					transaction.closeConnection();
				}
				
				session.removeAttribute("insertQuotation");
				session.setAttribute("insertQuotation", insert);
				
				url = "views/quotations/responses/validateInsertQuotation.jsp";
				
			}else if(option == 3){
				session.removeAttribute("quotation");
				session.setAttribute("quotation", quotation);
				
				session.removeAttribute("arrQuotationDetail");
				session.setAttribute("arrQuotationDetail", arrQuotationDetail);
				
				session.removeAttribute("addressPreview");
				session.setAttribute("addressPreview", address);

				session.removeAttribute("clientPreview");
				session.setAttribute("clientPreview", client);
				
				session.removeAttribute("contactPreview");
				session.setAttribute("contactPreview", contact);
			}
		}else if(option == 4){
			if(session.getAttribute("arrItems") == null)
			{
				ArrayList<ItemDTO>	arrItems	= new ArrayList<ItemDTO>();
				arrItems = objItem.getItems();
				
				session.removeAttribute("arrItems");
				session.setAttribute("arrItems", arrItems);
			}
		
			itemIndex = Integer.parseInt(request.getParameter("itemIndex"));
			session.removeAttribute("itemIndex");
			session.setAttribute("itemIndex", itemIndex);
			
			url = "views/quotations/responses/selectItem.jsp";
		}else if(option == 5){
			itemId = request.getParameter("itemId");
			
			item = objItem.getItemById(itemId);
				
			session.removeAttribute("item");
			session.setAttribute("item", item);
		
			itemIndex = Integer.parseInt(request.getParameter("itemIndex"));
			session.removeAttribute("itemIndex");
			session.setAttribute("itemIndex", itemIndex);
			
			url = "views/quotations/responses/itemDescription.jsp";
		}
		else if(option == 7){
			arrBusinessLine = objBusinessLine.getBusinessLines();
			
			session.removeAttribute("arrBusinessLine");
			if(arrBusinessLine.size() > 0)
				session.setAttribute("arrBusinessLine", arrBusinessLine);
			else
				session.setAttribute("arrBusinessLine", null);
			
			url = "utils/selectBusinessLine.jsp";
		}
		else if(option == 8){
			startUpDate = request.getParameter("startUpDate");
			deadline = request.getParameter("deadline");
			requirements = request.getParameter("requirements");
			comments = request.getParameter("comments");
			clientId = Integer.parseInt(request.getParameter("clientId"));
			businessLineId = Integer.parseInt(request.getParameter("businessLineId"));
			decisionMaker = request.getParameter("decisionMaker");
			currentBrand = request.getParameter("currentBrand");
			
			tenderId = objConsecutive.getConsecutive("tenders");
			
			tender = new TenderDTO(tenderId, startUpDate, deadline, requirements, comments, clientId, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId(), businessLineId, decisionMaker, "today", currentBrand);
			
			try
			{
				queries = objTender.insertTender(tender, queries);
				
				transaction.openConnection();
				transaction.insertAll(queries);
				
				transaction.commit();
				
				insert = true;
			}catch(Exception exception){
				insert = false;
				transaction.rollback();
				exception.printStackTrace();
			}finally{
				transaction.closeConnection();
			}
			
			session.removeAttribute("insertTender");
			session.setAttribute("insertTender", insert);
			
			url = "views/calendar/responses/validateInsertTender.jsp";
		}
		else if(option == 9){
			startUpDate = request.getParameter("startDate");
			deadline = request.getParameter("endDate");
			
			try{
				startDate = formatter.parse(startUpDate);
				endDate = formatter.parse(deadline);
				arrDate = objDate.getDaysArray(startDate, endDate);
				arrBusinessLine = objBusinessLine.getBusinessLines();
				
				arrCallIndicator = objIndicator.getGeneralCallIndicator(arrDate, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				arrAppointmentIndicator = objIndicator.getGeneralAppointmentIndicator(arrDate, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				arrQuotationIndicator = objIndicator.getGeneralQuotationIndicator(arrDate, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				arrTenderIndicator = objIndicator.getGeneralTenderIndicator(arrDate, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				arrTenderChart = objIndicator.getTenderChart(startUpDate, deadline, arrBusinessLine, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
				
				session.removeAttribute("arrCallIndicator");
				if(arrCallIndicator.size() > 0)
					session.setAttribute("arrCallIndicator", arrCallIndicator);
				else
					session.setAttribute("arrCallIndicator", null);
				
				session.removeAttribute("arrAppointmentIndicator");
				if(arrAppointmentIndicator.size() > 0)
					session.setAttribute("arrAppointmentIndicator", arrAppointmentIndicator);
				else
					session.setAttribute("arrAppointmentIndicator", null);
				
				session.removeAttribute("arrQuotationIndicator");
				if(arrQuotationIndicator.size() > 0)
					session.setAttribute("arrQuotationIndicator", arrQuotationIndicator);
				else
					session.setAttribute("arrQuotationIndicator", null);
				
				session.removeAttribute("arrTenderIndicator");
				if(arrTenderIndicator.size() > 0)
					session.setAttribute("arrTenderIndicator", arrTenderIndicator);
				else
					session.setAttribute("arrTenderIndicator", null);
				
				session.removeAttribute("arrTenderChart");
				if(arrTenderChart.size() > 0)
					session.setAttribute("arrTenderChart", arrTenderChart);
				else
					session.setAttribute("arrTenderChart", null);
				
				url = "views/indicators/responses/generateIndicators.jsp";
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(option == 10){
			clientType = (request.getParameter("clientType")==null?"":request.getParameter("clientType"));
			fechaIni = request.getParameter("fechaIni");
			fechaFin = request.getParameter("fechaFin");
			
			arrAppointmentLog = objAppointment.getAppointmentLog(clientType, fechaIni, fechaFin, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
			
			session.removeAttribute("arrAppointmentLog");
			if(arrAppointmentLog.size()>0){
				session.setAttribute("arrAppointmentLog", arrAppointmentLog);
			}
			else{
				session.setAttribute("arrAppointmentLog", null);
			}
			
			url = "/views/appointments/responses/appointmentDetail.jsp";
		}
		else if(option == 11){
			fechaIni = request.getParameter("fechaIni");
			fechaFin = request.getParameter("fechaFin");
			
			arrTenderLog = objTender.getTenderLog(fechaIni, fechaFin, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
			
			session.removeAttribute("arrTenderLog");
			if(arrTenderLog.size()>0){
				session.setAttribute("arrTenderLog", arrTenderLog);
			}
			else{
				session.setAttribute("arrTenderLog", null);
			}
			
			url = "/views/tenders/responses/tenderDetail.jsp";
		}
		else if(option == 12){
			fechaIni = request.getParameter("fechaIni");
			fechaFin = request.getParameter("fechaFin");
			
			arrQuotationLog = objQuotation.getQuotationLog(fechaIni, fechaFin, ((LoginDTO)session.getAttribute("sessionLogin")).getCrmUserId());
			
			session.removeAttribute("arrQuotationLog");
			if(arrQuotationLog.size()>0){
				session.setAttribute("arrQuotationLog", arrQuotationLog);
			}
			else{
				session.setAttribute("arrQuotationLog", null);
			}
			
			url = "/views/quotations/responses/quotationDetail.jsp";
		}
		if(option == 13){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			
			client = objClient.getClientById(clientId);
			
			session.removeAttribute("clientType");
			session.setAttribute("clientType", client.getClientType());

			url = "/utils/clientType.jsp";
		}
		if(option == 14){
			String[] arrId;
			
			eventId = request.getParameter("event");
			arrId = eventId.split("-");
			
			session.removeAttribute("appointmentDetail");
			session.removeAttribute("tenderDetail");
			
			if(eventId.contains("ten")){
				tender = objTender.geTenderById(Integer.parseInt(arrId[1]));
				session.setAttribute("tenderDetail", tender);
			}else{
				appointmentDetail = objAppointment.getAppointmentById(Integer.parseInt(arrId[1]));
				session.setAttribute("appointmentDetail", appointmentDetail);
			}
			
			url = "/views/calendar/responses/calendarDetail.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
