<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

	Cookie[] cookies = null;
        cookies = request.getCookies();
        if(cookies != null){
            for(int i = 0; i < cookies.length; i++){
                 Cookie cookie = cookies[i];
                 
                     cookie.setMaxAge(0);
                     response.addCookie(cookie);
                 }
             }
	response.sendRedirect("index.jsp");

%>