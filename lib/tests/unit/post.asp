<!-- #include file="../../models/post.asp" -->
<%
Class PostTest	
	Private m_post

	Public Function TestCaseNames()
		TestCaseNames = Array("Should_create_a_new_post", "Should_delete_a_post", "Should_update_a_post")
	End Function

	Public Sub SetUp()
		Set m_post = New cPost		
	End Sub

	Public Sub TearDown()
	End Sub

	Public Sub Should_create_a_new_post(testResult)
		Dim t_auxvar,t_post,t_auxpost
		Set t_post = New cPost
		Set t_auxpost = New cPost

		t_post.title = "Test Post"
		t_post.content = "Create Post Test"
		t_post.save
		t_auxpost.last
				
		Call testResult.AssertEquals(t_post.content, t_auxpost.content, "")
	End Sub

	Public Sub Should_update_a_post(testResult)		
		Dim t_auxvar,t_post,t_auxpost
		Set t_post = New cPost
		Set t_auxpost = New cPost

		t_post.last
		t_auxvar = t_post.id
		t_post.title = "New title"
		t_post.content = "Updated content"
		t_post.update

		t_auxpost.find(t_auxvar)

		Call testResult.AssertEquals(t_post.content, t_auxpost.content, "")
	End Sub

	Public Sub Should_delete_a_post(testResult)
		Dim t_auxvar,t_post,t_auxpost
		Set t_post = New cPost
		Set t_auxpost = New cPost

		t_post.last
		t_post.delete
		t_auxpost.last

		Call testResult.AssertNotEquals(t_post.id, t_auxpost.id, "")
	End Sub
End Class
%>