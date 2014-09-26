<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%            

	String description = request.getParameter("description");
	String name = request.getParameter("name");
	
	Routine routine = db.createRoutine();
	routine.setCreator(trainer);
	routine.setDescription(description);
	routine.setName(name);

	
	session.setAttribute("routine", routine);
	
	if (client == null)
		trainer.addRoutine(routine);	
	else
		client.addRoutine(routine);	
	
	response.sendRedirect("createRoutine02.jsp");

%>