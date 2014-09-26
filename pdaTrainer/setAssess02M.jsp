<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	FitnessAssessment a = (FitnessAssessment)session.getAttribute("fitnessAssessment");
	a.pecs[0] = request.getParameter("pecA");
	a.pecs[1] = request.getParameter("pecB");
	a.abs[0] = request.getParameter("abA");
	a.abs[1] = request.getParameter("abB");
	a.maleThigh[0] = request.getParameter("thighA");
	a.maleThigh[1] = request.getParameter("thighB");
	a.maleTotal[0] = request.getParameter("fatA");
	a.maleTotal[1] = request.getParameter("fatB");
	a.malCat = request.getParameter("cat");
	response.sendRedirect("createAssess03.jsp");	
%>