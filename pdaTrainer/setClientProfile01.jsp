<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String phone = request.getParameter("phone");
	String heightFt = request.getParameter("heightFt");
	String heightIn = request.getParameter("heightIn");
	String weight = request.getParameter("weight");
	String bloodA = request.getParameter("bloodA");
	String bloodB = request.getParameter("bloodB");
	String phase = request.getParameter("phase");
	String heart = request.getParameter("heart");
	
	client.setPhone(phone);
	int h[] = {Integer.parseInt(heightFt), Integer.parseInt(heightIn)};
	client.setHeight(h);
	client.setWeight(Integer.parseInt(weight));
	int bp[] = {Integer.parseInt(bloodA),Integer.parseInt(bloodB)};
	client.setBloodPressure(bp);
	client.setRestingHeartRate(Integer.parseInt(heart));
	client.setWorkoutPhase(phase);
	response.sendRedirect("viewClientProfile.jsp");
	
%>