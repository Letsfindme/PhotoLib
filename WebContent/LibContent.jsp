<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="pack1.Photo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My photo library</title>
</head>
<body>


	<%
	
	ArrayList<Photo> listPhoto = new ArrayList<Photo>();
	
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "PhotoLib";
		String userId = "root";
		String password = "root";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	<h2 align="center">
		<font color="#4d4dff"><strong>Photos in my library printed directly from the db</strong></font>
	</h2>
	<table align="center" cellpadding="4" cellspacing="4">
		<tr>

		</tr>
		<tr bgcolor="#008000">
			<td><b>Name</b></td>
			<td><b>Book ID</b></td>
			<td><b>Year</b></td>
			<td><b>Year</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
				statement = connection.createStatement();
				String sql = "SELECT * FROM PhotoLib.info;";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
							%>
							<tr bgcolor="#8FBC8F">
					
								<td><%=resultSet.getString("Style")%></td>
								<td><%=resultSet.getString("Dimension")%></td>
								<td><%=resultSet.getString("Color")%></td>
								<td><%=resultSet.getDate("Date")%></td>

							</tr>

							<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	
	<h2 align="center">
		<font color="#4d4dff"><strong>Photos in my library printed from my arrayList</strong></font>
	</h2>
	
	<%
	while (result.next()){
		Photo objetPhoto = new Photo();
		objetPhoto.setStyle(result.getString("Style"));
		objetPhoto.setDimension(result.getString("Dimension"));
		objetPhoto.setColor(result.getString("Color"));
		objetPhoto.setDate(result.getDate("Date"));
		
		listPhoto.add(objetPhoto);
		
	}
	

	
	
	out.println("<ul>");
	for (int i=0; i<listPhoto.size(); i++)
          {
		
			  out.println("<li>");
			  out.println("<strong>");
              out.print(listPhoto.get(i).getStyle()+" ");
              out.println("</strong>");
              out.print(", de ");
              out.println("<em>");
              out.print(listPhoto.get(i).getDimension()+" ");
              out.println("</em>");
              out.print(" - ");
              out.println(listPhoto.get(i).getColor()+" ");
              out.print(" - ");
              out.println(listPhoto.get(i).getDate()+" ");
              out.print(".");
              out.print("</li>");
              out.println("<br />");
          } 
	out.println("</ul>");%>
	
	
	
	%>
</body>
</html>