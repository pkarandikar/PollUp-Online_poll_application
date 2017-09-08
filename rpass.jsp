<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<%
 String user = null;
 String token = null;
 
	 Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("Select * from user where uname='"+request.getParameter("user")+"'");
	if(rs.next())
	{
		//out.print("<script>alert(\"data found\")</script>");
	if(request.getParameter("user").equals(rs.getString(1)))
	{
		user = request.getParameter("user");
		//out.print("<script>alert('"+user+"')</script>");
	}
	if(request.getParameter("token").equals(rs.getString(6)))
	{
		
		token = request.getParameter("token");
		//out.print("<script>alert('"+token+"')</script>");
	}
	}
	if(user==null || token==null)
		response.sendRedirect("index.jsp");
		String err="";
	if(request.getParameter("err")!=null)
		err=request.getParameter("err");
 
%>
<body>

	<%@include file="top1.jsp"%>
	<div id="Quest" class="fpass" style="margin-top:25px;">
    
	    <h1>Reset Password</h1>
        <span style="color:red;"><%=err%></span><br />
        <form method="post" action="rpassb.jsp">
        		<input type="hidden" name="user" value="<%=user%>" />
                <input type="hidden" name="token" value="<%=token%>" />
                <input required type="password" placeholder="Enter New Password" pattern=".{8,255}" title="Min 8 characters" name="pass" class="textbox" style="margin-top:20px;"/><br />
                <input required type="password" placeholder="Re-Type New Password" name="rpass" class="textbox" /><br />
                <button>Submit</button>
                </form>

</body>
<% st.close();con.close();%>
</html>