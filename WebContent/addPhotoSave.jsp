<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="java.sql.*"%>
    
<%      try {
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String phone= request.getParameter("phone");
		String message= request.getParameter("message");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/formulaire";
		String user = "root";
		String pwd= "root";
		
		Connection con=DriverManager.getConnection(url, user, pwd);
		// (PreparedStatement avec insert ) (au lieu de (Statement avec select))
		PreparedStatement ps=con.prepareStatement("insert into formulaire.info values(?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,phone);
		ps.setString(4,message);
		
		// executeQuery ici est executeUpdate
			int s= ps.executeUpdate();
		if (s>0) {
		%>
		<jsp:forward page="contact.jsp"></jsp:forward>
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