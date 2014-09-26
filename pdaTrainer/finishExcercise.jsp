<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	Exercise exercise = (Exercise)session.getAttribute("exercise");
	exercise.setDone(true);
	response.sendRedirect("trackPerform02.jsp");
%>