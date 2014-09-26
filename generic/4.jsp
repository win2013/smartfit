<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.Exercise object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.Exercise)db.getExercise(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.Exercise)session.getAttribute("object");
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
}
%>
<html>
<title>JSP Interface For Object:  Exercise</title>
<script>
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="4.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>name:<input type="text" value="<%=object.getName()%>" name="PS0" size="20"></p>
<p>done:<input type="text" value="<%=object.getDone()%>" name="PS1" size="20"></p>
<p>exerciseType:<input type="text" value="<%=object.getExerciseType()%>" name="PS2" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
