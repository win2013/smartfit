<%
sf.Database db = (sf.Database)session.getAttribute("db");
sf.data.Question object = null;
String ID = request.getParameter("ID");
if (ID != null) {
object = (sf.data.Question)db.getQuestion(Integer.parseInt(ID));
session.setAttribute("object", object);
}
object = (sf.data.Question)session.getAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("updatePrimitives")) {
String value = null;
value = request.getParameter("PS0");
object.setQuestion(value);
value = request.getParameter("PS3");
object.setActive(Boolean.getBoolean(value));
}
if (action.equals("updatePrimitiveMultiple")) {
String type = request.getParameter("type");
if (type.equals("add")) {
String value = request.getParameter("value");
object.addAnswers(value);
}
if (type.equals("remove")) {
String objectID = request.getParameter("objectID");
object.removeAnswers(Integer.parseInt(objectID));
}
}
if (action.equals("updateUser")) {
int fieldID = Integer.parseInt(request.getParameter("fieldID"));
String type = request.getParameter("type");
}
}
%>
<html>
<title>JSP Interface For Object:  Question</title>
<script>
function primitiveMultipleAdd1() {
value = mainForm.PMA1.value;
httpLink = '12.jsp?action=updatePrimitiveMultiple&type=add&fieldID=1&value=' + value;
window.location = httpLink;
}
function primitiveMultipleRemove1() {
value = mainForm.PM1.value;
httpLink = '12.jsp?action=updatePrimitiveMultiple&type=remove&fieldID=1&objectID=' + value;
window.location = httpLink;
}
</script>
<body>
<p>Object <%=object.getID()%>:  <%=object%></p>
<%java.util.Iterator i = null;%>
<form name="mainForm" METHOD="POST" action="12.jsp?action=updatePrimitives">
<p>Local Fields</p>
<p>Primitives</p>
<p>question:<input type="text" value="<%=object.getQuestion()%>" name="PS0" size="20"></p>
<p>answers</p>
<select name="PM1" size="5">
<%
String localanswers[] = object.getAnswerss();
if (localanswers != null) {
for (int count = 0;count < localanswers.length;count++) {
%><option value="<%=count%>"><%=(count + ":  "  + localanswers[count])%></option><%
}
}
%>
</select>
<p><input type="text" name="PMA1" size="20"><a href="javascript:primitiveMultipleAdd1()">Add</a></p>
<p>Select</p>
<p><a href="javascript:primitiveMultipleRemove1()">Remove</a></p>
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
