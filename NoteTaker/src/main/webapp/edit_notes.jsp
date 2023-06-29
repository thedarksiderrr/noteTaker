<%@page import="com.entities.NoteEntity"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Notes</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getFactory().openSession();

		NoteEntity note = s.get(NoteEntity.class, noteId);
		%>
		<div class="container">

			<h1>Edit your note</h1>
			<!-- this is a form -->
			<form action="UpdateServlet" method="post">

				<input value="<%= note.getId() %>" name="note_id" type="hidden" />
				<div class="form-group">
					<label for="noteTitle">Note Title</label> <input name="title"
						required type="text" class="form-control" id="noteTitle"
						placeholder="Enter Title Here" value="<%=note.getTitle()%>" />
				</div>
				<div class="form-group">
					<label for="noteContent">Note Content</label>
					<textarea name="content" required id="noteContent"
						placeholder="Enter your Content Here" class="form-control"
						style="height: 300px;"><%=note.getContent()%></textarea>

				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-outline-info button-color">Update
						Note</button>

				</div>
			</form>
		</div>
	</div>
</body>
</html>