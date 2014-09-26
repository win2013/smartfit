<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.AerobicSet object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.AerobicSet)db.getAerobicSet(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.AerobicSet)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setTime(Integer.parseInt(value));
value = request.getParameter("PS1");
object.setIntensity(value);
value = request.getParameter("PS2");
object.setSetNum(Integer.parseInt(value));
value = request.getParameter("PS3");
object.setHeartRate(Integer.parseInt(value));
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
<title>JSP Interface For Object:  AerobicSet</title>
<script>
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="10.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>time:<input type="text" value="<%=object.getTime()%>" name="PS0" size="20"></p>
<p>intensity:<input type="text" value="<%=object.getIntensity()%>" name="PS1" size="20"></p>
<p>setNum:<input type="text" value="<%=object.getSetNum()%>" name="PS2" size="20"></p>
<p>heartRate:<input type="text" value="<%=object.getHeartRate()%>" name="PS3" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
