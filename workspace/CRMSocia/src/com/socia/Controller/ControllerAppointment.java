package com.socia.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.socia.DAO.AppointmentDAO;
import com.socia.DTO.AppointmentDTO;

/**
 * Servlet implementation class ControllerAppointment
 */
@WebServlet("/ControllerAppointment")
public class ControllerAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAppointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procesar(request,response);
	}

	public void  procesar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession	session	=	request.getSession();
		
		int		opc	=	Integer.parseInt(request.getParameter("opc"));
		String	url	=	"";
		try{
			switch (opc){
				case 1:
					AppointmentDAO 			appoint	=	new	AppointmentDAO();
					List<AppointmentDTO>	arrBDM	=	appoint.getBdm();
					session.removeAttribute("arrDBM");
					session.setAttribute("arrBDM", arrBDM);
					url	=	"/views/appointments/responses/getComboBDM.jsp";
					break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		request.getRequestDispatcher(url).forward(request, response);	
	}
	
}
