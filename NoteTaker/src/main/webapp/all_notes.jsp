<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.entities.NoteEntity"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>


</head>
<body>
	<div class="container-fluid p-0 m-0">
		<%@include file="navbar.jsp"%>
	</div>
	<div class="container">

		<h1>All Notes</h1>

		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from NoteEntity");
				List<NoteEntity> list = q.list();
				for (NoteEntity note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top m-3 mx-auto" style="max-width: 100px"
						src="img/notes.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">

							<%=note.getContent()%>
						</p>
						
						<p class="text-center pt-2">
							<b > <%=note.getAddedDate()%> </b>
						</p>
						<div class="container text-center pt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-danger">Delete</a> <a
								href="edit_notes.jsp?note_id=<%=note.getId()%>"
								class="btn btn-outline-info button-color">Update</a>
						</div>
					</div>
				</div>
				<%
				}

				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>