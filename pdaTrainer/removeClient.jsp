<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>

<%
	try
	{
		String id = request.getParameter("id");
		
		if (id != null)
		{
			int ID = Integer.parseInt(id);			
			Client cclient = trainer.getClient(ID);
						
			trainer.removeClient(cclient);
			cclient.removeTrainer(trainer);
		}
	}
	finally {
		response.sendRedirect("membersMain.jsp");
		return;
	}
	
%>