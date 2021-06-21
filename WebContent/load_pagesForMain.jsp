<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.entities.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


  
<div class="row">

<%


	
	Thread.sleep(200) ;
	PostDao d = new PostDao(ConnectionProvider.getConnection()) ;
	int cid = Integer.parseInt(request.getParameter("cid")) ;
	List<Post> posts = null;
	if(cid==0){
		posts = d.getAllPosts() ;
	}else{
		posts = d.getPostByCatId(cid) ;
	}
	
	
	if(posts.size() == 0){
		out.println("<h3 class='display-3 text-center text-dark'>No posts in this category</h3>  ") ;
		
		
		return ;
	}
 
   
    for(Post p:posts){
 %>
 		<div class="col-md-6 mt-2">
 			<div class="card"> 
 			<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
 			
 				<div class="card-body">
 					<b><%=p.getpTitle() %></b>
 					<p><%=p.getpContent() %></p>
 					
 				
 				
 				</div>	
 				<div class="card-footer secondary-background text-center">
 					<%
						LikeDao ld = new LikeDao(ConnectionProvider.getConnection()) ;
					
					%>
 					<a href="redirectAccess.jsp"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
	 				<a href="redirectAccess.jsp" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting"></i><span></span></a>
 					<a href="redirectAccess.jsp" class="btn btn-outline-light btn-sm">Read more</a>
 				
 				</div>
 			
 			
 			
 			</div>
 		
 		
 		
 		
 		</div>
 		
 		
 		
 		
 <%
    	
    }
	
	


%>



</div>
