<%
Class cPost

	Private attr_id
	Private attr_title
	Private attr_content

	Private Sub Class_Initialize
		title = "no title"
		content = ""
	End Sub

	Public Property Get title
		title = attr_title
  End Property

	Public Property Let title(new_title)
	  attr_title = new_title
  End Property
	
	Public Property Get content
		content = attr_content
  End Property
	
	Public Property Let content(new_content)
	  attr_content = new_content
  End Property

	Public Property Get id
		id = attr_id
  End Property

	Public Property Let id(new_id)
		attr_id = new_id
  End Property

	Public Function	all()
		Dim sql,con,rs
		Set con =  Server.CreateObject("ADODB.Connection")
		Set rs =  Server.CreateObject("ADODB.RecordSet")		
		
		sql = "SELECT * FROM posts"
		con.ConnectionString = "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		' rs.Open Source, ActiveConnection, CursorType, LockType, Options
		rs.CursorLocation = adUseClient
		rs.Open sql, con, 1 , 4
		rs.ActiveConnection = Nothing
		con.Close
		Set all = rs
	End Function

	Public Function save()
		Dim con,rs
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
		
		con.ConnectionString = "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		rs.Open "posts",con,3,3

		rs.AddNew
			rs.Fields("title") = Me.title
			rs.Fields("content") = Me.content
			rs.Fields("created_at") = ""&Time&""&Date&""
			rs.Fields("updated_at") = rs.Fields("created_at")
		rs.Update

		rs.Close
		con.Close
	End Function

	Public Function find(post_id)
		Dim con,rs,post,sql
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
		sql = "SELECT * FROM posts WHERE id ="&post_id&""
		Set post = new cPost
		
		con.ConnectionString = "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		rs.Open sql,con,1,1
				
		if rs.RecordCount = 1 then
			Me.id = rs.fields("id").Value
			Me.title = rs.fields("title").Value
			Me.content = rs.fields("content").Value
			find = Me.id
			mvarSaveOnTerminate = true			
		else
			err.raise 1, "Item with ID " &post_id& " was not found"
		end if
		rs.close
		con.close
	End Function
	
	Public Function delete()
		Dim con,rs,sql
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
		sql = "DELETE FROM posts WHERE id ='"&Me.id&"'"

		con.ConnectionString = "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		rs.Open sql,con,1,3
		con.Close
	End Function
	
	Public Function update()
		Dim con,rs,sql
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
	End Function

	Public Function first()
		Dim con,rs,sql,id
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
		id = 0
		sql = "SELECT MIN(id) FROM posts"
		con.ConnectionString =  "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		rs.Open sql,con,1,1
		If rs.RecordCount = 1 Then			
			id = rs.fields("").value
		End If
	
		rs.close

		if id <> 0 then
			first = Me.find(id)
		else
			err.raise 1, "No posts found"
		end if
		con.close		
	End Function

	Public Function last()
		Dim con,rs,sql,id
		Set con = Server.CreateObject("ADODB.Connection")
		Set rs  = Server.CreateObject("ADODB.RecordSet")
		id = 0
		sql = "SELECT MAX(id) FROM posts"
		con.ConnectionString = "File Name=C:\inetpub\wwwroot\aspblOOg\aspblOOg.udl;"
		con.Open

		rs.Open sql,con,1,1
		If rs.RecordCount = 1 Then
			id = rs.fields("")
		End If

		rs.close
		con.close

		if id <> 0 then
			last = Me.find(id)
		else
			err.raise 1, "No posts found"
		end if
		
	End Function
End Class	
%>