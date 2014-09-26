<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String noteID = request.getParameter("noteID");
    int id = Integer.parseInt(noteID);
    Note note= client.getNote(id);
%>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("updateActive")) {
        String value = request.getParameter("value");
        if (value.equals("yes"))
            note.setActive(true);
        if (value.equals("no"))
            note.setActive(false);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function updateActive(value) {
    window.location = 'clients_notesDetail.jsp?action=updateActive&noteID=<%=note.getID()%>&value=' + value;
}
</script>
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
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center"><%=note.getSubject()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td class="normalText"><%=note.getNote()%></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr> 
            <td bgcolor="#FFCC66" class="tableTop"><span class="largeHeading">Date 
              Created:</span> <span class="normalText"><%=SMUtils.parseDateAndTime(note.getDate())%></span></td>
          </tr>
          <tr>
            <td class="largeHeading">Note is: 
              <input type="radio" name="radiobutton" value="radiobutton" onclick="javascript:updateActive('yes')" <%=( (note.getActive()) ?"checked" :"")%>>
              Active 
              <input type="radio" name="radiobutton" value="radiobutton" onclick="javascript:updateActive('no')" <%=( (!note.getActive()) ?"checked" :"")%>>
              Inactive</td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
</body>
</html>
