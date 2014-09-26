<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.AerobicExercise object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.AerobicExercise)db.getAerobicExercise(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.AerobicExercise)session.getAttribute("object");
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
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 6) {
if (type.equals("add")) {
object.addSet(db.getAerobicSet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("6.jsp");
return;
}
if (type.equals("remove")) {
object.removeSet(object.getAerobicSet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("6.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  AerobicExercise</title>
<script>
function multipleUserAdd6() {
value = mainForm.UMA6.value;
httpLink = '6.jsp?action=updateUser&type=add&fieldID=6&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove6() {
value = mainForm.UM6.value;
httpLink = '6.jsp?action=updateUser&type=remove&fieldID=6&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="6.jsp?action=updatePrimitives">
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
<table align="center" border="3">
<tr>
<td>
<p align="center">AerobicSet - set</p>
<select name="UM6" size="5">
<%
i = object.getSets().iterator();
while (i.hasNext()) {
sf.activity.AerobicSet currentObject = (sf.activity.AerobicSet)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA6" size="20"><a href="javascript:multipleUserAdd6()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove6()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
