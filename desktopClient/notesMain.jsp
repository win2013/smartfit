<%@include file="imports.jsp"%>
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
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">Notes for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td width="40%" class="largeHeading">Note Subject</td>
            <td width="20%" class="largeHeading">Date</td>
            <td width="20%" class="largeHeading">Confidential?</td>
            <td width="10%" class="largeHeading">Active?</td>
          </tr>
<%
    Enumeration enum = client.getNotes().elements();
    while (enum.hasMoreElements()) {
        Note note = (Note)enum.nextElement();
		{%>
            <tr class="normalText"> 
            <td width="51%" bgcolor="#C7E1E9"> <div align="left" class="normalText"><a href="notesDetail.jsp?noteID=<%=note.getID()%>"><%=note.getSubject()%></a></div></td>
            <td width="30%" bgcolor="#C7E1E9"><%=SMUtils.parseDateAndTime(note.getDate())%></td>
            <td width="9%" bgcolor="#C7E1E9"><%=( (note.getConfidential()) ?"Yes" :"No")%></td>
            <td width="10%" bgcolor="#C7E1E9"><%=( (note.getActive()) ?"Yes" :"No")%></td>
          </tr>      
<%    
        }
    }
%>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" height="16">
    <tr> 
      <td height="12"><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
</body>
</html>