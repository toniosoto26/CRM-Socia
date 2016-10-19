package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.AddressDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.QuotationDAO;
import com.socia.DAO.QuotationDetailDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DTO.AddressDTO;
import com.socia.DTO.LoginDTO;
import com.socia.DTO.QuotationDTO;
import com.socia.DTO.QuotationDetailDTO;

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
		int								option				=	Integer.parseInt(request.getParameter("option"));
		int								clientId			= 	0;
		int								itemId				=	0;
		String							warranty			=	"";
		double							unitPrice			=	0;
		int								quantity			=	0;
		String							estimatedShipping	=	"";
		int								contactId			=	0;
		String							currency			=	"";
		double							exchangeRate		=	0;
		int								totalProducts		=	0;
		int								quotationId			= 	0;
		
		String							activeTab			=	"";
		int 							addressId			=	0;
		String 							street				=	"";
		String							extNum				=	"";
		String 							intNum				=	"";
		String 							suburb				=	"";
		String							city				=	"";
		String							state				=	"";
		String							country				=	"";
		String							zipCode				=	"";
		
		/** DAO */
		ConsecutiveDAO					objConsecutive		=	new ConsecutiveDAO();
		AddressDAO						objAddress 			= 	new AddressDAO();
		QuotationDAO					objQuotation		=	new QuotationDAO();
		QuotationDetailDAO				objQuotationDetail	=	new QuotationDetailDAO();
		
		/** DTO*/
		LoginDTO						login;
		AddressDTO						address				=	null;
		QuotationDTO					quotation;
		QuotationDetailDTO				quotationDetail;
		ArrayList<QuotationDetailDTO> 	arrQuotationDetail	=	new ArrayList<QuotationDetailDTO>();
		
		/** URL */
		String							url					=	"";
		
		/** Transaction */
		TransactionDAO					transaction			= new TransactionDAO();
		ArrayList<StringBuilder>		queries				= new ArrayList<StringBuilder>();
		
		if(option == 1){
			clientId = Integer.parseInt(request.getParameter("clientId"));
			
			ArrayList<AddressDTO>	arrAddress	= new ArrayList<AddressDTO>();
			arrAddress = objAddress.getAddressByClient(clientId);
			
			session.removeAttribute("arrAddress");
			session.setAttribute("arrAddress", arrAddress);
			
			url = "utils/selectAddress.jsp";
		}else if(option == 2){
			/** User */
			login = (LoginDTO)session.getAttribute("sessionLogin");
			
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
			if(request.getParameter("currency") == "USD")
				exchangeRate = Double.parseDouble(request.getParameter("exchangeRate"));
			totalProducts = Integer.parseInt(request.getParameter("totalProducts"));
			
			quotationId = objConsecutive.getConsecutive("quotations");
			
			quotation = new QuotationDTO(quotationId, addressId, contactId, currency, exchangeRate, 1);
			
			/** Quotation details*/
			for(int index = 1; index <= totalProducts; index++){
				itemId = Integer.parseInt(request.getParameter("itemNum"+index));
				quantity = Integer.parseInt(request.getParameter("quantity"+index));
				warranty = request.getParameter("warranty"+index);
				estimatedShipping = request.getParameter("estimatedShipping"+index);
				unitPrice = Double.parseDouble(request.getParameter("unitPrice"+index));
				
				quotationDetail = new QuotationDetailDTO(quotationId, itemId, warranty, unitPrice, quantity, estimatedShipping);
				arrQuotationDetail.add(quotationDetail);
			}
			
			/** INSERTS */
			try
			{
				if(activeTab.equals("AGREGAR"))
					queries = objAddress.insertAddress(address, queries);
				queries = objQuotation.insertQuotation(quotation, queries);
				queries = objQuotationDetail.insertQuotationDetails(arrQuotationDetail, queries);
				
				transaction.openConnection();
				transaction.insertAll(queries);
				
				transaction.commit();
			}catch(Exception exception){
				transaction.rollback();
				exception.printStackTrace();
			}finally{
				transaction.closeConnection();
			}
			
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
