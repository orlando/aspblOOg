<!-- #INCLUDE VIRTUAL="/aspblOOg/lib/models/post.asp" -->
<%
Dim post
Set post = New cPost

post.id = Request.Form("id")
post.title = Request.Form("title")
post.content = Request.Form("content")

post.update
%>