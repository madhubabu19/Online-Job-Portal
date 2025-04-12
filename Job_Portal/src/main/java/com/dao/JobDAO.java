package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.mysql.cj.jdbc.result.ResultSetInternalMethods;

public class JobDAO {
  private Connection conn;

public JobDAO(Connection conn) {
	super();
	this.conn = conn;
}
  public boolean addJobs(Jobs j)
  {
	  boolean f=false;
	  
	  try {
		  String sql="insert into jobs(title,description,categeory,status,location,applylink) values(?,?,?,?,?,?)";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, j.getTitle());
		  ps.setString(2, j.getDescription());
		  ps.setString(3, j.getCategeory());
		  ps.setString(4, j.getStatus());
		  ps.setString(5, j.getLocation());
		  ps.setString(6, j.getApplylink());
		  int i=ps.executeUpdate();
		  if(i==1)
		  {
			  f=true;
		  }
		  
		  
		  
		  
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return f;
  }
  
  public List<Jobs> getAllJobs()
  {
	  List<Jobs> list=new ArrayList<Jobs>();
	  Jobs j=null;
	  try {
		  String sql="select * from jobs order by id desc";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ResultSet res=ps.executeQuery();
		  while(res.next())
		  {
			  j=new Jobs();
			  j.setId(res.getInt(1));
			  j.setTitle(res.getString(2));
			  j.setDescription(res.getString(3));
			  j.setCategeory(res.getString(4));
			  j.setStatus(res.getString(5));
			  j.setLocation(res.getString(6));
			  j.setPdate(res.getTimestamp(7)+"");
			  j.setApplylink(res.getString(8));
			  list.add(j);
			  
		  }
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return list;
  }
  
  
  public List<Jobs> getAllJobsForUser(){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where status=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Active");       //see one more time this code
			
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
				j.setApplylink(rs.getString(8));
				list.add(j);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

  
  
  
  
  public Jobs getJobById(int id)
  {
	 
	  Jobs j=null;
	  try {
		  String sql="select * from jobs where id=?";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setInt(1,id);
		  ResultSet res=ps.executeQuery();
		  while(res.next())
		  {
			  j=new Jobs();
			  j.setId(res.getInt(1));
			  j.setTitle(res.getString(2));
			  j.setDescription(res.getString(3));
			  j.setCategeory(res.getString(4));
			  j.setStatus(res.getString(5));
			  j.setLocation(res.getString(6));
			  j.setPdate(res.getTimestamp(7)+"");
			  j.setApplylink(res.getString(8));
			  
			  
		  }
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return j;
  }
  
  public boolean updateJob(Jobs j)
  {
	  

	  boolean f=false;
	  
	  try {
		  String sql="update  jobs set title=?,description=?,categeory=?,status=?,location=?,applylink=? where id=?";
		  PreparedStatement ps=conn.prepareStatement(sql);
		  ps.setString(1, j.getTitle());
		  ps.setString(2, j.getDescription());
		  ps.setString(3, j.getCategeory());
		  ps.setString(4, j.getStatus());
		  ps.setString(5, j.getLocation());
		  ps.setString(6, j.getApplylink());
		  ps.setInt(7, j.getId());
		  int i=ps.executeUpdate();
		  if(i==1)
		  {
			  f=true;
		  }
		  
		  
		  
		  
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return f;
	  
  }
  
  
  public boolean deletejob(int id)
  {
	  boolean f=false;
	 try{
		 String sql="delete from jobs where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setInt(1, id);
		 
		 int i=ps.executeUpdate();
		 if(i==1) {
			 f=true;
		 }
		 
		  
	  }catch(Exception e)
	 {
		  e.printStackTrace();
	 }
	 
	  return f;
  }
  
  
  ///// from  moreView.jsp
  
  public List<Jobs> getJobsORLocationAndCate(String categeory,String location){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where categeory=? or  location=? order by id desc";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,categeory);       //see one more time this code
			ps.setString(2,location); 
			
			
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
				j.setApplylink(rs.getString(8));
				list.add(j);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

  
  // from more_view.jsp
  public List<Jobs> getJobsAndLocationAndCate(String categeory,String location){
		List<Jobs> list=new ArrayList<Jobs>();
		Jobs j=null;
		try {
			String sql="select * from jobs where categeory=? and  location=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,categeory);       //see one more time this code
			ps.setString(2,location); 
			
			
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
				j.setApplylink(rs.getString(8));
				list.add(j);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

  
  
  
  
  
}
