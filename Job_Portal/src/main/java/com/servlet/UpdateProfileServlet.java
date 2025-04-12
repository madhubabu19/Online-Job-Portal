package com.servlet;

import java.io.IOException;

import com.dao.UserDAO;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update_profile")
public class UpdateProfileServlet  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
		 int id=Integer.parseInt(req.getParameter("id"));
		 String name=req.getParameter("fullname");
		 String email=req.getParameter("email");
		 String qualification=req.getParameter("qualification");
		 String password=req.getParameter("password");
		 UserDAO dao=new UserDAO(DBConnect.getConn());
		 
		 User u=new User();
		 u.setId(id);
		 u.setName(name);
		 u.setEmail(email);
		 u.setPassword(password);
		 u.setQualification(qualification);
		 
		 
		 boolean f=dao.updateUser(u);
			HttpSession session=req.getSession();

	
		 if(f) {
			 
			 session.setAttribute("succMsg","profile updated successfully ");
			 resp.sendRedirect("home.jsp");
			 System.out.println(" it is coming under success updated ");
			 
		 }else {
			 
			 session.setAttribute("succMsg","something wromg on server ");
			 resp.sendRedirect("home.jsp");
			 
			 System.out.println(" it is coming under error ");
			 
			 
		 }
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		 
		
		
	}
	
	
	

}
