package com.socia.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.CallDAO;
import com.socia.DAO.ClientDAO;
import com.socia.DAO.ConsecutiveDAO;
import com.socia.DAO.ContactDAO;
import com.socia.DAO.DivisionPositionDAO;
import com.socia.DAO.TransactionDAO;
import com.socia.DAO.VendorDAO;
import com.socia.DTO.CallDTO;
import com.socia.DTO.ClientDTO;
import com.socia.DTO.ContactDTO;
import com.socia.DTO.LoginDTO;
import com.socia.DTO.Vendor;

/**
 * Servlet implementation class ControllerVendor
 */
@WebServlet("/ControllerVendor")
public class ControllerVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerVendor() {
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
		HttpSession	session	=	request.getSession();
		int option=Integer.parseInt(request.getParameter("option"));
		String					url			=	"";
		
		///////**********  DAO ***************
		VendorDAO objVendor = new VendorDAO();
		
		///////**********  DTO ****************
		Vendor	vendor	= null;
		
		if(option == 1){
			ArrayList<Vendor> arrVendor = new ArrayList<Vendor>(); 
			arrVendor=objVendor.obtenerProveedores();
			
			session.removeAttribute("arrVendor");
			session.setAttribute("arrVendor", arrVendor);
			
			url		=	"/vendor/selectVendor.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
