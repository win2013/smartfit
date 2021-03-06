<%
	sf.Database db = (sf.Database)session.getAttribute("db");
	sf.Club club = (sf.Club)session.getAttribute("club");
	sf.users.Trainer trainer = (sf.users.Trainer)session.getAttribute("user");
	if ( (trainer == null) || (db == null) || (club == null) )
	{
		response.sendRedirect("index.jsp");
		return;
	}
	sf.users.Client client = (sf.users.Client)session.getAttribute("selectedClient");
        
        //Check for mesages
        {
            if ( (trainer.getNewMessages().size() > 0) ) {
                String url = request.getRequestURI();
                java.util.StringTokenizer str = new java.util.StringTokenizer(url, "/");
                String pageName = "";
                while (str.hasMoreTokens())
                    pageName = str.nextToken();
                if ( (!pageName.equals("messaging_recieve.jsp")) && (!pageName.equals("messaging_send.jsp")) ) {
                    StringBuffer destination = request.getRequestURL();                 
                    java.util.Enumeration enum = request.getParameterNames();
                    if (enum.hasMoreElements())
                        destination.append("?");
                    while (enum.hasMoreElements()) {
                        String name = (String)enum.nextElement();
                        destination.append(name + "=" + request.getParameter(name));
                        if (enum.hasMoreElements())
                            destination.append("&");
                    }
                    session.setAttribute("messageReturn", destination.toString());
                    response.sendRedirect("messaging_recieve.jsp");
                    return;
                }
            }
        }
%>