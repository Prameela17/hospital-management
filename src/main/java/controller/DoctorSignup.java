package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;

@WebServlet("/doctorsignup")
public class DoctorSignup extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MyDao dao = new MyDao();
		String name = req.getParameter("name");
		Long mobile = Long.parseLong(req.getParameter("mobile"));
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String qualification = req.getParameter("qualification");
		String specialization = req.getParameter("specialization");
		Date dob = Date.valueOf(req.getParameter("dob"));

		int age = Period.between(dob.toLocalDate(), LocalDate.now()).getYears();
		if (dao.fetchStaff(mobile) == null && dao.fetchStaff(email) == null && dao.fetchDoctor(mobile) == null
				&& dao.fetchDoctor(email) == null) {
			Doctor doctor = new Doctor();
			doctor.setAge(age);
			doctor.setName(name);
			doctor.setMobile(mobile);
			doctor.setEmail(email);
			doctor.setPassword(password);
			doctor.setQualification(qualification);
			doctor.setSpecialization(specialization);
			doctor.setGender(gender);
			doctor.setDob(dob);

			dao.saveDoctor(doctor);

			resp.getWriter().print("<h1 style='color:green'>Doctor Account Created SuccessFully, Wait for Admin Approval</h1>");
			resp.getWriter().print("<h1 style='color:red'>Your Doctor id:" + doctor.getId() + "</h1>");
			req.getRequestDispatcher("Login.html").include(req, resp);
		} else {
			resp.getWriter().print("<h1> Doctor Account already exists </h1>");
			req.getRequestDispatcher("Doctor_signup.html").include(req, resp);

		}
	}
}
