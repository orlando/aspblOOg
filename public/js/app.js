$(document).ready(function(){
	$('#newpost').colorbox({ width: "720px", height: "380px", iframe: true });
});

function showDeleteIcons() {
	$('.deletepost-icon').fadeIn();
	$('#deletepost').text("Cancel Delete");
	$('#deletepost').attr("onclick", "hideDeleteIcons()");
};

function hideDeleteIcons() {
	$('.deletepost-icon').fadeOut();
	$('#deletepost').text("Delete Post");
	$('#deletepost').attr("onclick", "showDeleteIcons()");
};

function deletePost(postid) {
	var respuesta = confirm("Are you sure?");
	if (respuesta) {
		$.post('lib/actions/posts/delete.asp', { id: postid }, function (data) {
			$("#post-" + postid).fadeOut(600, function () {
				$("#post-" + postid).remove();
			});
		});
	}
	return false;
}