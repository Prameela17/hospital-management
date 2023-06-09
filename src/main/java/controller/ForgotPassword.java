package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;
import dto.Staff;

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		String password = req.getParameter("password");
		Date dob = Date.valueOf(req.getParameter("dob"));
		//		Doctor doctor=new Doctor();
		//		staff stf=new Staff();
		
		MyDao dao = new MyDao();
		Doctor doctor = dao.fetchDoctor(id);
		Staff staff = dao.fetchStaff(id);

		if (doctor == null && staff == null) {
			res.getWriter().print("<h1 style='color:red'>Invalid Id</h1>");
			req.getRequestDispatcher("ForgotPassword.html").include(req, res);
		}else{
			if (doctor != null) {
				if (doctor.getName().equals(name) && doctor.getMobile()==mobile && doctor.getDob().equals(dob)) {
						doctor.setPassword(password);
						dao.updateDoctor(doctor);
						res.getWriter().print("<h1 style='color:green'>Password Update Successfully</h1>");
						req.getRequestDispatcher("Login.html").include(req, res);
					}else{
						res.getWriter().print("<h1 style='color:red'>Invalid Details</h1>");
						req.getRequestDispatcher("ForgotPassword.html").include(req, res);
				}
			}else{
				if(staff.getName().equals(name) && staff.getMobile()==mobile && staff.getDob().equals(dob)) {
						staff.setPassword(password);
						dao.updateStaff(staff);
						res.getWriter().print("<h1 style='color:green'>Password Update Successfully</h1>");
						req.getRequestDispatcher("Login.html").include(req, res);
				} else {
						res.getWriter().print("<h1 style='color:red'>Invalid Details</h1>");
						req.getRequestDispatcher("ForgotPassword.html").include(req, res);
					}
			}
				
		}
	}
	
}
