<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String subject = request.getParameter("subject");
	String nnote = request.getParameter("note");
	String confidential = request.getParameter("confidential");
	boolean c = false;
	if (confidential != null)
		c = true;
	
	Note note = db.createNote();
        note.setActive(true);
	note.setCreator(trainer);
	note.setSubject(subject);
	note.setNote(nnote);
	note.setConfidential(c);
	note.setDate(System.currentTimeMillis());
	client.addNote(note);
	response.sendRedirect("viewNotes.jsp");
%>