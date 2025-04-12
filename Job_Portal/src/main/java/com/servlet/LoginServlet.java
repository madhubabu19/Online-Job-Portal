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
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			HttpSession session=req.getSession();
			User u=new User();
			
			if("admin@gmail.com".equals(em) && "admin".equals(ps))
			{
				session.setAttribute("userobj", u);
				u.setRole("admin");
				resp.sendRedirect("admin.jsp");
			}else{
				///user module code writing here
				UserDAO dao= new UserDAO(DBConnect.getConn());
				
				User user=dao.login(em, ps);
				//System.out.println("Email: " + user.getEmail());
				//System.out.println("Password: " + user.getPassword());
				System.out.println(user+"user values are coming null");
				
				if(user!=null)
				{
					
					session.setAttribute("userobj", user);
							
					System.out.println("userobj class = hello world user is not equals to null " );
					//System.out.println("userobj class = " + user.getClass().getName());
					resp.sendRedirect("home.jsp");
				}
			else
				{
					session.setAttribute("succMsg", "Invalid Email & Password ");
					System.out.println("userobj class = hello world user is  equals to null  it is coming to else block" );
					//System.out.println("userobj class = " + user.getClass().getName());
					
					resp.sendRedirect("login.jsp");
				}
				
				 
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	

}
