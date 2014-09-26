<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.Signature object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.Signature)db.getSignature(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.Signature)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
if (type.equals("add")) {
String value = request.getParameter("value");
object.addXCoor(Integer.parseInt(value));
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeXCoor(Integer.parseInt(objectID));
}
if (type.equals("add")) {
String value = request.getParameter("value");
object.addYCoor(Integer.parseInt(value));
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeYCoor(Integer.parseInt(objectID));
}
if (type.equals("add")) {
String value = request.getParameter("value");
object.addStart(Integer.parseInt(value));
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeStart(Integer.parseInt(objectID));
}
if (type.equals("add")) {
String value = request.getParameter("value");
object.addEnd(Integer.parseInt(value));
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeEnd(Integer.parseInt(objectID));
}
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
}
}
%>
<html>
<title>JSP Interface For Object:  Signature</title>
<script>
function primitiveMultipleAdd0() {
value = mainForm.PMA0.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=add&fieldID=0&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove0() {
value = mainForm.PM0.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=0&objectID=' + value;
window.location = httpLink;
}
function primitiveMultipleAdd2() {
value = mainForm.PMA2.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=add&fieldID=2&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove2() {
value = mainForm.PM2.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=2&objectID=' + value;
window.location = httpLink;
}
function primitiveMultipleAdd4() {
value = mainForm.PMA4.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=add&fieldID=4&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove4() {
value = mainForm.PM4.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=4&objectID=' + value;
window.location = httpLink;
}
function primitiveMultipleAdd6() {
value = mainForm.PMA6.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=add&fieldID=6&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove6() {
value = mainForm.PM6.value;
httpLink = '13.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=6&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="13.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>xCoor</p>
<select name="PM0" size="5">
<%
int localxCoor[] = object.getXCoors();
if (localxCoor != null) {
for (int count = 0;count < localxCoor.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localxCoor[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA0" size="20"><a href="javascript:primitiveMultipleAdd0()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove0()">Remove</a></p>
<p>yCoor</p>
<select name="PM2" size="5">
<%
int localyCoor[] = object.getYCoors();
if (localyCoor != null) {
for (int count = 0;count < localyCoor.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localyCoor[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA2" size="20"><a href="javascript:primitiveMultipleAdd2()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove2()">Remove</a></p>
<p>start</p>
<select name="PM4" size="5">
<%
int localstart[] = object.getStarts();
if (localstart != null) {
for (int count = 0;count < localstart.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localstart[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA4" size="20"><a href="javascript:primitiveMultipleAdd4()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove4()">Remove</a></p>
<p>end</p>
<select name="PM6" size="5">
<%
int localend[] = object.getEnds();
if (localend != null) {
for (int count = 0;count < localend.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localend[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA6" size="20"><a href="javascript:primitiveMultipleAdd6()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove6()">Remove</a></p>
<table align="center" border="3">
<tr>
</tr>
</table>
<p align="center"><input type="submit" value="Submit">
</form>
<p align="center"><i><b><a href="index.jsp">Back To Home</a></b></i></p>
</body>
</html>
