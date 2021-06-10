package com.blog.entities;

import java.sql.Timestamp;

public class User {
	
	private int id ;
	private String name ;
	private String email ;
	private String password ;
	private String gender ;
	private Timestamp dateTime ;
	private String user_info ;
	private String profile ;
	
	
	public User(int id, String name, String email, String password, String gender, Timestamp dateTime,
			String user_info) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.dateTime = dateTime;
		this.user_info = user_info;
	}


	public User() {
		super();
	}


	public User(String name, String email, String password, String gender, Timestamp dateTime, String user_info) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.user_info = user_info;
	}

//	getter and setter 

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public Timestamp getDateTime() {
		return dateTime;
	}


	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}


	public String getUser_info() {
		return user_info;
	}


	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	

	
	
	
}
