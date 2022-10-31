<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<script src="/lang/summernote-ko-KR.js"></script>
<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
		$(document).ready(function() {
			$('#summernote').summernote({
				lang : 'ko-KR' // default: 'en-US'
			});
		});
	</script>
<body>

	<form method="post">
		<div id="summernote">Hello Summernote</div>
	</form>


	
</body>
</html>