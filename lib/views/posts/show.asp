<!-- #INCLUDE VIRTUAL="/aspblOOg/lib/models/post.asp" -->
<%
Dim post
Set post = New cPost
post.last

response.Write(post.id)
response.Write(post.content)
response.Write(post.title)
response.Write(""&Date&" "&Time&"")
%>