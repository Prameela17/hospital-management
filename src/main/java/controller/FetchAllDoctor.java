package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;

@WebServlet("/fetchalldoctor")
public class FetchAllDoctor extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		if (req.getSession().getAttribute("admin") != null) {
			MyDao dao = new MyDao();
			List<Doctor> list = dao.fetchAllDoctor();
			if (list.isEmpty()) {
				res.getWriter().print("<h1 style='color:red'>No Staff has Signed Up</h1>");
				req.getRequestDispatcher("AdminHome.html").include(req, res);
			} else {
				req.setAttribute("list", list);
				req.getRequestDispatcher("ApproveDoctor.jsp").forward(req, res);
			}
		} else {
			res.getWriter().print("<h1 style='color:yellow'>Session expired,Login again</h1>");
			req.getRequestDispatcher("Login.html").include(req, res);
		}
	}
}
