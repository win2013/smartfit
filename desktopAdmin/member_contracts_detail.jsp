<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String contractID = request.getParameter("contractID");
    int id = Integer.parseInt(contractID);
    Contract contract = client.getContract(id);

    float total = contract.getPrice();
    float paid = 0;
    
    Enumeration enum = contract.getPayments().elements();
    while (enum.hasMoreElements()) {
        Payment payment = (Payment)enum.nextElement();
        paid += payment.getAmount();
    }

    int sessionsPaidFor = (int)Math.floor((double)(paid*(float)contract.getNumberOfSessions()/contract.getPrice()));
    
%>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("updateTrainerPaidEntry")) {
        enum = contract.getContractEntrys().elements();
        int sessionNumber = Integer.parseInt(request.getParameter("entryNum"));
        boolean desiredTrainerPaid = (request.getParameter("changeTo").equals("Yes"));
        while (enum.hasMoreElements()) {
            ContractEntry entry = (ContractEntry)enum.nextElement();
            if (entry.getSessionNumber() == sessionNumber) {
                entry.setTrainerPaid(desiredTrainerPaid);
                break;
            }
        }
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function updateEntry(value) {
    window.location = 'member_contracts_detail.jsp?action=updateTrainerPaidEntry&' + value;
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
<form name="form1" method="post" action="routeStatsOptions.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  
            <td bgcolor="#99CCFF" class="largeHeading"> 
              <div align="center">Contract Detail for Client <%=client.getFirstName() + " " + client.getLastName()%></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr> 
            <td width="50%" class="largeHeading">Contract Price: <span class="normalText">$<%=contract.getPrice()%></span></td>
            <td width="50%" class="largeHeading" align="left" valign="middle">
            <ul>
              <li>Total Payment Made (<%=contract.getPayments().size()%>): <span class="normalText">$<%=paid%> </span></li>
              <li>Balance Due:&nbsp; <%=(contract.getPrice()-paid)%></li>
              <li>
              <a href="member_contracts_payment.jsp?contractID=<%=contract.getID()%>">Make Payment</a></li>
              <li>
              <a href="member_contracts_paymentView.jsp?contractID=<%=contract.getID()%>">View Payments</a></li>
            </ul>
            </td>
          </tr>
          <tr> 
            <td width="50%" class="largeHeading">Total Slots for Contract: <span class="normalText"><%=contract.getNumberOfSessions()%></span></td>
            <td width="50%" class="largeHeading">Session Length: <span class="normalText"><%=contract.getTimePerSession() + " mins"%></span></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" class="tableTop">
          <tr> 
            <td width="15%" class="largeHeading">Slot #</td>
            <td width="35%" class="largeHeading">Workout Session</td>
            <td width="25%" class="largeHeading"><div align="center">Client Paid 
                Club?</div></td>
            <td width="25%" class="largeHeading"><div align="center">Club Paid 
                Trainer?</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
<%
    enum = contract.getContractEntrys().elements();
    int count = 0;
    while (enum.hasMoreElements()) {
        ContractEntry entry = (ContractEntry)enum.nextElement();
        WorkoutSession ws = entry.getWorkoutSession();
        String clientPaid = ( (entry.getSessionNumber() > sessionsPaidFor) ?"No" :"Yes");%>
          <tr bgcolor="<%=( (count++%2==0) ?"#C7E1E9" :"#FFFFFF")%>" class="normalText"> 
            <td width="15%"><%=entry.getSessionNumber()%></td>
<%
        if (ws != null) {%>
            <td width="35%"><a href="member_session_detail.jsp?workoutSessionID=<%=ws.getID()%>&clientID=<%=client.getID()%>"><%=SMUtils.parseDate(contract.getStartDate()) + " @ " + SMUtils.parseTime(contract.getStartDate())%></a></td>
            <td width="25%"><center><%=clientPaid%></center></td>
            <td width="25%"> <div align="center">
                <input name="radiobutton<%=entry.getSessionNumber()%>" onclick="javascript:updateEntry('<%="contractID=" + contract.getID() + "&entryNum=" + entry.getSessionNumber() + "&changeTo=Yes"%>')" type="radio" value="Yes" <%=( (entry.getTrainerPaid()) ?"checked" :"")%>>
                Yes
                <input type="radio" onclick="javascript:updateEntry('<%="contractID=" + contract.getID() + "&entryNum=" + entry.getSessionNumber() + "&changeTo=No"%>')" name="radiobutton<%=entry.getSessionNumber()%>" value="No" <%=( (!entry.getTrainerPaid()) ?"checked" :"")%>>
                No</div></td>
            <%
        }
        else
        {%>
            <td width="35%">n/a</td>
            <td width="25%"><%=clientPaid%></td>
            <td width="25%"> <div align="center">
                <input name="radiobutto<%=entry.getSessionNumber()%>n" onclick="javascript:updateEntry('<%="contractID=" + contract.getID() + "&entryNum=" + entry.getSessionNumber() + "&changeTo=Yes"%>')" type="radio" value="radiobutton" <%=( (entry.getTrainerPaid()) ?"checked" :"")%> >
                Yes
                <input type="radio" onclick="javascript:updateEntry('<%="contractID=" + contract.getID() + "&entryNum=" + entry.getSessionNumber() + "&changeTo=No"%>')" name="radiobutton<%=entry.getSessionNumber()%>" value="radiobutton" <%=( (!entry.getTrainerPaid()) ?"checked" :"")%>>
                No</div></td>
            <%
        }
        %> </tr><%
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