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
<title>Insert title here</title>
</head>
<body>

	<HR>
	<jsp:include page="Header.html"></jsp:include>
	<HR>
	<div style="clear: both;"></div>
	<HR>
	<h2 align="center">
		<font color="#4d4dff"><strong>Photo details in my
				library printed from my arrayList</strong></font>
	</h2>

	<%
	ArrayList<Photo> listPhoto = new ArrayList<Photo>();
	
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "PhotoLib";
	String userId = "root";
	String password = "root";
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	
	
	try {
		connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		statement = connection.createStatement();
		String sql = "SELECT * FROM PhotoLib.info;";

		resultSet = statement.executeQuery(sql);
		
		
		

	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	String sql = "SELECT * FROM PhotoLib.info;";
	resultSet = statement.executeQuery(sql);
	while (resultSet.next()){
		Photo objetPhoto = new Photo();
		objetPhoto.setStyle(resultSet.getString("Style"));
		objetPhoto.setDimension(resultSet.getString("Dimension"));
		objetPhoto.setColor(resultSet.getString("Color"));
		objetPhoto.setDate(resultSet.getDate("Date"));
		
		listPhoto.add(objetPhoto);
		
	}
	

	
	
	out.println("<ul>");
	for (int i=0; i<listPhoto.size(); i++)
          {
		
			  out.println("<li>");
              out.print(listPhoto.get(i).getStyle()+" ");
              out.println("<em>");
              out.print(listPhoto.get(i).getDimension()+" ");
              out.println("</em>");
              out.println(listPhoto.get(i).getColor()+" ");
              out.println("<em>");
              out.print(listPhoto.get(i).getDate()+" ");
              out.println("</em>");
              out.print("</li>");
              out.println("<br />");
          } 
	out.println("</ul>");
	
	
	
	
	%>

</body>
</html>