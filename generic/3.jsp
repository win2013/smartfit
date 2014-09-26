<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.users.Trainer object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.users.Trainer)db.getTrainer(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.users.Trainer)session.getAttribute("object");
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
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS45");
object.setCertificationType(value);
value = request.getParameter("PS46");
object.setCertificationExpirationDate(Long.parseLong(value));
value = request.getParameter("PS49");
object.setTrainingLevel(value);
value = request.getParameter("PS50");
object.setSpecialty(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 4) {
if (type.equals("add")) {
object.addClient(db.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeClient(object.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
if (fieldID == 6) {
if (type.equals("add")) {
object.addRoutine(db.getRoutine(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeRoutine(object.getRoutine(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
if (fieldID == 12) {
if (type.equals("add")) {
object.addExercise(db.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeExercise(object.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
if (fieldID == 23) {
if (type.equals("add")) {
object.addContract(db.getContract(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeContract(object.getContract(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
if (fieldID == 35) {
if (type.equals("add")) {
object.addInactiveClient(db.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeInactiveClient(object.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
if (fieldID == 47) {
if (type.equals("add")) {
object.addCertification(db.getCertification(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
if (type.equals("remove")) {
object.removeCertification(object.getCertification(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("3.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Trainer</title>
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
function multipleUserAdd4() {
value = mainForm.UMA4.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove4() {
value = mainForm.UM4.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd6() {
value = mainForm.UMA6.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=6&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove6() {
value = mainForm.UM6.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=6&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd12() {
value = mainForm.UMA12.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=12&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove12() {
value = mainForm.UM12.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=12&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd23() {
value = mainForm.UMA23.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=23&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove23() {
value = mainForm.UM23.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=23&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd35() {
value = mainForm.UMA35.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=35&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove35() {
value = mainForm.UM35.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=35&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd47() {
value = mainForm.UMA47.value;
httpLink = '3.jsp?action=updateUser&type=add&fieldID=47&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove47() {
value = mainForm.UM47.value;
httpLink = '3.jsp?action=updateUser&type=remove&fieldID=47&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="3.jsp?action=updatePrimitives">
<p>Parent Fields</p>
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
<p>Local Fields</p>
<p>Primitives</p>
<p>certificationType:<input type="text" value="<%=object.getCertificationType()%>" name="PS45" size="20"></p>
<p>certificationExpirationDate:<input type="text" value="<%=object.getCertificationExpirationDate()%>" name="PS46" size="20"></p>
<p>trainingLevel:<input type="text" value="<%=object.getTrainingLevel()%>" name="PS49" size="20"></p>
<p>specialty:<input type="text" value="<%=object.getSpecialty()%>" name="PS50" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Client - client</p>
<select name="UM4" size="5">
<%
i = object.getClients().iterator();
while (i.hasNext()) {
sf.users.Client currentObject = (sf.users.Client)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA4" size="20"><a href="javascript:multipleUserAdd4()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove4()">Remove</a></p>
</td>
<td>
<p align="center">Routine - routine</p>
<select name="UM6" size="5">
<%
i = object.getRoutines().iterator();
while (i.hasNext()) {
sf.activity.Routine currentObject = (sf.activity.Routine)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA6" size="20"><a href="javascript:multipleUserAdd6()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove6()">Remove</a></p>
</td>
<td>
<p align="center">Exercise - exercise</p>
<select name="UM12" size="5">
<%
i = object.getExercises().iterator();
while (i.hasNext()) {
sf.activity.Exercise currentObject = (sf.activity.Exercise)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA12" size="20"><a href="javascript:multipleUserAdd12()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove12()">Remove</a></p>
</td>
<td>
<p align="center">Contract - contract</p>
<select name="UM23" size="5">
<%
i = object.getContracts().iterator();
while (i.hasNext()) {
sf.data.Contract currentObject = (sf.data.Contract)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA23" size="20"><a href="javascript:multipleUserAdd23()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove23()">Remove</a></p>
</td>
<td>
<p align="center">Client - inactiveClient</p>
<select name="UM35" size="5">
<%
i = object.getInactiveClients().iterator();
while (i.hasNext()) {
sf.users.Client currentObject = (sf.users.Client)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA35" size="20"><a href="javascript:multipleUserAdd35()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove35()">Remove</a></p>
</td>
</tr><tr>
<td>
<p align="center">Certification - certification</p>
<select name="UM47" size="5">
<%
i = object.getCertifications().iterator();
while (i.hasNext()) {
sf.data.Certification currentObject = (sf.data.Certification)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA47" size="20"><a href="javascript:multipleUserAdd47()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove47()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
