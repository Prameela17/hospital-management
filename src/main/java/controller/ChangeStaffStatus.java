package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MyDao;
import dto.Doctor;
import dto.Staff;

@WebServlet("/changestaffstatus")
public class ChangeStaffStatus extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		MyDao dao = new MyDao();
		Staff staff = dao.fetchStaff(id);
		if(staff.isStatus())
			staff.setStatus(false);
		else
			staff.setStatus(true);
		
		dao.updateStaff(staff);
		
		res.getWriter().print("<h1 style='color:green'>Updated Successfully</h1>");
		req.setAttribute("list", dao.fetchAllStaff());
		req.getRequestDispatcher("ApproveStaff.jsp").include(req, res);
	}

}
