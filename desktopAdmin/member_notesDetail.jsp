<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String noteID = request.getParameter("noteID");
    int ID = Integer.parseInt(noteID);
    Note note = client.getNote(ID);
    GregorianCalendar gc = new GregorianCalendar();
    gc.setTimeInMillis(note.getDate());        
    int year = gc.get(Calendar.YEAR);
    int month = gc.get(Calendar.MONTH);
    int day = gc.get(Calendar.DAY_OF_MONTH);
    gc = new GregorianCalendar(year, month, day);
    String time = SMUtils.getTime(note.getDate() ,gc.getTimeInMillis() );
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center"><%=note.getSubject()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td class="normalText"><%=note.getNote()%></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr> 
            <td><span class="largeHeading">Created By:</span> <span class="normalText"><%=note.getCreator().getFirstName() + " " + note.getCreator().getLastName()%></span></td>
          </tr>
          <tr>
            <td><span class="largeHeading">Date Created:</span> <span class="normalText"><%=month + "/" + day + "/"  + year + "  " + time%></span></td>
          </tr>
        </table></td>
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
