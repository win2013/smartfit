<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	FitnessAssessment a = (FitnessAssessment)session.getAttribute("fitnessAssessment");
	a.legPress[0] = request.getParameter("abs");
	a.legPress[1] = request.getParameter("rel");
	a.legPress[2] = request.getParameter("catA");
	a.chestPress[0] = request.getParameter("absA");
	a.chestPress[1] = request.getParameter("relB");
	a.chestPress[2] = request.getParameter("catB");
	client.setFitnessAssessment(a);
	response.sendRedirect("viewClientProfile.jsp");
%>