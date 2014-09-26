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
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
  <tr> 
    <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr> 
          <td bgcolor="#FFCC66" class="largeHeading"> 
            <div align="center"></div>
            <div align="center">Welcome</div></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr> 
          <td bgcolor="#FFFFFF" class="normalText"> 
            <p><b><%=trainer.getFirstName() + " " + trainer.getLastName()%></b>, you 
            are administrating <b><%=club.getName()%></b>.<br>
            </p></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>