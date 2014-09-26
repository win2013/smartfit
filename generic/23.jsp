<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.ContractTerm object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.ContractTerm)db.getContractTerm(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.ContractTerm)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setTerm(value);
value = request.getParameter("PS1");
object.setDate(Long.parseLong(value));
value = request.getParameter("PS2");
object.setType(value);
value = request.getParameter("PS3");
object.setActive(Boolean.getBoolean(value));
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
<title>JSP Interface For Object:  ContractTerm</title>
<script>
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="23.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>term:<input type="text" value="<%=object.getTerm()%>" name="PS0" size="20"></p>
<p>date:<input type="text" value="<%=object.getDate()%>" name="PS1" size="20"></p>
<p>type:<input type="text" value="<%=object.getType()%>" name="PS2" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS3" size="20"></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
