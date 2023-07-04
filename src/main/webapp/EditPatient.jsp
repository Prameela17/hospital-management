<%@page import="dto.Patient"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EditPatient</title>
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
        padding: 120px 0;
        color: lime;
        margin: 0 0 0 200px;
    }
    .canva{
        width: 85%;
        height: 50px;
        color: white;
        margin: -320px 0 0 -250px;
        padding: 260px 0;
        font-size: large;
        font-weight: bold;
        background: transparent;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #item1{
            height: 28px;
            width: 31%;
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
           height: 29px;
            width: 33%;
            position: relative;
            top: 5px;
            left: 20px;
            margin: 10px;
            background-color:rgb(243, 189, 54);
            border-color: rgb(243, 189, 54);
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
        .canva1 button{
            height: 30px;
            width: 100px;
            position: relative;
            top: -210px;
            left: 260px;
            margin: 10px;
            background-color: palevioletred;
            border-color: palevioletred;
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
</style>
</head>
<body>
	<h1><u>Edit Patient By ID</u></h1>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		MyDao dao = new MyDao();
		Patient patient = dao.fetchPatient(id);
		if (patient == null) {
			response.getWriter().print("<h1>Enter Valid id</h1>");
			request.getRequestDispatcher("Enterpatientid.html").include(request, response);
		} else {
	%>
	<div class="canva">
	<form action="updatepatient" method="post">
		Patient Id:<input type="text" name="id" value="<%=patient.getId()%>" readonly="readonly"><br> 
		Name:<input type="text" name="name" value="<%=patient.getName()%>"><br> 
		Mobile:<input type="text" name="mobile" value="<%=patient.getMobile()%>" readonly="readonly"><br> 
		Date of Birth:<input type="date" name="dob" value="<%=patient.getDob()%>"><br>
		<button id="item1" type="reset">Cancel</button>
		<button id="item2">Update</button>
	</form>
	</div>
	<div class="canva1">
		<a href="EnterPatientId.html"><button>Back</button></a>
	</div>
	<%
		}
	%>
</body>
</html>