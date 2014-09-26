<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.Club object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.Club)db.getClub(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.Club)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setName(value);
value = request.getParameter("PS9");
object.setAddress1(value);
value = request.getParameter("PS10");
object.setAddress2(value);
value = request.getParameter("PS11");
object.setZipCode(value);
value = request.getParameter("PS12");
object.setCity(value);
value = request.getParameter("PS13");
object.setState(value);
value = request.getParameter("PS14");
object.setCountry(value);
value = request.getParameter("PS15");
object.setClubPhone(value);
value = request.getParameter("PS16");
object.setClubFax(value);
value = request.getParameter("PS17");
object.setWebsite(value);
value = request.getParameter("PS18");
object.setMainContactName(value);
value = request.getParameter("PS19");
object.setMainContactPhone(value);
value = request.getParameter("PS20");
object.setMainContactEmail(value);
value = request.getParameter("PS21");
object.setHoursOfOperation(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
if (type.equals("add")) {
String value = request.getParameter("value");
object.addTrainingLevels(value);
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeTrainingLevels(Integer.parseInt(objectID));
}
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 1) {
if (type.equals("add")) {
object.addTrainer(db.getTrainer(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeTrainer(object.getTrainer(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
if (fieldID == 3) {
if (type.equals("add")) {
object.addClient(db.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeClient(object.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
if (fieldID == 5) {
if (type.equals("add")) {
object.addExercise(db.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeExercise(object.getExercise(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
if (fieldID == 7) {
if (type.equals("add")) {
object.addQuestion(db.getQuestion(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeQuestion(object.getQuestion(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
if (fieldID == 22) {
if (type.equals("add")) {
object.addAdmin(db.getAdmin(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeAdmin(object.getAdmin(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
if (fieldID == 24) {
if (type.equals("add")) {
object.addContractTerm(db.getContractTerm(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
if (type.equals("remove")) {
object.removeContractTerm(object.getContractTerm(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("0.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Club</title>
<script>
function multipleUserAdd1() {
value = mainForm.UMA1.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=1&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove1() {
value = mainForm.UM1.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=1&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd3() {
value = mainForm.UMA3.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=3&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove3() {
value = mainForm.UM3.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=3&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd5() {
value = mainForm.UMA5.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=5&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove5() {
value = mainForm.UM5.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=5&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd7() {
value = mainForm.UMA7.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=7&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove7() {
value = mainForm.UM7.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=7&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd22() {
value = mainForm.UMA22.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=22&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove22() {
value = mainForm.UM22.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=22&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd24() {
value = mainForm.UMA24.value;
httpLink = '0.jsp?action=updateUser&type=add&fieldID=24&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove24() {
value = mainForm.UM24.value;
httpLink = '0.jsp?action=updateUser&type=remove&fieldID=24&objectID=' + value;
window.location = httpLink;
}
function primitiveMultipleAdd26() {
value = mainForm.PMA26.value;
httpLink = '0.jsp?action=updatePrimitiveMultiple&type=add&fieldID=26&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove26() {
value = mainForm.PM26.value;
httpLink = '0.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=26&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="0.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>name:<input type="text" value="<%=object.getName()%>" name="PS0" size="20"></p>
<p>address1:<input type="text" value="<%=object.getAddress1()%>" name="PS9" size="20"></p>
<p>address2:<input type="text" value="<%=object.getAddress2()%>" name="PS10" size="20"></p>
<p>zipCode:<input type="text" value="<%=object.getZipCode()%>" name="PS11" size="20"></p>
<p>city:<input type="text" value="<%=object.getCity()%>" name="PS12" size="20"></p>
<p>state:<input type="text" value="<%=object.getState()%>" name="PS13" size="20"></p>
<p>country:<input type="text" value="<%=object.getCountry()%>" name="PS14" size="20"></p>
<p>clubPhone:<input type="text" value="<%=object.getClubPhone()%>" name="PS15" size="20"></p>
<p>clubFax:<input type="text" value="<%=object.getClubFax()%>" name="PS16" size="20"></p>
<p>website:<input type="text" value="<%=object.getWebsite()%>" name="PS17" size="20"></p>
<p>mainContactName:<input type="text" value="<%=object.getMainContactName()%>" name="PS18" size="20"></p>
<p>mainContactPhone:<input type="text" value="<%=object.getMainContactPhone()%>" name="PS19" size="20"></p>
<p>mainContactEmail:<input type="text" value="<%=object.getMainContactEmail()%>" name="PS20" size="20"></p>
<p>hoursOfOperation:<input type="text" value="<%=object.getHoursOfOperation()%>" name="PS21" size="20"></p>
<p>trainingLevels</p>
<select name="PM26" size="5">
<%
String localtrainingLevels[] = object.getTrainingLevelss();
if (localtrainingLevels != null) {
for (int count = 0;count < localtrainingLevels.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localtrainingLevels[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA26" size="20"><a href="javascript:primitiveMultipleAdd26()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove26()">Remove</a></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Trainer - trainer</p>
<select name="UM1" size="5">
<%
i = object.getTrainers().iterator();
while (i.hasNext()) {
sf.users.Trainer currentObject = (sf.users.Trainer)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA1" size="20"><a href="javascript:multipleUserAdd1()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove1()">Remove</a></p>
</td>
<td>
<p align="center">Client - client</p>
<select name="UM3" size="5">
<%
i = object.getClients().iterator();
while (i.hasNext()) {
sf.users.Client currentObject = (sf.users.Client)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA3" size="20"><a href="javascript:multipleUserAdd3()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove3()">Remove</a></p>
</td>
<td>
<p align="center">Exercise - exercise</p>
<select name="UM5" size="5">
<%
i = object.getExercises().iterator();
while (i.hasNext()) {
sf.activity.Exercise currentObject = (sf.activity.Exercise)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA5" size="20"><a href="javascript:multipleUserAdd5()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove5()">Remove</a></p>
</td>
<td>
<p align="center">Question - question</p>
<select name="UM7" size="5">
<%
i = object.getQuestions().iterator();
while (i.hasNext()) {
sf.data.Question currentObject = (sf.data.Question)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA7" size="20"><a href="javascript:multipleUserAdd7()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove7()">Remove</a></p>
</td>
<td>
<p align="center">Admin - admin</p>
<select name="UM22" size="5">
<%
i = object.getAdmins().iterator();
while (i.hasNext()) {
sf.users.Admin currentObject = (sf.users.Admin)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA22" size="20"><a href="javascript:multipleUserAdd22()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove22()">Remove</a></p>
</td>
</tr><tr>
<td>
<p align="center">ContractTerm - contractTerm</p>
<select name="UM24" size="5">
<%
i = object.getContractTerms().iterator();
while (i.hasNext()) {
sf.data.ContractTerm currentObject = (sf.data.ContractTerm)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA24" size="20"><a href="javascript:multipleUserAdd24()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove24()">Remove</a></p>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
