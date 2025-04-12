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
@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			 String   name= req.getParameter("fullname");
			 String  qualification= req.getParameter("qualification");
			 String  email= req.getParameter("email");
			 String  password= req.getParameter("password");
			 
			 UserDAO dao= new UserDAO(DBConnect.getConn());        //observe this stringname,username should match here
			 
			 User u=new User(name,email,password,qualification,"User");
			 
			 boolean f=dao.addUser(u);
			 HttpSession session =req.getSession();
			 if(f)
			 {
				session.setAttribute("succMsg", "Registration Successfull");
				resp.sendRedirect("signup.jsp");
			 }else {
				 
				 session.setAttribute("succMsg", "Something wrong on server");
					resp.sendRedirect("signup.jsp");
				 
			 }
		 
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	
	

}
