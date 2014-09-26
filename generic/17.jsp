<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.ContractEntry object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.ContractEntry)db.getContractEntry(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.ContractEntry)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setTrainerPaid(Boolean.getBoolean(value));
value = request.getParameter("PS1");
object.setSessionNumber(Integer.parseInt(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 2) {
if (type.equals("add")) {
object.setWorkoutSession(db.getWorkoutSession(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("17.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("8.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setWorkoutSession(null);
response.sendRedirect("17.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  ContractEntry</title>
<script>
function singleUserAdd2() {
value = mainForm.USA2.value;
httpLink = '17.jsp?action=updateUser&type=add&fieldID=2&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove2() {
httpLink = '17.jsp?action=updateUser&type=remove&fieldID=2';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="17.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>trainerPaid:<input type="text" value="<%=object.getTrainerPaid()%>" name="PS0" size="20"></p>
<p>sessionNumber:<input type="text" value="<%=object.getSessionNumber()%>" name="PS1" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">WorkoutSession - workoutSession</p>
<%{
int localID = -1;
if (object.getWorkoutSession() != null)
localID = object.getWorkoutSession().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA2" size="20"><a href="javascript:singleUserAdd2()">Set</a></p>
<p align="center"><a href="8.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove2()">Remove</a></p>
<%}%>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
