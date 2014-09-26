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
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Appointment on &lt;date&gt; at &lt;time&gt;</div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="66%" class="largeHeading"><div align="center"></div>
              <div align="left">
                <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                  <tr class="largeHeading"> 
                    <td> <div align="right" class="normalText"><a href="appointments_createMod.jsp">Modify</a></div></td>
                  </tr>
                </table>  
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                  <tr bgcolor="#C7E1E9" class="normalText"> 
                    <td colspan="4" bgcolor="#FFFFFF"> <div align="left">&lt;appointmentText&gt;</div></td>
                  </tr>
                </table>
              </div></td>
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
