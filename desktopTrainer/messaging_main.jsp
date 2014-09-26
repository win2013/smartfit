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
<script language="JavaScript">
function change(desiredColor, desiredElement)
{
	o=document.getElementById(desiredElement);
	o.style.backgroundColor=desiredColor;
}
</script>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Messaging 
                for <%=trainer.getFirstName() + " " + trainer.getLastName() %></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="10%" class="largeHeading"> <div align="center"> 
                <div align="left"> 
                  <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                    <tr> 
                      <td><a href="messaging_sendList.jsp"><img onmouseover="javascript:change('#F0F0F0', 'A')" onmouseout="javascript:change('white', 'A')" src="pictures/sendmessage.gif" width="75" height="60" border="0"></a></td>
                    </tr>
                  </table>
                </div>
              </div></td>
            <td ID="A" onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" width="40%" class="largeHeading"><a href="messaging_sendList.jsp">Send 
              Message </a><span class="normalText"><br>
              <font color="#666666">Send a message to Trainers or Managers.</font></span></td>
            <td width="10%" class="largeHeading"> <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="messaging_archived.jsp"><img onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" src="pictures/viewarchive.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="B" onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" width="40%" class="largeHeading"><a href="messaging_archived.jsp">View 
              Archive</a><span class="normalText"><br>
              <font color="#666666">View all saved messages.</font></span></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
