<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
String err ="";
	if(request.getParameter("iu")!=null)
		err=request.getParameter("iu");
%>
</head>
<body>
	
    <%@include file="top1.jsp"%>
	<div id="Quest" class="fpass" style="margin-top:25px;">
    <h1>Forgot Password</h1>
                <div>To reset your password, enter the username and email address you used to register in to PollUP.</div>
                <span style="color:red;"><%=err%></span><br />
                    <form action="fpassb.jsp" method="post">
            		<input required type="text" placeholder="Username" name="username" class="textbox"/><br />
                    <input required type="email" placeholder="Email" name="email" class="textbox" /><br />
                    <button>Submit</button>
                    </form>
    </div>

</body>
</html>