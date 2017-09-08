<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	/*if(session.getAttribute("user")==null)
	{
		response.sendRedirect("index.jsp");
	}*/
	Cookie ck = null;
   	Cookie[] cs = null; 
	boolean log = false;
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++){
         ck = cs[i];
         if(ck.getName().equals("user"))
		 {
			 log= true;
		 }
      }
	}
%>
<%
	String err="";
	if(request.getParameter("add") != null)
	err="QUESTION ADDED SUCCESSFULLY!!!     ADD MORE DOWN HERE";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<%@include file="top.jsp"%>
    <div id="Quest">
    	<form action="insq.jsp" method="post" id="aqf">
        	<h4 style="margin-bottom:10px; text-align:center;"><span style="color:#090;"><%out.print(err);%></span></h4>
        	<!--<input type="text" id="aquest" placeholder="Enter your Question" /><br /><br />-->
            <input type="hidden" name="no" value="2" id="no"/>
            <textarea rows="3" id="aquest" placeholder="Enter your Question" name="aquest" required></textarea>
            <input type="text" placeholder="Answer 1" class="aans" name="aans1" id="aans1" required/><br />
            <input type="text" placeholder="Answer 2" class="aans" name="aans2" id="aans2" required/><br />
            <div id="anss">
            </div>
            <div id="addb">+</div>
            <button>Next</button>
            <div id="remb">-</div>
        </form>
    
    </div>


<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.js"></script>
</body>
</html>