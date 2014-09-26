<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.activity.WorkoutSession object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.activity.WorkoutSession)db.getWorkoutSession(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.activity.WorkoutSession)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS2");
object.setStartTime(Long.parseLong(value));
value = request.getParameter("PS5");
object.setAnswer(value);
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
if (fieldID == 0) {
if (type.equals("add")) {
object.addRoutine(db.getRoutine(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
if (type.equals("remove")) {
object.removeRoutine(object.getRoutine(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
}
if (fieldID == 3) {
if (type.equals("add")) {
object.setTrainer(db.getTrainer(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("3.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setTrainer(null);
response.sendRedirect("8.jsp");
return;
}
}
if (fieldID == 4) {
if (type.equals("add")) {
object.setQuestion(db.getQuestion(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("12.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setQuestion(null);
response.sendRedirect("8.jsp");
return;
}
}
if (fieldID == 6) {
if (type.equals("add")) {
object.setSignature(db.getSignature(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("13.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setSignature(null);
response.sendRedirect("8.jsp");
return;
}
}
if (fieldID == 7) {
if (type.equals("add")) {
object.setContract(db.getContract(Integer.parseInt(request.getParameter("objectID"))));
response.sendRedirect("8.jsp");
return;
}
if (type.equals("select")) {
response.sendRedirect("15.jsp?ID=" + request.getParameter("objectID"));
return;
}
if (type.equals("remove")) {
object.setContract(null);
response.sendRedirect("8.jsp");
return;
}
}
}
}
%>
<html>
<title>JSP Interface For Object:  WorkoutSession</title>
<script>
function multipleUserAdd0() {
value = mainForm.UMA0.value;
httpLink = '8.jsp?action=updateUser&type=add&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function multipleUserRemove0() {
value = mainForm.UM0.value;
httpLink = '8.jsp?action=updateUser&type=remove&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function singleUserAdd3() {
value = mainForm.USA3.value;
httpLink = '8.jsp?action=updateUser&type=add&fieldID=3&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove3() {
httpLink = '8.jsp?action=updateUser&type=remove&fieldID=3';
window.location = httpLink;
}
function singleUserAdd4() {
value = mainForm.USA4.value;
httpLink = '8.jsp?action=updateUser&type=add&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove4() {
httpLink = '8.jsp?action=updateUser&type=remove&fieldID=4';
window.location = httpLink;
}
function singleUserAdd6() {
value = mainForm.USA6.value;
httpLink = '8.jsp?action=updateUser&type=add&fieldID=6&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove6() {
httpLink = '8.jsp?action=updateUser&type=remove&fieldID=6';
window.location = httpLink;
}
function singleUserAdd7() {
value = mainForm.USA7.value;
httpLink = '8.jsp?action=updateUser&type=add&fieldID=7&objectID=' + value;
window.location = httpLink;
}
function singleUserRemove7() {
httpLink = '8.jsp?action=updateUser&type=remove&fieldID=7';
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="8.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>startTime:<input type="text" value="<%=object.getStartTime()%>" name="PS2" size="20"></p>
<p>answer:<input type="text" value="<%=object.getAnswer()%>" name="PS5" size="20"></p>
<table align="center" border="3">
<tr>
<td>
<p align="center">Routine - routine</p>
<select name="UM0" size="5">
<%
i = object.getRoutines().iterator();
while (i.hasNext()) {
sf.activity.Routine currentObject = (sf.activity.Routine)i.next();
%><option value="<%=currentObject.getID()%>"><%=currentObject.getID()%></option><%
}
%>
</select>
<p><input type="text" name="UMA0" size="20"><a href="javascript:multipleUserAdd0()">Add</a></p>
<p>Select</p>
<p><a href="javascript:multipleUserRemove0()">Remove</a></p>
</td>
<td>
<p align="center">Trainer - trainer</p>
<%{
int localID = -1;
if (object.getTrainer() != null)
localID = object.getTrainer().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA3" size="20"><a href="javascript:singleUserAdd3()">Set</a></p>
<p align="center"><a href="3.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove3()">Remove</a></p>
<%}%>
</td>
<td>
<p align="center">Question - question</p>
<%{
int localID = -1;
if (object.getQuestion() != null)
localID = object.getQuestion().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA4" size="20"><a href="javascript:singleUserAdd4()">Set</a></p>
<p align="center"><a href="12.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove4()">Remove</a></p>
<%}%>
</td>
<td>
<p align="center">Signature - signature</p>
<%{
int localID = -1;
if (object.getSignature() != null)
localID = object.getSignature().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA6" size="20"><a href="javascript:singleUserAdd6()">Set</a></p>
<p align="center"><a href="13.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove6()">Remove</a></p>
<%}%>
</td>
<td>
<p align="center">Contract - contract</p>
<%{
int localID = -1;
if (object.getContract() != null)
localID = object.getContract().getID();
%>
<p align="center"><%=localID%></p>
<p align="center"><input type="text" name="USA7" size="20"><a href="javascript:singleUserAdd7()">Set</a></p>
<p align="center"><a href="15.jsp?ID=<%=localID%>">Select</a></p>
<p align="center"><a href="javascript:singleUserRemove7()">Remove</a></p>
<%}%>
</td>
</tr><tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
