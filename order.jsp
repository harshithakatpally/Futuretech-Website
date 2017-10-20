<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*" %>

<html>

	<head>
		<link rel="stylesheet" href="orderstyle.css">
	</head>

	<body>
<%

	String DB_URL="jdbc:mysql://localhost/db127";

	String USER="root";

	String PASS="hasinI@24";
	ServletContext sc=request.getServletContext();
	String x=(String) sc.getAttribute("name");
	session.putValue("x",x);	

	HttpSession s = request.getSession(true);

	Integer visitCount = new Integer(0);

	String visitCountKey = new String("visitCount");

	String userIDKey = new String("emailid");

	String emailid=new String("x");
	
	String[] itemsSelected;
	String itemName;
	itemsSelected=request.getParameterValues("item");
	Connection conn=null;

	Class.forName("com.mysql.jdbc.Driver");

	conn=DriverManager.getConnection(DB_URL,USER,PASS);
	Statement stmt=conn.createStatement();
	if(x==null)
	{
		RequestDispatcher rd=request.getRequestDispatcher("loginorder.html");
		rd.forward(request,response);
	}
	
	else	
	{
		if(itemsSelected!=null)
		{ %>
			<div id="wrapper">
			<a href="productsl.html">Back to products./a>
			<h2>Your Shopping Cart!!</h2>
			<table id="tab">
				<tr>
					<th>Name of the product</th>
					<th>Product Code</th>
					<th>Price Per Unit</th>
				</tr>

			<% for(int i=0;i<itemsSelected.length;i++)
			{
				itemName=itemsSelected[i];
				session.putValue("itemName",itemName);
				stmt.executeUpdate("insert into online values('"+x+"','"+itemName+"')");
				ResultSet rs=stmt.executeQuery("select * from prodinfo where code='"+itemName+"'");
				if(rs.next())
				{
					String name=rs.getString("nop");
					String cd=rs.getString("code");
					String cost=rs.getString("cost"); %>
					<tr>
						<td><%= name %></td>
						<td><%= cd %></td>
						<td><%= cost %></td>
					</tr>	
				<% }
			} %>
			 </table>
						
			<%
		}
		
	} %>
		<ul>
			<li>Cash on delivery.</li>
		</ul>
		<form action="ordersucc.jsp" method="post">
		<input type="submit" value="Place Order">
		</form>
		</div>
	<% stmt.close();
	conn.close();
	 %>
		
	</body>

</html>
