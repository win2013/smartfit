<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	Routine routine = (Routine)session.getAttribute("routine");
	String excerciseID = request.getParameter("id");
	routine.removeExercise(db.getExercise(Integer.parseInt(excerciseID)));
	response.sendRedirect("createRoutineAgain.jsp");
%>