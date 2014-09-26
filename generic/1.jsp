<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.users.User object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.users.User)db.getUser(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.users.User)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setFirstName(value);
value = request.getParameter("PS1");
object.setLastName(value);
value = request.getParameter("PS2");
object.setUserName(value);
value = request.getParameter("PS3");
object.setPassword(value);
value = request.getParameter("PS20");
object.setBirthday(Long.parseLong(value));
value = request.getParameter("PS25");
object.setActive(Boolean.getBoolean(value));
value = request.getParameter("PS26");
object.setEmail(value);
value = request.getParameter("PS27");
object.setCity(value);
value = request.getParameter("PS28");
object.setState(value);
value = request.getParameter("PS29");
object.setAddress1(value);
value = request.getParameter("PS30");
object.setAddress2(value);
value = request.getParameter("PS31");
object.setZipCode(value);
value = request.getParameter("PS32");
object.setPhoneHome(value);
value = request.getParameter("PS33");
object.setPhoneMobile(value);
value = request.getParameter("PS34");
object.setMale(Boolean.getBoolean(value));
value = request.getParameter("PS43");
object.setSSN(value);
value = request.getParameter("PS44");
object.setIDNum(Long.parseLong(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 18) {
if (type.equals("add")) {
object.addAppointment(db.getAppointment(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
if (type.equals("remove")) {
object.removeAppointment(object.getAppointment(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
}
if (fieldID == 37) {
if (type.equals("add")) {
object.addMessage(db.getMessage(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
if (type.equals("remove")) {
object.removeMessage(object.getMessage(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
}
if (fieldID == 39) {
if (type.equals("add")) {
object.addNewMessage(db.getMessage(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
if (type.equals("remove")) {
object.removeNewMessage(object.getMessage(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("1.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  User</title>
<script>
function multipleUserAdd18() {
value = mainForm.UMA18.value;
httpLink = '1.jsp?action=updateUser&type=add&fieldID=18&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove18() {
value = mainForm.UM18.value;
httpLink = '1.jsp?action=updateUser&type=remove&fieldID=18&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd37() {
value = mainForm.UMA37.value;
httpLink = '1.jsp?action=updateUser&type=add&fieldID=37&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove37() {
value = mainForm.UM37.value;
httpLink = '1.jsp?action=updateUser&type=remove&fieldID=37&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd39() {
value = mainForm.UMA39.value;
httpLink = '1.jsp?action=updateUser&type=add&fieldID=39&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove39() {
value = mainForm.UM39.value;
httpLink = '1.jsp?action=updateUser&type=remove&fieldID=39&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="1.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>firstName:<input type="text" value="<%=object.getFirstName()%>" name="PS0" size="20"></p>
<p>lastName:<input type="text" value="<%=object.getLastName()%>" name="PS1" size="20"></p>
<p>userName:<input type="text" value="<%=object.getUserName()%>" name="PS2" size="20"></p>
<p>password:<input type="text" value="<%=object.getPassword()%>" name="PS3" size="20"></p>
<p>birthday:<input type="text" value="<%=object.getBirthday()%>" name="PS20" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS25" size="20"></p>
<p>email:<input type="text" value="<%=object.getEmail()%>" name="PS26" size="20"></p>
<p>city:<input type="text" value="<%=object.getCity()%>" name="PS27" size="20"></p>
<p>state:<input type="text" value="<%=object.getState()%>" name="PS28" size="20"></p>
<p>address1:<input type="text" value="<%=object.getAddress1()%>" name="PS29" size="20"></p>
<p>address2:<input type="text" value="<%=object.getAddress2()%>" name="PS30" size="20"></p>
<p>zipCode:<input type="text" value="<%=object.getZipCode()%>" name="PS31" size="20"></p>
<p>phoneHome:<input type="text" value="<%=object.getPhoneHome()%>" name="PS32" size="20"></p>
<p>phoneMobile:<input type="text" value="<%=object.getPhoneMobile()%>" name="PS33" size="20"></p>
<p>male:<input type="text" value="<%=object.getMale()%>" name="PS34" size="20"></p>
<p>SSN:<input type="text" value="<%=object.getSSN()%>" name="PS43" size="20"></p>
<p>IDNum:<input type="text" value="<%=object.getIDNum()%>" name="PS44" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Appointment - appointment</p>
<select name="UM18" size="5">
<%
i = object.getAppointments().iterator();
while (i.hasNext()) {
sf.scheduling.Appointment currentObject = (sf.scheduling.Appointment)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA18" size="20"><a href="javascript:multipleUserAdd18()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove18()">Remove</a></p>
</td>
<td>
<p align="center">Message - message</p>
<select name="UM37" size="5">
<%
i = object.getMessages().iterator();
while (i.hasNext()) {
sf.data.Message currentObject = (sf.data.Message)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA37" size="20"><a href="javascript:multipleUserAdd37()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove37()">Remove</a></p>
</td>
<td>
<p align="center">Message - newMessage</p>
<select name="UM39" size="5">
<%
i = object.getNewMessages().iterator();
while (i.hasNext()) {
sf.data.Message currentObject = (sf.data.Message)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA39" size="20"><a href="javascript:multipleUserAdd39()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove39()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
