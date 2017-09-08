<%
	String user="";
	Cookie cookie = null;
   	Cookie[] cookie1 = null;
	cookie1 = request.getCookies();
	if(cookie1!=null)
	{
		for (int j = 0; j < cookie1.length; j++)
		{
			cookie = cookie1[j];
			if(cookie.getName().equals("user"))
			{
				user=(String) cookie.getValue();
			}
		}
	}
%>

<div id="mainnav">
	<a href="home.jsp"><img src="images/logo.png" style="height:40px;float:left;margin-top:5px;" /></a>
    <a href="hot.jsp"><div id="hot" class="navbuttons">
    </div></a>
    <a href="trending.jsp"><div id="trend" class="navbuttons">
    </div></a>
    <a href="fresh.jsp"><div id="fresh" class="navbuttons">
    </div></a>
    <a href="addq.jsp"><div id="addq" class="navbuttons">
    </div></a>
	<div id="cat" class="categories">
    </div>
    <div id="cdd" class="categories">
    	<div style="float:left;">
    	<ul >
        	<a href="categories/movies.jsp"><li>Movies</li></a>
            <a href="categories/tvshow.jsp"><li>Tv Shows</li></a>
            <a href="categories/science.jsp"><li>Science</li></a>
            <a href="categories/politics.jsp"><li>Politics</li></a>
            <a href="categories/edu.jsp"><li>Educational</li></a>
        </ul>
        </div>
        <div style="float:left;">
    	<ul >
        	<a href="categories/tech.jsp"><li>Technology</li></a>
            <a href="categories/music.jsp"><li>Music</li></a>
            <a href="categories/sports.jsp"><li>Sports</li></a>
            <a href="categories/yesno.jsp"><li>Yes/No</li></a>
            <a href="categories/other.jsp"><li>Others</li></a>
        </ul>
        </div>
    </div>
    <form action="search.jsp" method="get">
    <input type="text" placeholder="Search" id="sbar" name="sbox"/>
    <button id="sbutton" ></button>
    </form>
    <div id="prof" class="pdd" >
    </div>
    
    <div id="dd" class="pdd">
    	<ul class="pdd">
        	<a href="myacc.jsp"><li><%out.print(user);%></li></a>
            <a href="setting.jsp"><li>Settings</li></a>
            <a href="logout.jsp"><li>Log Out</li></a>
        </ul>
    </div>
    
</div>