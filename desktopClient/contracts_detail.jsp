<%@include file="imports.jsp"%>
<%
	String contractID = request.getParameter("contractID");
    int id = Integer.parseInt(contractID);
    Contract contract = client.getContract(id);
%>
<%
    float total = contract.getPrice();
    float paid = 0;
    
    Enumeration enum = contract.getPayments().elements();
    while (enum.hasMoreElements()) {
        Payment payment = (Payment)enum.nextElement();
        paid += payment.getAmount();
    }

    int sessionsPaidFor = (int)Math.floor((double)(paid*(float)contract.getNumberOfSessions()/contract.getPrice()));
    
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
<form name="form1" method="post" action="../adminModule/routeStatsOptions.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">Contract Detail for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" align="center" class="tableTop">
          <tr> 
            <td width="33%" class="largeHeading">Slot #</td>
            <td width="33%" class="largeHeading">Workout Session</td>
            <td width="33%" class="largeHeading">Client Paid Club?</td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
<%
	int count = 0;
	enum = contract.getContractEntrys().elements();
	while (enum.hasMoreElements()) {
		ContractEntry entry = (ContractEntry)enum.nextElement();
		String wsDisplay = "n/a";
		if (entry.getWorkoutSession() != null) {
			wsDisplay = "<a href=\"\">" + SMUtils.parseDateAndTime(entry.getWorkoutSession().getStartTime()) + "</a>";
		}%>
        <tr class="normalText" bgcolor=<%=( (count++%2==0) ?"C7E1E9" :"FFFFFF")%>> 
	        <td width="33%" bgcolor="#C7E1E9"><%=entry.getSessionNumber()%></td>
            <td width="33%" bgcolor="#C7E1E9"><%=wsDisplay%></td>
            <td width="33%" bgcolor="#C7E1E9"><%=( (sessionsPaidFor >= entry.getSessionNumber()) ?"Yes" :"No")%></td>
   
   		</tr>
	
<%		
	}
%>        
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