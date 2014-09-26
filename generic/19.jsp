<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.FlexibilityExercise object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.FlexibilityExercise)db.getFlexibilityExercise(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.FlexibilityExercise)session.getAttribute("object");
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
value = request.getParameter("PS8");
object.setBodyPart(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 9) {
if (type.equals("add")) {
object.addSet(db.getFlexibilitySet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("19.jsp");
return;
}
if (type.equals("remove")) {
object.removeSet(object.getFlexibilitySet(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("19.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  FlexibilityExercise</title>
<script>
function multipleUserAdd9() {
value = mainForm.UMA9.value;
httpLink = '19.jsp?action=updateUser&type=add&fieldID=9&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove9() {
value = mainForm.UM9.value;
httpLink = '19.jsp?action=updateUser&type=remove&fieldID=9&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="19.jsp?action=updatePrimitives">
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
<p>bodyPart:<input type="text" value="<%=object.getBodyPart()%>" name="PS8" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">FlexibilitySet - set</p>
<select name="UM9" size="5">
<%
i = object.getSets().iterator();
while (i.hasNext()) {
sf.activity.FlexibilitySet currentObject = (sf.activity.FlexibilitySet)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA9" size="20"><a href="javascript:multipleUserAdd9()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove9()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
