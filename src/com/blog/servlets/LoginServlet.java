package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()){
    		String userEmail = request.getParameter("email") ;
    		String userPassword = request.getParameter("password") ;
    		
    		UserDao dao = new UserDao(ConnectionProvider.getConnection()) ;
    		User u = dao.getUserByEmailAndPassword(userEmail, userPassword) ;
    		if(u==null) {
    			//error in details
//    			out.println("Invalid details, try again,ensure you have registered ") ;
    			
    			Message msg = new Message("Invalid details,please try with another","error","alert-danger") ;
    			HttpSession s = request.getSession() ;
    			s.setAttribute("msg", msg);
    			response.sendRedirect("login_page.jsp");
    			
    			
    		}else {
//    			fetch the user details and redirect to profile 
    			
    			HttpSession s= request.getSession() ;
    			s.setAttribute("currentUser", u);
    			response.sendRedirect("profile.jsp") ;
    			
    			
    		}
    		
    	}
    	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
