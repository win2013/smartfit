<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.AnaerobicSet object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.AnaerobicSet)db.getAnaerobicSet(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.AnaerobicSet)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setReps(Integer.parseInt(value));
value = request.getParameter("PS1");
object.setWeight(Integer.parseInt(value));
value = request.getParameter("PS2");
object.setRestTime(Integer.parseInt(value));
value = request.getParameter("PS3");
object.setSetNum(Integer.parseInt(value));
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
<title>JSP Interface For Object:  AnaerobicSet</title>
<script>
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="9.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>reps:<input type="text" value="<%=object.getReps()%>" name="PS0" size="20"></p>
<p>weight:<input type="text" value="<%=object.getWeight()%>" name="PS1" size="20"></p>
<p>restTime:<input type="text" value="<%=object.getRestTime()%>" name="PS2" size="20"></p>
<p>setNum:<input type="text" value="<%=object.getSetNum()%>" name="PS3" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
