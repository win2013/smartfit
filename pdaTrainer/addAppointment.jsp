<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("duration");
	String description = request.getParameter("description");

	long start = Long.parseLong(startTime);
	long duration = Long.parseLong(endTime);
	long end = start + duration;
	
	if (client != null) {
		Appointment appointment = db.createAppointment();
                appointment.setStartTime(start);
                appointment.setEndTime(end);
                appointment.setDescription(description);
                appointment.addUserAppointment(trainer);
                appointment.addUserAppointment(client);

		client.addAppointment(appointment);
                trainer.addAppointment(appointment);
                System.out.println("creating");
		session.removeAttribute("clientID");
		response.sendRedirect("appointmentsMain.jsp");
                return;
	}
	else
	{
            client = trainer.getClient(Integer.parseInt((String)session.getAttribute("clientID")));
            
            DaySchedule ds = (DaySchedule)session.getAttribute("ds");
            DaySchedule ds2 = new DaySchedule(ds.startTime, ds.endTime, ds.increment);
            ds2.populateSchedule(client);

            Object o = ds.getAppointment(start, end);
            if (o != null) {
                session.setAttribute("conflict", o);
                response.sendRedirect("schedule_conflict.jsp?startTime=" + startTime + "&endTime=" + end);
                return;
            }
            o = ds.getAppointment(start, end);
            if (o != null) {
                session.setAttribute("conflict", o);
                response.sendRedirect("schedule_conflict.jsp?startTime=" + startTime + "&endTime=" + end);
                return;
            }

            Appointment appointment = db.createAppointment();
            appointment.setStartTime(start);
            appointment.setEndTime(end);
            appointment.setDescription(description);
            appointment.addUserAppointment(trainer);
            appointment.addUserAppointment(client);
            client.addAppointment(appointment);
            trainer.addAppointment(appointment);

            ds.populateSchedule(trainer);

            session.removeAttribute("clientID");
            response.sendRedirect("appointmentsMain.jsp");
            return;
	}
%>