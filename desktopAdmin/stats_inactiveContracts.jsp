<%@include file="imports.jsp"%>
<%
    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;
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
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Inactive 
                Contracts for <%=club.getName()%> between <%=SMUtils.parseDate(startTime)%> 
                and <%=SMUtils.parseDate(endTime)%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td class="largeHeading">Total Inactive Contracts:</td>

          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td width="30%" class="largeHeading">Name</td>
            <td width="20%" class="largeHeading">Date Contract Signed</td>
            <td width="20%" class="largeHeading">Last Session Used</td>
            <td width="30%" class="largeHeading">Trainer</td>
          </tr>
          <%
    Enumeration enum = client.getNotes().elements();
    GregorianCalendar gc = new GregorianCalendar();
    int count = 0;
    while (enum.hasMoreElements()) {
        Note note = (Note)enum.nextElement();
        gc.setTimeInMillis(note.getDate());        
        int year = gc.get(Calendar.YEAR);
        int month = gc.get(Calendar.MONTH);
        int day = gc.get(Calendar.DAY_OF_MONTH);
        gc = new GregorianCalendar(year, month, day);
        String time = SMUtils.getTime(note.getDate() ,gc.getTimeInMillis() );
%>
          <tr class="normalText" bgcolor="<%= ( (count++%2==0) ?"#C7E1E9" :"#FFFFFF")%>"> 
            <td width="30%"> 
              <div align="left" class="normalText"><a href="member_notesDetail.jsp?noteID=<%=note.getID()%>"><%=client.getFirstName() + " " + client.getLastName()%></a></div></td>
            <td width="20%"><%=month + "/" + day + "/"  + year + "  " + time%></td>
            <td width="20%"><%=month + "/" + day + "/"  + year + "  " + time%></td>
            <td width="30%"><%=trainer.getFirstName() + " " + trainer.getLastName()%></td>
            <%
    }
%>
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
