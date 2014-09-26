<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String answer = request.getParameter("answer");
	Question question = (Question)session.getAttribute("question");
	WorkoutSession workoutSession = (WorkoutSession)session.getAttribute("workoutSession");
	
	workoutSession.setQuestion(question);
        workoutSession.setAnswer(answer);

	response.sendRedirect("sessionSignOut.jsp");
	session.removeAttribute("question");
%>