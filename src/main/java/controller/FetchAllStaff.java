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

@WebServlet("/fetchallstaff")
public class FetchAllStaff extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MyDao dao=new MyDao();
		List<Staff> list=dao.fetchAllStaff();
		if(list.isEmpty()){
			res.getWriter().print("<h1 style='color:red'>No Staff has Signed Up</h1>");
			req.getRequestDispatcher("AdminHome.html").include(req, res);
		}
		else{
			req.setAttribute("list", list);
			req.getRequestDispatcher("ApproveStaff.jsp").forward(req, res);
		}
	}
}
