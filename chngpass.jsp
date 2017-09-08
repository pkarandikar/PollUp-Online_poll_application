<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	boolean flag =false;
	String opass=(String) request.getParameter("oldpassword");
	String npass=(String) request.getParameter("newpassword");
	String rnpass=(String)request.getParameter("rnewpassword");
	
	Cookie ck = null;
	Cookie[] cs = null; 
	String user="";
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
	
	
	
	ResultSet rs = st.executeQuery("SELECT * FROM `user` where uname='"+user+"'");
	if(rs.next())
	{
		if(opass.equals(rs.getString(2)))
		{
			if(npass.equals(rnpass))
			{
				flag=true;
			}
		}
	}
	
	if(flag)
	{
		st.executeUpdate("UPDATE `user` SET `password`='"+npass+"' WHERE uname='"+user+"'");
		response.sendRedirect("setting.jsp?err=t");
	}
	else
	{
		response.sendRedirect("setting.jsp?err=k");
	}
%>
<% st.close();con.close();%>
