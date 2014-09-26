<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	
	String id = request.getParameter("routineID");
	
	
	if (id == null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	
	
	if (client != null)	
		client.removeRoutine(client.getRoutine(Integer.parseInt(id)));			
	else
		trainer.removeRoutine(trainer.getRoutine(Integer.parseInt(id)));		

		
	response.sendRedirect("routinesMain.jsp");
%>