<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String type = request.getParameter("type");
	System.out.println(type);
	int T = Integer.parseInt(type);
	if (T == 0)
	{
	 	AnaerobicExercise exercise = (AnaerobicExercise)session.getAttribute("exercise");
	 	String reps = request.getParameter("reps");
	 	String weight = request.getParameter("weight");
	 	String rest = request.getParameter("rest");
                AnaerobicSet set = db.createAnaerobicSet();
                set.setReps(Integer.parseInt(reps));
                set.setWeight(Integer.parseInt(weight));
                set.setRestTime(Integer.parseInt(rest));
                set.setSetNum(exercise.getSets().size()+1);
                exercise.addSet(set);
	 	response.sendRedirect("trackPerformAnaerob.jsp");
	}
	else
	{
		AerobicExercise exercise = (AerobicExercise)session.getAttribute("exercise");
		String min = request.getParameter("min").trim();
		String intensity = request.getParameter("intensity").trim();
		String heartrate = request.getParameter("heartrate").trim();
                
                AerobicSet set = db.createAerobicSet();
                set.setTime(Integer.parseInt(min));
                set.setIntensity(intensity);
                set.setHeartRate(Integer.parseInt(heartrate));
                set.setSetNum(exercise.getSets().size()+1);
		exercise.addSet(set);
		response.sendRedirect("trackPerformAerobic.jsp");
	}
%>