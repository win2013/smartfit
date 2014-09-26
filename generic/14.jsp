<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.scheduling.Appointment object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.scheduling.Appointment)db.getAppointment(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.scheduling.Appointment)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setStartTime(Long.parseLong(value));
value = request.getParameter("PS1");
object.setEndTime(Long.parseLong(value));
value = request.getParameter("PS2");
object.setDescription(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 3) {
if (type.equals("add")) {
object.addUserAppointment(db.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("14.jsp");
return;
}
if (type.equals("remove")) {
object.removeUserAppointment(object.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("14.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Appointment</title>
<script>
function multipleUserAdd3() {
value = mainForm.UMA3.value;
httpLink = '14.jsp?action=updateUser&type=add&fieldID=3&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove3() {
value = mainForm.UM3.value;
httpLink = '14.jsp?action=updateUser&type=remove&fieldID=3&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="14.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>startTime:<input type="text" value="<%=object.getStartTime()%>" name="PS0" size="20"></p>
<p>endTime:<input type="text" value="<%=object.getEndTime()%>" name="PS1" size="20"></p>
<p>description:<input type="text" value="<%=object.getDescription()%>" name="PS2" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">User - userAppointment</p>
<select name="UM3" size="5">
<%
i = object.getUserAppointments().iterator();
while (i.hasNext()) {
sf.users.User currentObject = (sf.users.User)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA3" size="20"><a href="javascript:multipleUserAdd3()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove3()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
