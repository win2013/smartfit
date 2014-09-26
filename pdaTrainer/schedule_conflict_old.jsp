<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<html>
<body>

<%
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    long start = Long.parseLong(startTime);
    long end = Long.parseLong(endTime);

    Object o = session.getAttribute("conflict");
    StringBuffer sb = new StringBuffer();
    String apptStart = "";
    String apptEnd = "";
    if (o instanceof Appointment) {
        Appointment appt = (Appointment)o;
        apptStart = SMUtils.parseDateAndTime(appt.getStartTime());
        apptEnd = SMUtils.parseDateAndTime(appt.getEndTime());
        Enumeration users = appt.getUserAppointments().elements();
        while (users.hasMoreElements()) {
            User user = (User)users.nextElement();
            sb.append(user.getFirstName() + " " + user.getLastName());
            if (users.hasMoreElements()) {
                sb.append(", ");
            }
        }
    }
%>
<p>There is a conflict for the appointment between:  <%=SMUtils.parseDateAndTime(start)%> + " and " + <%=SMUtils.parseDateAndTime(end)%></p>
<p>A meeting for <%=sb.toString()%> is scheduled between <%=apptStart + " and " + apptEnd%>
<a href="addAppt03.jsp"></a>
</body>
</html>