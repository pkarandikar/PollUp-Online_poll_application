<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
String qid = request.getParameter("qid");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();

	st.executeUpdate("UPDATE `question` SET `status`='active' WHERE qid="+qid);
	response.sendRedirect("myacc.jsp");




%>
<% st.close();con.close();%>