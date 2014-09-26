<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String routineID = request.getParameter("routineID");
	Routine routine = trainer.getRoutine(Integer.parseInt(routineID));
	Routine newRoutine = db.createRoutine();
	
	newRoutine.setName(routine.getName());
	newRoutine.setCreator(routine.getCreator());
	newRoutine.setDescription(routine.getDescription());
	
	Enumeration e = routine.getExercises().elements();
	while (e.hasMoreElements())
	{
		Exercise exercise = (Exercise)e.nextElement();
		newRoutine.addExercise(exercise);
	}
	
	client.addRoutine(newRoutine);
	
	response.sendRedirect("memberRoutines.jsp");
%>