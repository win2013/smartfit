<%@include file="imports.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	Client client = (Client)session.getAttribute("client");
		
	int slots = Integer.parseInt(request.getParameter("slots"));
	float price = Float.parseFloat(request.getParameter("price"));
	long time = Long.parseLong(request.getParameter("time"));
	Trainer trainer = club.getTrainer(Integer.parseInt(request.getParameter("trainerID")));
%>
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
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Confirm Contract Creation for Client <%=client.getFirstName() + " " + client.getLastName()%>
				</div>
              <div align="center"></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr> 
            <td> Are the following parameters correct?<ul>
              <li>Slots:  <%=slots%></li>
              <li>Time per Session:  <%=time%> min</li>
              <li>Package Price: <%=price%></li>
              <li>Trainer:  <%=trainer.getFirstName() + " " + trainer.getLastName()%><br>
&nbsp;</li>
            </ul>
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
              <tr>
                <td width="50%" align="center">
                <a href="member_contracts_create.jsp?action=create&slots=<%=slots%>&time=<%=time%>&trainerID=<%=trainer.getID()%>&price=<%=price%>">YES</a></td>
                <td width="50%" align="center">
                <a href="member_contracts_create.jsp">NO</a></td>
              </tr>
            </table>
            </td>
          </tr>
        </table> </td>
          </tr>
        </table>
        
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
</body>
</html>