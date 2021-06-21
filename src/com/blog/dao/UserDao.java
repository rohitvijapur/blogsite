package com.blog.dao;
import java.sql.*;

import com.blog.entities.User;

public class UserDao {
	private Connection con ;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
//	insert data into database
	
	public boolean saveUser(User user) {
		boolean f = false ;
		
		try {
			
			String q = "insert into user(name,email,password,gender,user_info) values(?,?,?,?,?)" ;
			PreparedStatement pstmt = this.con.prepareStatement(q) ;
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getUser_info());
			
			
			pstmt.executeUpdate() ;
		    f= true ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f ;
		
	}
	
//	get user by email and password
	
	public User getUserByEmailAndPassword(String email,String password) {

		User user = null ;
		
		try {
			
			String query = "select * from user where email=? and password=?" ;
			PreparedStatement pstmt = con.prepareStatement(query) ;
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet set = pstmt.executeQuery() ;
			if(set.next()) {
				user = new User() ;
				String name = set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setUser_info(set.getString("user_info"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
				
				
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
	}

	
//	updating new info of user in database
	
	public boolean updateUser(User user) {
		boolean f=false ;
		try {
			String query = "update 	user set name=? ,email=?, password=?, user_info=?,profile=? where id=? " ;
			PreparedStatement pstmt = con.prepareStatement(query) ;
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getUser_info());
			pstmt.setString(5,user.getProfile());
			pstmt.setInt(6, user.getId());
			
			pstmt.executeUpdate() ;
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	
//	get user name by user id
	
	public User getUserByUserId(int userId) {
		User user = null ;
		try {
			String q = "select * from user where id=?" ;
			PreparedStatement ps = this.con.prepareStatement(q); 
			ps.setInt(1, userId);
			
			ResultSet set = ps.executeQuery();
			if(set.next()) {
				user = new User() ;
				String name = set.getString("name");
				user.setName(name);
				
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setUser_info(set.getString("user_info"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return user ;
	}
}
