<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
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
				log= true;
			}
		}
	}
	if(!log)
	{
		response.sendRedirect("index.jsp");
	}
%>
<%
	String err ="";
	String err1="";
	String err2="";	
	String x="t";
	String y="k";
	String z="s";
	if(x.equals(request.getParameter("err")))
		err="PASSWORD CHANGED SUCCESSFULLY";
	if(y.equals(request.getParameter("err")))
		err1="PASSWORD NOT CHANGED";
	if(z.equals(request.getParameter("err")))
		err2="DETAILS UPDATED";
%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	String name="";
	String email="";
	String bday="";
	ResultSet rs = st.executeQuery("SELECT  `name`, `email`, `birthdate` FROM `user` WHERE `uname`='"+ck.getValue()+"';");
	if(rs.next())
	{
	
	name= (String) rs.getString(1);
	email= (String) rs.getString(2);
	bday= (String) rs.getString(3);
	}
%>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(date);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

	<%@include file="top.jsp"%>
    <div id="Quest">
    	<div id="gen" class="setting">GENERAL</div>
        <div id="cpass" class="setting">CHANGE PASSWORD</div>
        <div id="genset" class="inset">
        	<span style="color:#090"><%=err2%></span><br />
	            <form action="chngdet.jsp" method="post">
                    <input required type="text" placeholder="Name" value="<%out.print(name);%>" name="name" class="textbox" style="margin-top:20px;"/><br />
                    <input required type="email" placeholder="Email" value="<%out.print(email);%>" name="email" class="textbox" /><br />
                    <input required type="date"  name="date" class="textbox" placeholder="BirthDate" value="<%out.print(bday);%>" max="<%=now%>" min="1915-01-01" /><br />
                    <button>UPDATE</button>
                </form>
        </div>
      	<div id="passet" class="inset">
            <h1>CHANGE PASSWORD</h1>
            <span style="color:#090"><%=err%></span><span style="color:#F00"><%=err1%></span><br />
              	<form action="chngpass.jsp" method="post">
                <input required type="password" placeholder="Old Password" name="oldpassword" class="textbox" /><br />
                <input required type="password" placeholder="New Password" pattern=".{8,255}" title="Min 8 characters" name="newpassword" class="textbox" /><br />
                <input required type="password" placeholder="Re-Type New Password" name="rnewpassword" class="textbox" /><br />
                <button>CHANGE</button>
                </form>
            </div>
    </div>
    
    <body>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.js"></script>  
</body>
<% st.close();con.close();%>
</html>