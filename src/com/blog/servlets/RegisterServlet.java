package com.blog.servlets;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()){
    		
    		
    		String check = request.getParameter("check") ;
    		if(check == null) {
    			out.println("Try again by checking the box") ;
    	
    		}
    		else {
    			String name = request.getParameter("user_name") ;
    			String email = request.getParameter("user_email") ;
    			String password = request.getParameter("user_password") ;
    			String gender = request.getParameter("gender") ;
    			String about = request.getParameter("about") ;
    			
    			
    			User user = new User(name,email,password,gender,null,about) ;
    			
    			UserDao dao = new UserDao(ConnectionProvider.getConnection());
    			if(dao.saveUser(user)) {
//    				save
    				out.println("done") ;
    				
    			}else {
    				out.println("error") ;
    			}
    			
    		}	
    	}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
