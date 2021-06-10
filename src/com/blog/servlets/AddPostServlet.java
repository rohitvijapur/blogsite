package com.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
@WebServlet("/AddPostServlet")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			
			int cid =Integer.parseInt(request.getParameter("cid")) ;
			String pTitle = request.getParameter("pTitle") ;
			String pContent = request.getParameter("pContent") ;
			String pCode = request.getParameter("pCode") ;
			Part part = request.getPart("pic") ;
			HttpSession session = request.getSession() ;
			User user =(User) session.getAttribute("currentUser") ;
			
			
			
//			out.println("title in" + pTitle);
//			out.println(part.getSubmittedFileName()) ;
//			System.out.print(cid.getClass().getName());
//			System.out.println(cid) ;
//			System.exit(0);
			Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId()) ;
			
			PostDao dao = new PostDao(ConnectionProvider.getConnection()) ;
			if(dao.savePost(p)) {
				String path =request.getRealPath("/")+"blog_pics"+ File.separator+ part.getSubmittedFileName() ;
				Helper.saveFile(part.getInputStream(), path);
				out.println("done");
				
			}else
			{
				out.println("error") ;
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
