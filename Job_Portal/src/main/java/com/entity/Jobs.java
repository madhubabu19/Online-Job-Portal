package com.entity;

import java.sql.Timestamp;

public class Jobs {
	private int id;
	private  String title;
	private  String description;
	private  String categeory;
	private  String status;
	private  String location;
	private  String pdate;
	private  String applylink;
	
	
	
	
	public Jobs(String title, String description, String categeory, String status, String location, String pdate ,String applylink) {
		super();
		this.title = title;
		this.description = description;
		this.categeory = categeory;
		this.status = status;
		this.location = location;
		this.pdate = pdate;
		this.applylink = applylink;
	}
	public Jobs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategeory() {
		return categeory;
	}
	public void setCategeory(String categeory) {
		this.categeory = categeory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String timestamp) {
		this.pdate = timestamp;
	}
	public String getApplylink() {
		return applylink;
	}
	public void setApplylink(String applylink) {
		this.applylink = applylink;
	}
	
	
	
	

}
