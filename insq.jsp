<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(date);
	java.util.Calendar c = java.util.Calendar.getInstance();
	c.add(java.util.Calendar.MONTH, 3); 
	java.util.Date date2 = c.getTime(); 
	String mdate = sdf.format(date2);
	
	String quest = (String) request.getParameter("aquest");
	int no = Integer.parseInt((String)request.getParameter("no"));
	String ans[] = new String[no];
	
	Cookie ck = null;
	Cookie[] cs = null; 
	String uname="";
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++)
		{
			ck = cs[i];
			if(ck.getName().equals("user"))
			{
				uname=(String) ck.getValue();		 
			}
		}
	}
	
	for(int i=0;i<no;i++)
	{
		ans[i]= (String)request.getParameter("aans"+(i+1));
	}
%>
</head>
<body>
	<%@include file="top.jsp"%>
    <div id="Quest">
    	<form action="insquest.jsp?<%=request.getQueryString()%>" method="post" id="aqf">
        	<input type="hidden" name="aquest" value="<%out.print(quest);%>" />
            <input type="hidden" name="no" value="<%out.print(no);%>" />
        	<%for(int i=0;i<no;i++){%>
					<input type="hidden" name="aans<%out.print(i+1);%>" value="<%out.print(ans[i]);%>" />
			<%}%>
                
        	<input type="text" placeholder="Search Keyword" class="aans" name="skey" required/><br />
            <select class="aans" name="type" required>
            <option selected="selected" value="">Choose Type...</option>
	        <option value="movies">Movies</option>
    	    <option value="tvshows">TV Shows</option>
        	<option value="science">Science</option>
            <option value="politics">Politics</option>
            <option value="educational">Educational</option>
            <option value="technology">Technology</option>
            <option value="music">Music</option>
            <option value="sports">Sports</option>
            <option value="yesno">Yes/No</option>
            <option value="other">Others</option>
            </select><br />
            
            <input type="date" placeholder="Expiration Date" class="aans" name="edate" value="<%=mdate%>"  max="<%=mdate%>" min="<%=now%>" required/><br />
	        <input type="time" placeholder="Expiration Time" class="aans" name="etime" required/><br />
            <button>Submit</button>
        </form>

    </div>
    
    
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.js"></script>    
</body>	

</html>