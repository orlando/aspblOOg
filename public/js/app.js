$(document).ready(function(){
	$('#newpost').colorbox({ width: "720px", height: "380px", iframe: true });	
});

function editfield() {
	$('.edit').editable('lib/actions/posts/update.asp', {
		name: 'title',
		submitdata: function () {
			return { "id": $(this).attr("id").split("-")[1],
				"content": $(this).next().text()
			}
		}
	});
	$('.edit_area').editable('lib/actions/posts/update.asp', {
		type: 'textarea',
		cancel: 'Cancel',
		submit: 'OK',
		indicator: '<img src="img/indicator.gif">',
		name: 'content',
		submitdata : function (){
			return { "id": $(this).attr("id").split("-")[1],
							 "title": $(this).prev().text()}
		}
	});
};

function enableEdit() {
	$('.deletepost-icon').fadeIn();
	$('#deletepost').text("Cancel Edit");
	$('#deletepost').attr("onclick", "disableEdit()");
	$('.post-title').addClass("edit");
	$('.post-content').addClass("edit_area");
	editfield();	
};

function disableEdit() {
	$('.deletepost-icon').fadeOut();
	$('#deletepost').text("Edit Posts");
	$('#deletepost').attr("onclick", "enableEdit()");
	$('.post-title').removeClass("edit");
	$('.post-content').removeClass("edit_area");
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