<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.FlexibilitySet object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.FlexibilitySet)db.getFlexibilitySet(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.FlexibilitySet)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
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
<title>JSP Interface For Object:  FlexibilitySet</title>
<script>
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="20.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>setNum:<input type="text" value="<%=object.getSetNum()%>" name="PS0" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
