package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MyDao;
import dto.Patient;

@WebServlet("/addpatient")
@MultipartConfig
public class AddPatient extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name = req.getParameter("name");
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		Date dob = Date.valueOf(req.getParameter("dob"));
		int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		Part picture=req.getPart("picture");
		byte[] image=new byte[picture.getInputStream().available()];
		picture.getInputStream().read(image);
		Patient patient=new Patient();
		patient.setName(name);
		patient.setMobile(mobile);
		patient.setDob(dob);
		patient.setAge(age);
		patient.setPicture(image);
		
		MyDao dao = new MyDao();
		dao.savePatient(patient);
		
		res.getWriter().print("<h1 style='color:green'>Data Added Successfully</h1>");
		req.getRequestDispatcher("StaffHome.html").include(req, res);
		
	}

}
