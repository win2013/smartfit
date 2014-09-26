<%@include file="imports.jsp"%>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";

    if (action.equals("create")) {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Routine routine = db.createRoutine();
        routine.setCreator(trainer);
        routine.setName(name);
        routine.setDescription(description);
        trainer.addRoutine(routine);
        response.sendRedirect("routines_modify_trainer.jsp?routineID=" + routine.getID());        
        return;
    }
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
<form name="mainForm" method="post" action="routines_create_trainer.jsp?action=create">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Create Routine</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="20%" class="largeHeading"> 
                    <div align="left">Routine Name:</div></td>
                  <td width="85%"><input name="name" type="text" size="30"></td>
                </tr>
                <tr> 
                  <td class="largeHeading">Description:</td>
                  <td rowspan="2"><textarea name="description" cols="45" rows="4"></textarea></td>
                </tr>
                <tr>
                  <td class="largeHeading">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="normalText">
                <tr> 
                  <td> <div align="right">
                      <input type="submit" name="Submit" value="Next">
                    </div>
                    <div align="center"></div>
                    </td>
                </tr>
              </table>
              
            </td>
          </tr>
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