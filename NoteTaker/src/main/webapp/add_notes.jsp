<!doctype html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">

		<h1>Please Fill your notes details</h1>
		<!-- this is a form -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="noteTitle">Note Title</label> <input name="title" required type="text"
					class="form-control" id="noteTitle" placeholder="Enter Title Here"/>
			</div>
			<div class="form-group">
				<label for="noteContent">Note Content</label>
				<textarea name="content" required id="noteContent" placeholder="Enter your Content Here"
					class="form-control" style="height: 300px;"></textarea>
			
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-outline-info button-color">Add Note</button>

			</div>
		</form>
	</div>

</body>
</html>