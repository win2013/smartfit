<%@include file="imports.jsp"%>
<%
	try {
		String desiredStats = request.getParameter("desiredStats");
                if (desiredStats == null)
                    desiredStats = "";

		String startDay = request.getParameter("startDay");
		String startMonth = request.getParameter("startMonth");
		String startYear = request.getParameter("startYear");
		String endDay = request.getParameter("endDay");
		String endMonth = request.getParameter("endMonth");
		String endYear = request.getParameter("endYear");
		
		GregorianCalendar startDate = new GregorianCalendar(Integer.parseInt(startYear), Integer.parseInt(startMonth), Integer.parseInt(startDay));
		GregorianCalendar endDate = new GregorianCalendar(Integer.parseInt(endYear), Integer.parseInt(endMonth), Integer.parseInt(endDay));
		
		session.setAttribute("startDate", startDate);
		session.setAttribute("endDate", endDate);
		
		if (desiredStats.equals("trainerLogs")) {
			response.sendRedirect("clubStats_allTrainers.jsp");
		}                
                if (desiredStats.equals("membersPerfDate")) {
                    response.sendRedirect("perfTrack_dateFirst.jsp");                    
                }   
                if (desiredStats.equals("membersPerfExercise")) {
                    response.sendRedirect("perfTrack_exerFirst.jsp");                    
                }

              return;
	} catch (Exception e) {response.sendRedirect("stats_setInterval.jsp");return;}
%>