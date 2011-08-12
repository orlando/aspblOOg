<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>New Post</title>
	<link rel="stylesheet" href="../../../public/css/styles.css" type="text/css" media="screen"/>
</head>
<body>
	<div class="post-container">
		<form id="newpost-form" method="post" action="../../../lib/actions/posts/create.asp">
			<input id="newpost-title" class="round inset" value="Title" name="title" type="text" /><br />
			<textarea id="newpost-content" class="round inset" name="content" rows="10" cols="20">Content</textarea><br />
			<input id="newpost-submit" class="round button" value="Create Post" type="submit" />
		</form>
	</div>
</body>
</html>