<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
String user = request.getParameter("user");
String token = request.getParameter("token");
String pass = request.getParameter("pass");
String rpass = request.getParameter("rpass");
//out.print(user);
//out.print(token);
if(pass.equals(rpass))
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	st.executeUpdate("UPDATE `user` SET `password`='"+pass+"' WHERE uname='"+user+"'");
	st.executeUpdate("UPDATE `user` SET `token`='' WHERE uname='"+user+"'");
	
	response.sendRedirect("spass.jsp");
}
else
{
	response.sendRedirect("http://localhost:4444/pollup/rpass.jsp?user="+user+"&token="+token+"&err=Passwords don't match");
}


%>
<% st.close();con.close();%>