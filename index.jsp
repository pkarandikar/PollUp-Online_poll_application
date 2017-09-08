<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PollUP</title>
<%
	/*if(session.getAttribute("pass")!=null)
	{
		response.sendRedirect("login.jsp?username="+(String)session.getAttribute("user")+"&password="+(String)session.getAttribute("pass"));
	}*/
	
	String nm = "";
	String em = "";
	String bd = "";
	String un = "";
	if(request.getParameter("name")!=null)
	nm = request.getParameter("name");
	if(request.getParameter("email")!=null)
	em = request.getParameter("email");
	if(request.getParameter("date")!=null)
	bd = request.getParameter("date");
	if(request.getParameter("username")!=null && request.getParameter("iu")==null)
	un = request.getParameter("username");
	
	
	Cookie c = null;
   	Cookie[] cs = null; 
	String user=null;
	String pass=null;
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++){
         c = cs[i];
		 if(c.getName().equals("user"))
		 {
			user= (String)c.getValue();
		 }
         if(c.getName().equals("pass"))
		 {
			pass=(String) c.getValue();
		 }
      }
	}
	if(pass!=null)
	{
		response.sendRedirect("login.jsp?username="+user+"&password="+pass);
	}
	
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(date);
%>
<%
	String err="";
	if(request.getParameter("err")!= null)
		err="WRONG USERNAME/PASSWORD";
%>
</head>

<body>
<script src="js/script.js"></script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<%@include file="top1.jsp"%>

<div id="logreg">
	<div id="login">
    	<form action="login.jsp" method="post" >
        	<h1 >LOGIN </h1>
			<span style="color:#F00"><%out.print(err);%></span><br />
            <input type="text" placeholder="Username" name="username" class="textbox" style="margin-top:20px;" required="required"/><br />
            <input type="password" placeholder="Password" name="password" class="textbox" required="required"/><br />
            <button> Sign IN </button><br /><br />            
            <input type="checkbox" name="stay" value="true" /> Stay Connected! <a href="fpass.jsp" style="text-decoration:none; color:#09C; margin-left:45px;">Forgot Password?</a><br /><br />

            <div class="fb-login-button" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="false"></div>
        </form>
        
    </div>
    
    <div id="register">
    	<form action="register.jsp" method="get" autocomplete="on">	
        	<h1 >REGISTER </h1>
            <input required type="text" placeholder="Name" name="name" class="textbox" value="<%=nm%>" style="margin-top:20px;"/><br />
            <input required type="email" placeholder="Email" value="<%=em%>" name="email" class="textbox" /><br />
            <input required type="date"  name="date" class="textbox" placeholder="BirthDate" value="<%=bd%>" max="<%=now%>" min="1915-01-01"/><br />
            <input required type="text" placeholder="<%
			if(request.getParameter("iu")!=null)
			out.print("Try another Username");
			else
			out.print("Username");
			%>" name="username" value="<%=un%>" class="textbox" <%
			if(request.getParameter("iu")!=null)
			out.print("style='border:1px red solid;'");
			%>
			/><br />
            <input required type="password" pattern=".{8,255}" title="Min 8 characters" placeholder="Password" name="password" class="textbox" /><br />
        	<input required type="password" placeholder="<%
			if(request.getParameter("pdm")!=null)
			out.print("Please Enter Password as above!");
			else
			out.print("Retype Password");
			%>" name="rpassword" class="textbox" <%
			if(request.getParameter("pdm")!=null)
			out.print("style='border:1px red solid;'");
			%>/><br />
            <button> Register </button><br /><br />  
        </form>
    </div>
</div>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>

<script src="js/jquery.js"></script>
</body>
</html>