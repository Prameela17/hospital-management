<%@page import="dto.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="dto.Staff"%>
<%@page import="dto.Patient"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Appointment Form</title>
<style>
	*{
        margin: 0;
        padding: 0;
     }
     body{
        width: 100%;
        height: 100vh;
        background-image: url(images/R.jpg);
        background-size: cover;
		background-repeat: no-repeat;
        background-position: center;
     }
     h1{
        padding: 20px 0;
        color: lime;
        margin: 0 0 0 190px;
    }
    .canva{
            width: 85%;
            margin: 10px 0 0 180px;
            color: white;
            font-size: larger;
            font-weight: bolder;
        }
        #item1{
            height: 28px;
            width: 8%;
            position: relative;
            top: 5px;
            left: 10px;
            margin: 10px;
            background-color:rgb(243, 189, 54);
            border-color: rgb(243, 189, 54);
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
        #item2{
           height: 30px;
            width: 11%;
            position: relative;
            top: 5px;
            left: 5px;
            margin: 10px;
            background-color:rgb(243, 189, 54);
            border-color: rgb(243, 189, 54);
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
        .canva1 button{
            height: 30px;
            width: 90px;
            position: relative;
            top: 10px;
            left: 250px;
            margin: 10px;
            background-color:palevioletred;
            border-color: palevioletred;
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
</style>
</head>
<body>

	<%
		Staff staff = (Staff) session.getAttribute("staff");

		int pid = Integer.parseInt(request.getParameter("id"));
		MyDao dao = new MyDao();
		Patient patient = dao.fetchPatient(pid);
		if (patient == null) {
			response.getWriter().print("<h1 style='color:red'>Enter proper Patient Id</h1>");
			request.getRequestDispatcher("FetchById.html").include(request, response);
		} else {
			List<Doctor> list = dao.fetchAvailableDoctor();
			if (list.isEmpty()) {
				response.getWriter().print("<h1 style='color:red'>No Doctors are Available</h1>");
				request.getRequestDispatcher("StaffHome.html").include(request, response);
			} else {
	%>
	<h1><u>Appointment Form</u></h1>
	<div class="canva">
	<form action="bookappointment" method="post">
		Patient Id: <input type="text" name="pid" value="<%=pid%>"
			readonly="readonly"><br> Patient Name: <input
			type="text" name="pname" value="<%=patient.getName()%>"
			readonly="readonly"><br> Staff Name: <input type="text"
			name="staffname" value="<%=staff.getName()%>" readonly="readonly"><br>
		Problem:<input type="text" name="problem"><br> Select
		Doctor: <select name="doctor">
			<%
				for (Doctor doctor : list) {
			%>
			<option value="<%=doctor.getId()%>"><%=doctor.getName()%> (<%=doctor.getSpecialization()%>)
			</option>
			<%
				}
			%>
		</select> <br>
		<button id="item1" type="reset">Cancel</button>
		<button id="item2">Fix Appointment</button>
	</form>
	</div>
	<%}%>
	<div class="canva1">
		<a href="fetchallpatient"><button>Back</button></a>
	</div>
	<%}%>
</body>
</html>