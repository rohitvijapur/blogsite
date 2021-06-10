package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()){
    		
//    		fetching data
    		
    		String userEmail = request.getParameter("user_email") ;
    		String userName = request.getParameter("user_name") ;
    		String userPassword = request.getParameter("user_password") ;
    	
    		String userAbout = request.getParameter("user_about") ;
    		Part part = request.getPart("image") ;
    		
    		String imageName = part.getSubmittedFileName();
    		
    		
//    		getting user from session
    		
    		HttpSession s = request.getSession() ;
    		User user = (User)s.getAttribute("currentUser") ;
    		user.setEmail(userEmail);
    		user.setName(userName);
    		user.setPassword(userPassword);
    		user.setUser_info(userAbout);
    		String oldFile = user.getProfile();
    		user.setProfile(imageName);
    		
    		
//    		updating new data in database
    		UserDao userDao = new UserDao(ConnectionProvider.getConnection()) ;
    		
    		boolean ans = userDao.updateUser(user);
    		
    			if(ans = true) {
        			
        			String path=request.getRealPath("/")+"pics"+ File.separator+user.getProfile();
        			
//        			delete previous photo from data
        			String pathOldFile =request.getRealPath("/")+"pics"+ File.separator+ oldFile;
        			if(!oldFile.equals("default.png")) {
        			 Helper.deleteFile(pathOldFile) ;
        			}
        				if(Helper.saveFile(part.getInputStream(), path)) {
        					out.println("profile updated");
        					
        					Message msg = new Message("Profile updated successfully","success","alert-success") ;
        	    			s.setAttribute("msg", msg);
        	    			
        	    			
        				}
        				else {
        					out.println("not ") ;

        					Message msg = new Message("Profile  not updated ","error","alert-error") ;
        	    			s.setAttribute("msg", msg);
        	    			
        				}
    			}

        			
        		else {
        			out.println("not updated") ;

					Message msg = new Message("Profile  not updated ","error","alert-error") ;
	    			s.setAttribute("msg", msg);
	    			
        		}
    			response.sendRedirect("profile.jsp");

    	   }
    		catch(Exception e){
    			e.printStackTrace();
    	
    }
}
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
