<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.Note object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.Note)db.getNote(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.Note)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setDate(Long.parseLong(value));
value = request.getParameter("PS1");
object.setSubject(value);
value = request.getParameter("PS2");
object.setNote(value);
value = request.getParameter("PS3");
object.setConfidential(Boolean.getBoolean(value));
value = request.getParameter("PS5");
object.setActive(Boolean.getBoolean(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 4) {
if (type.equals("add")) {
object.setCreator(db.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("11.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("1.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setCreator(null);
response.sendRedirect("11.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Note</title>
<script>
function singleUserAdd4() {
value = mainForm.USA4.value;
httpLink = '11.jsp?action=updateUser&type=add&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove4() {
httpLink = '11.jsp?action=updateUser&type=remove&fieldID=4';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="11.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>date:<input type="text" value="<%=object.getDate()%>" name="PS0" size="20"></p>
<p>subject:<input type="text" value="<%=object.getSubject()%>" name="PS1" size="20"></p>
<p>note:<input type="text" value="<%=object.getNote()%>" name="PS2" size="20"></p>
<p>confidential:<input type="text" value="<%=object.getConfidential()%>" name="PS3" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS5" size="20"></p>
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
