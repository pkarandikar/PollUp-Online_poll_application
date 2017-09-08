<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	String user="";
	Cookie ck = null;
   	Cookie[] cs = null; 
	boolean log = false;
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++)
		{
			ck = cs[i];
			if(ck.getName().equals("user"))
			{
				user=(String) ck.getValue();
			}
		}
	}
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String date = request.getParameter("date");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	st.executeUpdate("UPDATE `user` SET `name`='"+name+"',`email`='"+email+"',`birthdate`='"+date+"' WHERE `uname`='"+user+"';");
	response.sendRedirect("setting.jsp?err=s");
%>
<% st.close();con.close();%>
