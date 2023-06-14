package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Staff;

@WebServlet("/fetchallpatient")
public class FetchAllPatient extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if (req.getSession().getAttribute("staff") == null){
			res.getWriter().print("<h1 style='color:red'>Session expired</h1>");
			req.getRequestDispatcher("Login.html").include(req, res);
		}else{
			MyDao dao = new MyDao();
			List<Staff> list = dao.fetchAllStaff();
			if (list.isEmpty()) {
				res.getWriter().print("<h1 style='color:red'>No Patient data found</h1>");
				req.getRequestDispatcher("AdminHome.html").include(req, res);
			}else{
				req.setAttribute("list", list);
				req.getRequestDispatcher("PatientList.jsp").forward(req, res);
			}
		}
	}
}
