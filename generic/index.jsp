<%
sf.Database db = (sf.Database)session.getAttribute("db");
if (db == null) {
java.rmi.registry.Registry registry = java.rmi.registry.LocateRegistry.getRegistry(1098);
db = (sf.Database)registry.lookup("sf");
session.setAttribute("db", db);
}
session.removeAttribute("object");
%>
<%
String action = request.getParameter("action");
if (action != null) {
if (action.equals("kill")) {db.killDatabase();}
if (action.equals("create")) {
int objectTypeID = Integer.parseInt(request.getParameter("objectTypeID"));
if (objectTypeID == 0) {
db.createClub();
}
if (objectTypeID == 1) {
db.createUser();
}
if (objectTypeID == 2) {
db.createClient();
}
if (objectTypeID == 3) {
db.createTrainer();
}
if (objectTypeID == 4) {
db.createExercise();
}
if (objectTypeID == 5) {
db.createAnaerobicExercise();
}
if (objectTypeID == 6) {
db.createAerobicExercise();
}
if (objectTypeID == 7) {
db.createRoutine();
}
if (objectTypeID == 8) {
db.createWorkoutSession();
}
if (objectTypeID == 9) {
db.createAnaerobicSet();
}
if (objectTypeID == 10) {
db.createAerobicSet();
}
if (objectTypeID == 11) {
db.createNote();
}
if (objectTypeID == 12) {
db.createQuestion();
}
if (objectTypeID == 13) {
db.createSignature();
}
if (objectTypeID == 14) {
db.createAppointment();
}
if (objectTypeID == 15) {
db.createContract();
}
if (objectTypeID == 16) {
db.createPayment();
}
if (objectTypeID == 17) {
db.createContractEntry();
}
if (objectTypeID == 18) {
db.createAdmin();
}
if (objectTypeID == 19) {
db.createFlexibilityExercise();
}
if (objectTypeID == 20) {
db.createFlexibilitySet();
}
if (objectTypeID == 21) {
db.createMessage();
}
if (objectTypeID == 22) {
db.createExerciseFlag();
}
if (objectTypeID == 23) {
db.createContractTerm();
}
if (objectTypeID == 24) {
db.createCertification();
}
response.sendRedirect("index.jsp");
return;
}
if (action.equals("remove")) {
int objectTypeID = Integer.parseInt(request.getParameter("objectTypeID"));
int objectID = Integer.parseInt(request.getParameter("objectID"));
if (objectTypeID == 0) {
db.removeClub(db.getClub(objectID));
}
if (objectTypeID == 1) {
db.removeUser(db.getUser(objectID));
}
if (objectTypeID == 2) {
db.removeClient(db.getClient(objectID));
}
if (objectTypeID == 3) {
db.removeTrainer(db.getTrainer(objectID));
}
if (objectTypeID == 4) {
db.removeExercise(db.getExercise(objectID));
}
if (objectTypeID == 5) {
db.removeAnaerobicExercise(db.getAnaerobicExercise(objectID));
}
if (objectTypeID == 6) {
db.removeAerobicExercise(db.getAerobicExercise(objectID));
}
if (objectTypeID == 7) {
db.removeRoutine(db.getRoutine(objectID));
}
if (objectTypeID == 8) {
db.removeWorkoutSession(db.getWorkoutSession(objectID));
}
if (objectTypeID == 9) {
db.removeAnaerobicSet(db.getAnaerobicSet(objectID));
}
if (objectTypeID == 10) {
db.removeAerobicSet(db.getAerobicSet(objectID));
}
if (objectTypeID == 11) {
db.removeNote(db.getNote(objectID));
}
if (objectTypeID == 12) {
db.removeQuestion(db.getQuestion(objectID));
}
if (objectTypeID == 13) {
db.removeSignature(db.getSignature(objectID));
}
if (objectTypeID == 14) {
db.removeAppointment(db.getAppointment(objectID));
}
if (objectTypeID == 15) {
db.removeContract(db.getContract(objectID));
}
if (objectTypeID == 16) {
db.removePayment(db.getPayment(objectID));
}
if (objectTypeID == 17) {
db.removeContractEntry(db.getContractEntry(objectID));
}
if (objectTypeID == 18) {
db.removeAdmin(db.getAdmin(objectID));
}
if (objectTypeID == 19) {
db.removeFlexibilityExercise(db.getFlexibilityExercise(objectID));
}
if (objectTypeID == 20) {
db.removeFlexibilitySet(db.getFlexibilitySet(objectID));
}
if (objectTypeID == 21) {
db.removeMessage(db.getMessage(objectID));
}
if (objectTypeID == 22) {
db.removeExerciseFlag(db.getExerciseFlag(objectID));
}
if (objectTypeID == 23) {
db.removeContractTerm(db.getContractTerm(objectID));
}
if (objectTypeID == 24) {
db.removeCertification(db.getCertification(objectID));
}
response.sendRedirect("index.jsp");
return;
}
}
%>
<html>
<title>Entrance For DB Management</title>
<script>
function forward0()
{
ID = mainForm.F0.value;
httpLink = '0.jsp?ID=' + ID;
window.location = httpLink;
}
function remove0()
{
ID = mainForm.F0.value;
httpLink = 'index.jsp?action=remove&objectTypeID=0&objectID=' + ID;
window.location = httpLink;
}
function forward1()
{
ID = mainForm.F1.value;
httpLink = '1.jsp?ID=' + ID;
window.location = httpLink;
}
function remove1()
{
ID = mainForm.F1.value;
httpLink = 'index.jsp?action=remove&objectTypeID=1&objectID=' + ID;
window.location = httpLink;
}
function forward2()
{
ID = mainForm.F2.value;
httpLink = '2.jsp?ID=' + ID;
window.location = httpLink;
}
function remove2()
{
ID = mainForm.F2.value;
httpLink = 'index.jsp?action=remove&objectTypeID=2&objectID=' + ID;
window.location = httpLink;
}
function forward3()
{
ID = mainForm.F3.value;
httpLink = '3.jsp?ID=' + ID;
window.location = httpLink;
}
function remove3()
{
ID = mainForm.F3.value;
httpLink = 'index.jsp?action=remove&objectTypeID=3&objectID=' + ID;
window.location = httpLink;
}
function forward4()
{
ID = mainForm.F4.value;
httpLink = '4.jsp?ID=' + ID;
window.location = httpLink;
}
function remove4()
{
ID = mainForm.F4.value;
httpLink = 'index.jsp?action=remove&objectTypeID=4&objectID=' + ID;
window.location = httpLink;
}
function forward5()
{
ID = mainForm.F5.value;
httpLink = '5.jsp?ID=' + ID;
window.location = httpLink;
}
function remove5()
{
ID = mainForm.F5.value;
httpLink = 'index.jsp?action=remove&objectTypeID=5&objectID=' + ID;
window.location = httpLink;
}
function forward6()
{
ID = mainForm.F6.value;
httpLink = '6.jsp?ID=' + ID;
window.location = httpLink;
}
function remove6()
{
ID = mainForm.F6.value;
httpLink = 'index.jsp?action=remove&objectTypeID=6&objectID=' + ID;
window.location = httpLink;
}
function forward7()
{
ID = mainForm.F7.value;
httpLink = '7.jsp?ID=' + ID;
window.location = httpLink;
}
function remove7()
{
ID = mainForm.F7.value;
httpLink = 'index.jsp?action=remove&objectTypeID=7&objectID=' + ID;
window.location = httpLink;
}
function forward8()
{
ID = mainForm.F8.value;
httpLink = '8.jsp?ID=' + ID;
window.location = httpLink;
}
function remove8()
{
ID = mainForm.F8.value;
httpLink = 'index.jsp?action=remove&objectTypeID=8&objectID=' + ID;
window.location = httpLink;
}
function forward9()
{
ID = mainForm.F9.value;
httpLink = '9.jsp?ID=' + ID;
window.location = httpLink;
}
function remove9()
{
ID = mainForm.F9.value;
httpLink = 'index.jsp?action=remove&objectTypeID=9&objectID=' + ID;
window.location = httpLink;
}
function forward10()
{
ID = mainForm.F10.value;
httpLink = '10.jsp?ID=' + ID;
window.location = httpLink;
}
function remove10()
{
ID = mainForm.F10.value;
httpLink = 'index.jsp?action=remove&objectTypeID=10&objectID=' + ID;
window.location = httpLink;
}
function forward11()
{
ID = mainForm.F11.value;
httpLink = '11.jsp?ID=' + ID;
window.location = httpLink;
}
function remove11()
{
ID = mainForm.F11.value;
httpLink = 'index.jsp?action=remove&objectTypeID=11&objectID=' + ID;
window.location = httpLink;
}
function forward12()
{
ID = mainForm.F12.value;
httpLink = '12.jsp?ID=' + ID;
window.location = httpLink;
}
function remove12()
{
ID = mainForm.F12.value;
httpLink = 'index.jsp?action=remove&objectTypeID=12&objectID=' + ID;
window.location = httpLink;
}
function forward13()
{
ID = mainForm.F13.value;
httpLink = '13.jsp?ID=' + ID;
window.location = httpLink;
}
function remove13()
{
ID = mainForm.F13.value;
httpLink = 'index.jsp?action=remove&objectTypeID=13&objectID=' + ID;
window.location = httpLink;
}
function forward14()
{
ID = mainForm.F14.value;
httpLink = '14.jsp?ID=' + ID;
window.location = httpLink;
}
function remove14()
{
ID = mainForm.F14.value;
httpLink = 'index.jsp?action=remove&objectTypeID=14&objectID=' + ID;
window.location = httpLink;
}
function forward15()
{
ID = mainForm.F15.value;
httpLink = '15.jsp?ID=' + ID;
window.location = httpLink;
}
function remove15()
{
ID = mainForm.F15.value;
httpLink = 'index.jsp?action=remove&objectTypeID=15&objectID=' + ID;
window.location = httpLink;
}
function forward16()
{
ID = mainForm.F16.value;
httpLink = '16.jsp?ID=' + ID;
window.location = httpLink;
}
function remove16()
{
ID = mainForm.F16.value;
httpLink = 'index.jsp?action=remove&objectTypeID=16&objectID=' + ID;
window.location = httpLink;
}
function forward17()
{
ID = mainForm.F17.value;
httpLink = '17.jsp?ID=' + ID;
window.location = httpLink;
}
function remove17()
{
ID = mainForm.F17.value;
httpLink = 'index.jsp?action=remove&objectTypeID=17&objectID=' + ID;
window.location = httpLink;
}
function forward18()
{
ID = mainForm.F18.value;
httpLink = '18.jsp?ID=' + ID;
window.location = httpLink;
}
function remove18()
{
ID = mainForm.F18.value;
httpLink = 'index.jsp?action=remove&objectTypeID=18&objectID=' + ID;
window.location = httpLink;
}
function forward19()
{
ID = mainForm.F19.value;
httpLink = '19.jsp?ID=' + ID;
window.location = httpLink;
}
function remove19()
{
ID = mainForm.F19.value;
httpLink = 'index.jsp?action=remove&objectTypeID=19&objectID=' + ID;
window.location = httpLink;
}
function forward20()
{
ID = mainForm.F20.value;
httpLink = '20.jsp?ID=' + ID;
window.location = httpLink;
}
function remove20()
{
ID = mainForm.F20.value;
httpLink = 'index.jsp?action=remove&objectTypeID=20&objectID=' + ID;
window.location = httpLink;
}
function forward21()
{
ID = mainForm.F21.value;
httpLink = '21.jsp?ID=' + ID;
window.location = httpLink;
}
function remove21()
{
ID = mainForm.F21.value;
httpLink = 'index.jsp?action=remove&objectTypeID=21&objectID=' + ID;
window.location = httpLink;
}
function forward22()
{
ID = mainForm.F22.value;
httpLink = '22.jsp?ID=' + ID;
window.location = httpLink;
}
function remove22()
{
ID = mainForm.F22.value;
httpLink = 'index.jsp?action=remove&objectTypeID=22&objectID=' + ID;
window.location = httpLink;
}
function forward23()
{
ID = mainForm.F23.value;
httpLink = '23.jsp?ID=' + ID;
window.location = httpLink;
}
function remove23()
{
ID = mainForm.F23.value;
httpLink = 'index.jsp?action=remove&objectTypeID=23&objectID=' + ID;
window.location = httpLink;
}
function forward24()
{
ID = mainForm.F24.value;
httpLink = '24.jsp?ID=' + ID;
window.location = httpLink;
}
function remove24()
{
ID = mainForm.F24.value;
httpLink = 'index.jsp?action=remove&objectTypeID=24&objectID=' + ID;
window.location = httpLink;
}
</script>
<body>
<form name="mainForm" method="POST" action="">
<table align="center" border="3">
<tr>
<%
java.util.Enumeration enum = null;
%><td><p align="center">Club Listing</p><%
%><select name="F0" size="5"><%
enum = db.getClubs().elements();
while (enum.hasMoreElements())
{
sf.Club object = (sf.Club)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=0">Create</a></p><%
%><p align="center"><a href="javascript:forward0()">Edit</a></p><%
%><p align="center"><a href="javascript:remove0()">Remove</a></p><%
%></td><%
%><td><p align="center">User Listing</p><%
%><select name="F1" size="5"><%
enum = db.getUsers().elements();
while (enum.hasMoreElements())
{
sf.users.User object = (sf.users.User)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=1">Create</a></p><%
%><p align="center"><a href="javascript:forward1()">Edit</a></p><%
%><p align="center"><a href="javascript:remove1()">Remove</a></p><%
%></td><%
%><td><p align="center">Client Listing</p><%
%><select name="F2" size="5"><%
enum = db.getClients().elements();
while (enum.hasMoreElements())
{
sf.users.Client object = (sf.users.Client)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=2">Create</a></p><%
%><p align="center"><a href="javascript:forward2()">Edit</a></p><%
%><p align="center"><a href="javascript:remove2()">Remove</a></p><%
%></td><%
%><td><p align="center">Trainer Listing</p><%
%><select name="F3" size="5"><%
enum = db.getTrainers().elements();
while (enum.hasMoreElements())
{
sf.users.Trainer object = (sf.users.Trainer)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=3">Create</a></p><%
%><p align="center"><a href="javascript:forward3()">Edit</a></p><%
%><p align="center"><a href="javascript:remove3()">Remove</a></p><%
%></td><%
%><td><p align="center">Exercise Listing</p><%
%><select name="F4" size="5"><%
enum = db.getExercises().elements();
while (enum.hasMoreElements())
{
sf.activity.Exercise object = (sf.activity.Exercise)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=4">Create</a></p><%
%><p align="center"><a href="javascript:forward4()">Edit</a></p><%
%><p align="center"><a href="javascript:remove4()">Remove</a></p><%
%></td><%
%></tr><tr><%
%><td><p align="center">AnaerobicExercise Listing</p><%
%><select name="F5" size="5"><%
enum = db.getAnaerobicExercises().elements();
while (enum.hasMoreElements())
{
sf.activity.AnaerobicExercise object = (sf.activity.AnaerobicExercise)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=5">Create</a></p><%
%><p align="center"><a href="javascript:forward5()">Edit</a></p><%
%><p align="center"><a href="javascript:remove5()">Remove</a></p><%
%></td><%
%><td><p align="center">AerobicExercise Listing</p><%
%><select name="F6" size="5"><%
enum = db.getAerobicExercises().elements();
while (enum.hasMoreElements())
{
sf.activity.AerobicExercise object = (sf.activity.AerobicExercise)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=6">Create</a></p><%
%><p align="center"><a href="javascript:forward6()">Edit</a></p><%
%><p align="center"><a href="javascript:remove6()">Remove</a></p><%
%></td><%
%><td><p align="center">Routine Listing</p><%
%><select name="F7" size="5"><%
enum = db.getRoutines().elements();
while (enum.hasMoreElements())
{
sf.activity.Routine object = (sf.activity.Routine)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=7">Create</a></p><%
%><p align="center"><a href="javascript:forward7()">Edit</a></p><%
%><p align="center"><a href="javascript:remove7()">Remove</a></p><%
%></td><%
%><td><p align="center">WorkoutSession Listing</p><%
%><select name="F8" size="5"><%
enum = db.getWorkoutSessions().elements();
while (enum.hasMoreElements())
{
sf.activity.WorkoutSession object = (sf.activity.WorkoutSession)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=8">Create</a></p><%
%><p align="center"><a href="javascript:forward8()">Edit</a></p><%
%><p align="center"><a href="javascript:remove8()">Remove</a></p><%
%></td><%
%><td><p align="center">AnaerobicSet Listing</p><%
%><select name="F9" size="5"><%
enum = db.getAnaerobicSets().elements();
while (enum.hasMoreElements())
{
sf.activity.AnaerobicSet object = (sf.activity.AnaerobicSet)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=9">Create</a></p><%
%><p align="center"><a href="javascript:forward9()">Edit</a></p><%
%><p align="center"><a href="javascript:remove9()">Remove</a></p><%
%></td><%
%></tr><tr><%
%><td><p align="center">AerobicSet Listing</p><%
%><select name="F10" size="5"><%
enum = db.getAerobicSets().elements();
while (enum.hasMoreElements())
{
sf.activity.AerobicSet object = (sf.activity.AerobicSet)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=10">Create</a></p><%
%><p align="center"><a href="javascript:forward10()">Edit</a></p><%
%><p align="center"><a href="javascript:remove10()">Remove</a></p><%
%></td><%
%><td><p align="center">Note Listing</p><%
%><select name="F11" size="5"><%
enum = db.getNotes().elements();
while (enum.hasMoreElements())
{
sf.data.Note object = (sf.data.Note)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=11">Create</a></p><%
%><p align="center"><a href="javascript:forward11()">Edit</a></p><%
%><p align="center"><a href="javascript:remove11()">Remove</a></p><%
%></td><%
%><td><p align="center">Question Listing</p><%
%><select name="F12" size="5"><%
enum = db.getQuestions().elements();
while (enum.hasMoreElements())
{
sf.data.Question object = (sf.data.Question)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=12">Create</a></p><%
%><p align="center"><a href="javascript:forward12()">Edit</a></p><%
%><p align="center"><a href="javascript:remove12()">Remove</a></p><%
%></td><%
%><td><p align="center">Signature Listing</p><%
%><select name="F13" size="5"><%
enum = db.getSignatures().elements();
while (enum.hasMoreElements())
{
sf.data.Signature object = (sf.data.Signature)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=13">Create</a></p><%
%><p align="center"><a href="javascript:forward13()">Edit</a></p><%
%><p align="center"><a href="javascript:remove13()">Remove</a></p><%
%></td><%
%><td><p align="center">Appointment Listing</p><%
%><select name="F14" size="5"><%
enum = db.getAppointments().elements();
while (enum.hasMoreElements())
{
sf.scheduling.Appointment object = (sf.scheduling.Appointment)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=14">Create</a></p><%
%><p align="center"><a href="javascript:forward14()">Edit</a></p><%
%><p align="center"><a href="javascript:remove14()">Remove</a></p><%
%></td><%
%></tr><tr><%
%><td><p align="center">Contract Listing</p><%
%><select name="F15" size="5"><%
enum = db.getContracts().elements();
while (enum.hasMoreElements())
{
sf.data.Contract object = (sf.data.Contract)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=15">Create</a></p><%
%><p align="center"><a href="javascript:forward15()">Edit</a></p><%
%><p align="center"><a href="javascript:remove15()">Remove</a></p><%
%></td><%
%><td><p align="center">Payment Listing</p><%
%><select name="F16" size="5"><%
enum = db.getPayments().elements();
while (enum.hasMoreElements())
{
sf.data.Payment object = (sf.data.Payment)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=16">Create</a></p><%
%><p align="center"><a href="javascript:forward16()">Edit</a></p><%
%><p align="center"><a href="javascript:remove16()">Remove</a></p><%
%></td><%
%><td><p align="center">ContractEntry Listing</p><%
%><select name="F17" size="5"><%
enum = db.getContractEntrys().elements();
while (enum.hasMoreElements())
{
sf.data.ContractEntry object = (sf.data.ContractEntry)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=17">Create</a></p><%
%><p align="center"><a href="javascript:forward17()">Edit</a></p><%
%><p align="center"><a href="javascript:remove17()">Remove</a></p><%
%></td><%
%><td><p align="center">Admin Listing</p><%
%><select name="F18" size="5"><%
enum = db.getAdmins().elements();
while (enum.hasMoreElements())
{
sf.users.Admin object = (sf.users.Admin)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=18">Create</a></p><%
%><p align="center"><a href="javascript:forward18()">Edit</a></p><%
%><p align="center"><a href="javascript:remove18()">Remove</a></p><%
%></td><%
%><td><p align="center">FlexibilityExercise Listing</p><%
%><select name="F19" size="5"><%
enum = db.getFlexibilityExercises().elements();
while (enum.hasMoreElements())
{
sf.activity.FlexibilityExercise object = (sf.activity.FlexibilityExercise)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=19">Create</a></p><%
%><p align="center"><a href="javascript:forward19()">Edit</a></p><%
%><p align="center"><a href="javascript:remove19()">Remove</a></p><%
%></td><%
%></tr><tr><%
%><td><p align="center">FlexibilitySet Listing</p><%
%><select name="F20" size="5"><%
enum = db.getFlexibilitySets().elements();
while (enum.hasMoreElements())
{
sf.activity.FlexibilitySet object = (sf.activity.FlexibilitySet)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=20">Create</a></p><%
%><p align="center"><a href="javascript:forward20()">Edit</a></p><%
%><p align="center"><a href="javascript:remove20()">Remove</a></p><%
%></td><%
%><td><p align="center">Message Listing</p><%
%><select name="F21" size="5"><%
enum = db.getMessages().elements();
while (enum.hasMoreElements())
{
sf.data.Message object = (sf.data.Message)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=21">Create</a></p><%
%><p align="center"><a href="javascript:forward21()">Edit</a></p><%
%><p align="center"><a href="javascript:remove21()">Remove</a></p><%
%></td><%
%><td><p align="center">ExerciseFlag Listing</p><%
%><select name="F22" size="5"><%
enum = db.getExerciseFlags().elements();
while (enum.hasMoreElements())
{
sf.activity.ExerciseFlag object = (sf.activity.ExerciseFlag)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=22">Create</a></p><%
%><p align="center"><a href="javascript:forward22()">Edit</a></p><%
%><p align="center"><a href="javascript:remove22()">Remove</a></p><%
%></td><%
%><td><p align="center">ContractTerm Listing</p><%
%><select name="F23" size="5"><%
enum = db.getContractTerms().elements();
while (enum.hasMoreElements())
{
sf.data.ContractTerm object = (sf.data.ContractTerm)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=23">Create</a></p><%
%><p align="center"><a href="javascript:forward23()">Edit</a></p><%
%><p align="center"><a href="javascript:remove23()">Remove</a></p><%
%></td><%
%><td><p align="center">Certification Listing</p><%
%><select name="F24" size="5"><%
enum = db.getCertifications().elements();
while (enum.hasMoreElements())
{
sf.data.Certification object = (sf.data.Certification)enum.nextElement();
out.println("<option value=\"" + object.getID() + "\">" + object.getID() + "</option>");
}
%></select><%
%><p align="center"><a href="index.jsp?action=create&objectTypeID=24">Create</a></p><%
%><p align="center"><a href="javascript:forward24()">Edit</a></p><%
%><p align="center"><a href="javascript:remove24()">Remove</a></p><%
%></td><%
%></tr><tr><%
%>
</tr>
</table>
</form>
<p align="center"><a href="index.jsp?action=kill">Kill Database</a></p>
</body>
</html>
