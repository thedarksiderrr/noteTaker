package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.NoteEntity;
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();

	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// title, content fetch

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			NoteEntity noteEntity = new NoteEntity(title, content, new Date());

			// save to db using hibernate : save()
			Session factory = FactoryProvider.getFactory().openSession();
			Transaction tx = factory.beginTransaction();
			factory.save(noteEntity);
			tx.commit();

			factory.close();
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.println("<h1 style='text-align:center;'> Note is Added Successfully </h1>");
			writer.print("<h1 style='text-align:center;'> <a href='all_notes.jsp'> View All Notes </h1>");
			writer.print("<h1 style='text-align:center;'> <a href='index.jsp'> Back to Home </h1>");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
