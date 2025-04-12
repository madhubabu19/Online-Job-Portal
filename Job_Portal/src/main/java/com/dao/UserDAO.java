package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.entity.User;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		this.conn=conn;
	}

	public boolean addUser(User u) {

		boolean f = false;
		try {
			String sql = "insert into user(name,email,password,qualification,role)values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			ps.setString(5, u.getRole());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em,String psw)
	{
		User u=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,em);
			ps.setString(2,psw );
		
            ResultSet rs=ps.executeQuery();	
            while(rs.next())
			{
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setRole(rs.getString(6));
			}
			//System.out.println("Email: " + em);
		//	System.out.println("Password: " + psw);
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return u;
	}
	
	public List<Jobs> getAllJobs(){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql); //  needed i think see once gain 
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				j=new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				
				j.setDescription(rs.getString(3));
				j.setCategeory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getString(7));
				list.add(j);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean updateUser(User u) {

		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,password=?,qualification=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());         ///ststring to above sql matching columsn numbers
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			ps.setInt(5, u.getId());
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	
	
	
}
