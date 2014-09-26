<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	
	String view = request.getParameter("view");
	String action = request.getParameter("action");
        
	String clientID = request.getParameter("clientID");
	
	if (action == null)
		action = "";
	if (view == null)
            view = "active";
        if (clientID != null)
	    
        {

	Client cclient = club.getClient(Integer.parseInt(clientID));
	
            response.sendRedirect("memberSelect.jsp?view=active");
            return;
        }
%>