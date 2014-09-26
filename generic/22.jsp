<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.ExerciseFlag object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.ExerciseFlag)db.getExerciseFlag(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.ExerciseFlag)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setExerciseName(value);
value = request.getParameter("PS2");
object.setDate(Long.parseLong(value));
value = request.getParameter("PS3");
object.setSubject(value);
value = request.getParameter("PS4");
object.setContent(value);
value = request.getParameter("PS5");
object.setActive(Boolean.getBoolean(value));
value = request.getParameter("PS6");
object.setEndDate(Long.parseLong(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 1) {
if (type.equals("add")) {
object.setCreator(db.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("22.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("1.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setCreator(null);
response.sendRedirect("22.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  ExerciseFlag</title>
<script>
function singleUserAdd1() {
value = mainForm.USA1.value;
httpLink = '22.jsp?action=updateUser&type=add&fieldID=1&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove1() {
httpLink = '22.jsp?action=updateUser&type=remove&fieldID=1';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="22.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>exerciseName:<input type="text" value="<%=object.getExerciseName()%>" name="PS0" size="20"></p>
<p>date:<input type="text" value="<%=object.getDate()%>" name="PS2" size="20"></p>
<p>subject:<input type="text" value="<%=object.getSubject()%>" name="PS3" size="20"></p>
<p>content:<input type="text" value="<%=object.getContent()%>" name="PS4" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS5" size="20"></p>
<p>endDate:<input type="text" value="<%=object.getEndDate()%>" name="PS6" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">User - creator</p>
<%{
int localID = -1;
if (object.getCreator() != null)
localID = object.getCreator().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA1" size="20"><a href="javascript:singleUserAdd1()">Set</a></p>
<p align="center"><a href="1.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove1()">Remove</a></p>
<%}%>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
