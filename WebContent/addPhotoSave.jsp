<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*"%>
  
<%      try {
		String Style= request.getParameter("Style");
		String Dimension= request.getParameter("Dimension");
		String Color= request.getParameter("Color");
		String Date= request.getParameter("Date");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/PhotoLib";
		String user = "root";
		String pwd= "root";
		
		Connection con=DriverManager.getConnection(url, user, pwd);
		// (PreparedStatement avec insert ) (au lieu de (Statement avec select))
		PreparedStatement ps=con.prepareStatement("insert into PhotoLib.info values(?,?,?,?)");
		ps.setString(1,Style);
		ps.setString(2,Dimension);
		ps.setString(3,Color);
		ps.setString(4,Date);
		  
		// executeQuery ici est executeUpdate
			int s= ps.executeUpdate();
		if (s>0) {
		%>
		<jsp:forward page="Home.jsp"></jsp:forward>
		<% 
		}
		else{
		out.print("sorry!please fill correct detail and try again" );
		}
}
catch(Exception e){e.printStackTrace();
out.print("sorry!please fill correct detail and try again" );
}

%>