<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String exerciseID = request.getParameter("excerciseID");
	
	Routine routine = (Routine)session.getAttribute("routine");
	Exercise exercise = trainer.getExercise(Integer.parseInt(exerciseID));
	routine.addExercise(exercise);
	
	String bodyPart = (String)session.getAttribute("bodyPart");
	if (bodyPart != null)
	{
		session.removeAttribute("bodyPart");
		session.setAttribute("lastAdded", exercise.getName());
		response.sendRedirect("muscleGroup.jsp?bodyPart=" + bodyPart);		
	}
	else
	{
		session.setAttribute("lastAdded", exercise.getName());
		response.sendRedirect("aerobicEx.jsp");		
	}
%>