<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	boolean yes = true;
	String f = request.getParameter("g");
	if (f != null)
		if (f.equals("m"))
			yes = false;
	client.setFitnessAssessment(null);
	client.setFemale(yes);
%>