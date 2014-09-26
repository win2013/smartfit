<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.Message object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.Message)db.getMessage(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.Message)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setSubject(value);
value = request.getParameter("PS1");
object.setContent(value);
value = request.getParameter("PS3");
object.setSendTime(Long.parseLong(value));
value = request.getParameter("PS4");
object.setActive(Boolean.getBoolean(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 2) {
if (type.equals("add")) {
object.setSender(db.getUser(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("21.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("1.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setSender(null);
response.sendRedirect("21.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Message</title>
<script>
function singleUserAdd2() {
value = mainForm.USA2.value;
httpLink = '21.jsp?action=updateUser&type=add&fieldID=2&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove2() {
httpLink = '21.jsp?action=updateUser&type=remove&fieldID=2';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="21.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>subject:<input type="text" value="<%=object.getSubject()%>" name="PS0" size="20"></p>
<p>content:<input type="text" value="<%=object.getContent()%>" name="PS1" size="20"></p>
<p>sendTime:<input type="text" value="<%=object.getSendTime()%>" name="PS3" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS4" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">User - sender</p>
<%{
int localID = -1;
if (object.getSender() != null)
localID = object.getSender().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA2" size="20"><a href="javascript:singleUserAdd2()">Set</a></p>
<p align="center"><a href="1.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove2()">Remove</a></p>
<%}%>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
