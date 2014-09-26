<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.Contract object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.Contract)db.getContract(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.Contract)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS2");
object.setTimePerSession(Integer.parseInt(value));
value = request.getParameter("PS3");
object.setStartDate(Long.parseLong(value));
value = request.getParameter("PS4");
object.setActive(Boolean.getBoolean(value));
value = request.getParameter("PS9");
object.setPrice(Float.parseFloat(value));
value = request.getParameter("PS10");
object.setNumberOfSessions(Integer.parseInt(value));
value = request.getParameter("PS14");
object.setApproved(Boolean.getBoolean(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 0) {
if (type.equals("add")) {
object.setClient(db.getClient(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("2.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setClient(null);
response.sendRedirect("15.jsp");
return;
}
}
if (fieldID == 1) {
if (type.equals("add")) {
object.setTrainer(db.getTrainer(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("3.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setTrainer(null);
response.sendRedirect("15.jsp");
return;
}
}
if (fieldID == 5) {
if (type.equals("add")) {
object.addPayment(db.getPayment(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("remove")) {
object.removePayment(object.getPayment(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
}
if (fieldID == 7) {
if (type.equals("add")) {
object.addContractEntry(db.getContractEntry(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("remove")) {
object.removeContractEntry(object.getContractEntry(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
}
if (fieldID == 11) {
if (type.equals("add")) {
object.addTerm(db.getContractTerm(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("remove")) {
object.removeTerm(object.getContractTerm(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
}
if (fieldID == 13) {
if (type.equals("add")) {
object.setSignature(db.getSignature(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("15.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("13.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setSignature(null);
response.sendRedirect("15.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  Contract</title>
<script>
function singleUserAdd0() {
value = mainForm.USA0.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove0() {
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=0';
window.location = httpLink;
}
function singleUserAdd1() {
value = mainForm.USA1.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=1&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove1() {
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=1';
window.location = httpLink;
}
function multipleUserAdd5() {
value = mainForm.UMA5.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=5&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove5() {
value = mainForm.UM5.value;
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=5&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd7() {
value = mainForm.UMA7.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=7&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove7() {
value = mainForm.UM7.value;
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=7&objectID=' + value;
window.location = httpLink;
}
function multipleUserAdd11() {
value = mainForm.UMA11.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=11&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove11() {
value = mainForm.UM11.value;
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=11&objectID=' + value;
window.location = httpLink;
}
function singleUserAdd13() {
value = mainForm.USA13.value;
httpLink = '15.jsp?action=updateUser&type=add&fieldID=13&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove13() {
httpLink = '15.jsp?action=updateUser&type=remove&fieldID=13';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="15.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>timePerSession:<input type="text" value="<%=object.getTimePerSession()%>" name="PS2" size="20"></p>
<p>startDate:<input type="text" value="<%=object.getStartDate()%>" name="PS3" size="20"></p>
<p>active:<input type="text" value="<%=object.getActive()%>" name="PS4" size="20"></p>
<p>price:<input type="text" value="<%=object.getPrice()%>" name="PS9" size="20"></p>
<p>numberOfSessions:<input type="text" value="<%=object.getNumberOfSessions()%>" name="PS10" size="20"></p>
<p>approved:<input type="text" value="<%=object.getApproved()%>" name="PS14" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Client - client</p>
<%{
int localID = -1;
if (object.getClient() != null)
localID = object.getClient().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA0" size="20"><a href="javascript:singleUserAdd0()">Set</a></p>
<p align="center"><a href="2.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove0()">Remove</a></p>
<%}%>
</td>
<td>
<p align="center">Trainer - trainer</p>
<%{
int localID = -1;
if (object.getTrainer() != null)
localID = object.getTrainer().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA1" size="20"><a href="javascript:singleUserAdd1()">Set</a></p>
<p align="center"><a href="3.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove1()">Remove</a></p>
<%}%>
</td>
<td>
<p align="center">Payment - payment</p>
<select name="UM5" size="5">
<%
i = object.getPayments().iterator();
while (i.hasNext()) {
sf.data.Payment currentObject = (sf.data.Payment)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA5" size="20"><a href="javascript:multipleUserAdd5()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove5()">Remove</a></p>
</td>
<td>
<p align="center">ContractEntry - contractEntry</p>
<select name="UM7" size="5">
<%
i = object.getContractEntrys().iterator();
while (i.hasNext()) {
sf.data.ContractEntry currentObject = (sf.data.ContractEntry)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA7" size="20"><a href="javascript:multipleUserAdd7()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove7()">Remove</a></p>
</td>
<td>
<p align="center">ContractTerm - term</p>
<select name="UM11" size="5">
<%
i = object.getTerms().iterator();
while (i.hasNext()) {
sf.data.ContractTerm currentObject = (sf.data.ContractTerm)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA11" size="20"><a href="javascript:multipleUserAdd11()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove11()">Remove</a></p>
</td>
</tr><tr>
<td>
<p align="center">Signature - signature</p>
<%{
int localID = -1;
if (object.getSignature() != null)
localID = object.getSignature().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA13" size="20"><a href="javascript:singleUserAdd13()">Set</a></p>
<p align="center"><a href="13.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove13()">Remove</a></p>
<%}%>
</td>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
