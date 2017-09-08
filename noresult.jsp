<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<body>

	<%@include file="top.jsp"%>
	<div id="Quest" class="fpass" >
    
	    <h1>No Result Found</h1>
                <div style="font-size:20px;height:100px;">Oops!!We don't have any polls for this Category!!But you can add a new question related to this topic or go to home page</div>
                <a href="../addq.jsp"><button>Add Poll</button></a>
                <a href="../home.jsp"><button>Go Home</button></a>
    </div>
<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/script.js"></script>
<script src="../js/jquery.js"></script>

</body>
</html>