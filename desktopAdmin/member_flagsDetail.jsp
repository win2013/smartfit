<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String flagID = request.getParameter("flagID");
    ExerciseFlag exerciseFlag = client.getExerciseFlag(Integer.parseInt(flagID));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td height="61">
<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Exercise 
                Flag for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td width="50%"><span class="largeHeading">Exercise:</span> <span class="normalText"><%=exerciseFlag.getExerciseName()%></span></td>
            <td width="50%"><span class="largeHeading">Date Created:</span> <span class="normalText"><%=SMUtils.parseDateAndTime(exerciseFlag.getDate())%></span></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2" class="normalText"><span class="largeHeading">Created 
              By:</span> <span class="normalText"><%=exerciseFlag.getCreator().getFirstName() + " " + exerciseFlag.getCreator().getLastName()%></span></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td colspan="2" class="normalText"><span class="largeHeading">Subject:</span> 
              <span class="normalText"><%=exerciseFlag.getSubject()%></span></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2" class="normalText"><%=exerciseFlag.getContent()%></td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>

</form>
</body>
</html>
