<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.AnaerobicExercise object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.AnaerobicExercise)db.getAnaerobicExercise(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.AnaerobicExercise)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setName(value);
value = request.getParameter("PS1");
object.setDone(Boolean.getBoolean(value));
value = request.getParameter("PS2");
object.setExerciseType(Integer.parseInt(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
}
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS3");
object.setBodyPart(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 4) {
if (type.equals("add")) {
object.addSet(db.getAnaerobicSet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("5.jsp");
return;
}
if (type.equals("remove")) {
object.removeSet(object.getAnaerobicSet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("5.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  AnaerobicExercise</title>
<script>
function multipleUserAdd4() {
value = mainForm.UMA4.value;
httpLink = '5.jsp?action=updateUser&type=add&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove4() {
value = mainForm.UM4.value;
httpLink = '5.jsp?action=updateUser&type=remove&fieldID=4&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="5.jsp?action=updatePrimitives">
<p>Parent Fields</p>
<p>Primitives</p>
<p>name:<input type="text" value="<%=object.getName()%>" name="PS0" size="20"></p>
<p>done:<input type="text" value="<%=object.getDone()%>" name="PS1" size="20"></p>
<p>exerciseType:<input type="text" value="<%=object.getExerciseType()%>" name="PS2" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p>Local Fields</p>
<p>Primitives</p>
<p>bodyPart:<input type="text" value="<%=object.getBodyPart()%>" name="PS3" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">AnaerobicSet - set</p>
<select name="UM4" size="5">
<%
i = object.getSets().iterator();
while (i.hasNext()) {
sf.activity.AnaerobicSet currentObject = (sf.activity.AnaerobicSet)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA4" size="20"><a href="javascript:multipleUserAdd4()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove4()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
