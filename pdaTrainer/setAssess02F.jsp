<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	FitnessAssessment a = (FitnessAssessment)session.getAttribute("fitnessAssessment");
	a.tricep[0] = request.getParameter("triA");
	a.tricep[1] = request.getParameter("triB");
	a.sup[0] = request.getParameter("supA");
	a.sup[1] = request.getParameter("supB");
	a.femaleThigh[0] = request.getParameter("thighA");
	a.femaleThigh[1] = request.getParameter("thighB");
	a.total[0] = request.getParameter("fatA");
	a.total[1] = request.getParameter("fatB");
	a.femCat = request.getParameter("cat");
	response.sendRedirect("createAssess03.jsp");	
%>