<!-- #INCLUDE VIRTUAL="/aspblOOg/lib/models/post.asp" -->
<%
Dim post
Set post = New cPost

post.title = Request.Form("title")
post.content = Request.Form("content")
post.save

Response.Write "<div class='success'>Post Created</div>"
%>