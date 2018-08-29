<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<marquee dir="ltr">
		<font style="color: navy;">Please fill up photo information</font>
	</marquee>
<CENTER> 
	<form action="addPhotoSave.jsp">

		<table>
			<tr>
				<td>Style:</td>
				<td><input type="text" name="Style"></td>
			</tr>
			<tr>
				<td>Dimension:</td>
				<td><input type="text" name="Dimension"></td>
			</tr>
			<tr>
				<td>Color:</td>
				<td><input type="text" name="Color"></td>
			</tr>
			<tr>
				<td>Date:</td>
				<td><input type="text" name="Date" value="2019-01-01"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Add photo"></td>
			</tr>
		</table>

	</form>
</CENTER> 
	
	
	<div class="clear"></div>

	<a href=Home.jsp>BACK TO HOME</a>

	<HR>

	<jsp:include page="Footer.html"></jsp:include>

	<HR>
	

</body>
</html>