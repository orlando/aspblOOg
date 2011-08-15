<!-- #INCLUDE FILE="lib/models/post.asp" -->
<!-- METADATA TYPE="typelib" FILE="C:\Program Files\Common Files\System\ado\msado15.dll" -->
<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Asp Blog</title>
  <link rel="stylesheet" href="public/css/blueprint/screen.css" type="text/css" media="screen, projection">
  <link rel="stylesheet" href="public/css/blueprint/print.css" type="text/css" media="print"> 
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="public/css/blueprint/ie.css" type="text/css" media="screen, projection">
  <![endif]-->
  <link rel="stylesheet" href="public/css/styles.css" type="text/css" media="screen"/>
	<link rel="stylesheet" href="public/css/colorbox.css" type="text/css" media="screen"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	<script src="public/js/jquery.colorbox.js"></script>	
	<script src="public/js/jquery.jeditable.js"></script>
	<script src="public/js/app.js"></script>
	
  <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
</head>
<body>
  <div class="container ">
    <header class="span-24">
			<a class="opacity blog-title" href="/aspblOOg">Blog</a>
			<nav>
				<ul>
					<li>
						<a id="newpost" class="opacity" href="lib/views/posts/new.asp">New Post</a>
						<% 
						Dim post,rs
						Set post = New cPost						
						Set rs = post.all
																	
						if rs.RecordCount <> 0 Then
							Response.Write "<a id='deletepost' class='opacity' href='#' onclick='enableEdit()'>Edit Posts</a>"
						end if					
						%>						
					</li>					
				</ul>
			</nav>
      
    </header>	
    <content class="span-24">
		<%
			While Not rs.EOF
				Response.Write "<div id='post-"&rs("id")&"'><div id='title-"&rs("id")&"' class='post-title'>"& rs("title") & "<img class='deletepost-icon' src='public/images/delete_icon.png' onclick='deletePost("&trim(rs("id"))&")' /></div>"
				Response.Write "<div id='content-"&rs("id")&"' class='post-content prepend-1 append-1'>" & rs("content") & "</div></div>"								 
				rs.MoveNext
			Wend
			Set rs = Nothing		
    %>
    </content>    
  </div>
</body>
</html>
