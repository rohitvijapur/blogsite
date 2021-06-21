package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.LikeDao;
import com.blog.entities.Message;
import com.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try(PrintWriter out = response.getWriter()){
    		String operation = request.getParameter("operation") ;
    		int uid = Integer.parseInt(request.getParameter("uid")) ;
    		int pid = Integer.parseInt(request.getParameter("pid")) ;
    		
    		
//    		out.println("data from server");
//    		out.println(operation) ;
//    		out.println(uid) ;
//    		out.println(pid) ;
    		
    		LikeDao lDao = new LikeDao(ConnectionProvider.getConnection()) ;
    		if(operation.equals("like")) {
    			boolean f=lDao.insertLike(pid, uid) ;
    			out.println(f);
    		}
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
