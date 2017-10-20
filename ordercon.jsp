<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*" %>

<html>

	<head><title>Order Placed</title>
	<style>
		a{font-size:25px; margin-left:100px; margin-top:30px;}

		h2{font-size:30px; color:#008b8b; text-align:center; margin-top:60px;}
	</style>
	</head>

	<body>
<%	String DB_URL="jdbc:mysql://localhost/db127";

	String USER="root";

	String PASS="hasinI@24";
	ServletContext sc=request.getServletContext();
	String x=(String) sc.getAttribute("name");
	String nameu=request.getParameter("nameu");
	String mobile=request.getParameter("mn");
	String addr=request.getParameter("add");
	String mailid=request.getParameter("mail");
	session.putValue("x",x);
	session.putValue("nameu",nameu);
	session.putValue("mobile",mobile);
	session.putValue("addr",addr);
	session.putValue("mailid",mailid);
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");

	conn=DriverManager.getConnection(DB_URL,USER,PASS);
	Statement stmt=conn.createStatement();
	stmt.executeUpdate("insert into details values('"+x+"','"+nameu+"','"+mobile+"','"+addr+"','"+mailid+"')");
	%>
	<a href="productsl.html">Back to products.</a>
	<h2>Order Placed Sucessfully.</h2>
	<% conn.close();
		stmt.close(); %>
	</body>
</html>
	
	