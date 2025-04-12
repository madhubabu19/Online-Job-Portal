package com.servlet;

import java.io.IOException;

import com.dao.JobDAO;
import com.db.DBConnect;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addjobpost")
public class AddPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String description=req.getParameter("description");
			String applylink=req.getParameter("applyLink");
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategeory(category);
			j.setStatus(status);
			j.setDescription(description);
			j.setApplylink(applylink);
			
			HttpSession session=req.getSession()
;
			
			JobDAO dao= new  JobDAO(DBConnect.getConn());
			boolean f= dao.addJobs(j);
			if(f)
			{
				session.setAttribute("succMsg", "job post successfully...");
				resp.sendRedirect("add_job.jsp");
				
			}else {
				
				session.setAttribute("succMsg", "something wrong on server");
				resp.sendRedirect("add_job.jsp");
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	

}
