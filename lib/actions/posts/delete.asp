<!-- #INCLUDE VIRTUAL="/aspblOOg/lib/models/post.asp" -->
<%
Dim post
Set post = New cPost

post.find(Request.Form("id"))
post.delete
%>