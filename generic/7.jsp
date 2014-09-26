<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.Routine object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.Routine)db.getRoutine(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.Routine)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS2");
object.setDescription(value);
value = request.getParameter("PS3");
object.setName(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 0) {
if (type.equals("add")) {
object.addExercise(db.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("7.jsp");
return;
}
if (type.equals("remove")) {
object.removeExercise(object.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("7.jsp");
return;
}
}
if (fieldID == 4) {
if (type.equals("add")) {
object.setCreator(db.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("7.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("1.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setCreator(null);
response.sendRedirect("7.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Routine</title>
<script>
function multipleUserAdd0() {
value = mainForm.UMA0.value;
httpLink = '7.jsp?action=updateUser&type=add&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove0() {
value = mainForm.UM0.value;
httpLink = '7.jsp?action=updateUser&type=remove&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function singleUserAdd4() {
value = mainForm.USA4.value;
httpLink = '7.jsp?action=updateUser&type=add&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove4() {
httpLink = '7.jsp?action=updateUser&type=remove&fieldID=4';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="7.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>description:<input type="text" value="<%=object.getDescription()%>" name="PS2" size="20"></p>
<p>name:<input type="text" value="<%=object.getName()%>" name="PS3" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Exercise - exercise</p>
<select name="UM0" size="5">
<%
i = object.getExercises().iterator();
while (i.hasNext()) {
sf.activity.Exercise currentObject = (sf.activity.Exercise)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA0" size="20"><a href="javascript:multipleUserAdd0()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove0()">Remove</a></p>
</td>
<td>
<p align="center">User - creator</p>
<%{
int localID = -1;
if (object.getCreator() != null)
localID = object.getCreator().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA4" size="20"><a href="javascript:singleUserAdd4()">Set</a></p>
<p align="center"><a href="1.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove4()">Remove</a></p>
<%}%>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
