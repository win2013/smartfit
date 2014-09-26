<%@include file="imports.jsp"%>
<HTML>
<HEAD>
<TITLE>SmartFit: Client Module</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</HEAD>
<BODY BGCOLOR=#CCCCFF link="#3333CC" vlink="#3333CC" alink="#0099FF" LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="MM_preloadImages('buttons/profile_p.gif','buttons/notes_p.gif','buttons/routines_p.gif','buttons/appointments_p.gif','buttons/performance_p.gif','buttons/purchase_p.gif','buttons/contracts_p.gif')">
<!-- ImageReady Slices (pagelayout.psd) -->
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD ROWSPAN=2> <IMG SRC="images/pagelayout_01.gif" WIDTH=49 HEIGHT=90 ALT=""></TD>
    <TD> <IMG SRC="images/pagelayout_02.gif" WIDTH=180 HEIGHT=62 ALT=""></TD>
    <TD COLSPAN=2> <IMG SRC="images/pagelayout_03.gif" WIDTH=464 HEIGHT=62 ALT=""></TD>
    <TD COLSPAN=2 background="images/pagelayout_04.gif"><TABLE BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
        <TR> 
          <TD> <IMG SRC="images/left-box_01.gif" WIDTH=15 HEIGHT=16 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_02.gif" WIDTH=60 HEIGHT=16 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_03.gif" WIDTH=13 HEIGHT=16 ALT=""></TD>
        </TR>
        <TR> 
          <TD> <IMG SRC="images/left-box_04.gif" WIDTH=15 HEIGHT=20 ALT=""></TD>
          <TD bgcolor="#FFFFFF" class="smallLinks"><div align="center"><a href="index.jsp">Logout</a></div></TD>
          <TD> <IMG SRC="images/left-box_06.gif" WIDTH=13 HEIGHT=20 ALT=""></TD>
        </TR>
        <TR> 
          <TD> <IMG SRC="images/left-box_07.gif" WIDTH=15 HEIGHT=14 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_08.gif" WIDTH=60 HEIGHT=14 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_09.gif" WIDTH=13 HEIGHT=14 ALT=""></TD>
        </TR>
      </TABLE> </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=62 ALT=""></TD>
  </TR>
  <TR> 
    <TD COLSPAN=4 ROWSPAN=2 bgcolor="#CCCCFF"><table width="90%" border="0" cellspacing="0" cellpadding="2">
        <tr> 
          <td valign="top"> <TABLE BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
              <TR> 
                <TD> <IMG SRC="images/left-box_01.gif" WIDTH=15 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_02.gif" WIDTH=147 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_03.gif" WIDTH=13 HEIGHT=16 ALT=""></TD>
              </TR>
              <TR> 
                <TD> <IMG SRC="images/left-box_04.gif" WIDTH=15 HEIGHT=370 ALT=""></TD>
                <TD valign="top" bgcolor="#FFFFFF"> <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0" class="tableTop">
                    <tr> 
                      <td><div align="center"> 
                          <p class="largeHeading">Client Menu</p>
                        </div></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                    <tr> 
                      <td> <table width="100%" border="0" cellspacing="0" cellpadding="2">
                          <tr> 
                            <td><div align="center"><a href="profileMain.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Profile','','buttons/profile_p.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/profile_w.gif" name="Profile" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr> 
                            <td><div align="center"><a href="notesMain.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Notes','','buttons/notes_p.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/notes_w.gif" name="Notes" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr> 
                            <td><div align="center"><a href="routines_view.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Routines','','buttons/routines_p.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/routines_w.gif" name="Routines" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr> 
                            <td><div align="center"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Appointments','','buttons/appointments_p.gif',1)"><img src="buttons/appointments_w.gif" name="Appointments" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr> 
                            <td><div align="center"><a href="performanceMain.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Performance','','buttons/performance_p.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/performance_w.gif" name="Performance" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr>
                            <td><div align="center"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Purchase','','buttons/purchase_p.gif',1)"><img src="buttons/purchase_w.gif" name="Purchase" width="128" height="25" border="0"></a></div></td>
                          </tr>
                          <tr> 
                            <td><div align="center"> <a href="contracts_setInterval.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Contracts','','buttons/contracts_p.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/contracts_w.gif" name="Contracts" width="128" height="25" border="0"></a></div></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <div align="center"> 
                    <table width="100%" height="44%" border="0" cellpadding="2" cellspacing="0">
                      <tr> 
                        <td valign="middle"><div align="center"></div></td>
                      </tr>
                    </table>
                  </div></TD>
                <TD> <IMG SRC="images/left-box_06.gif" WIDTH=13 HEIGHT=370 ALT=""></TD>
              </TR>
              <TR> 
                <TD> <IMG SRC="images/left-box_07.gif" WIDTH=15 HEIGHT=14 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_08.gif" WIDTH=147 HEIGHT=14 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_09.gif" WIDTH=13 HEIGHT=14 ALT=""></TD>
              </TR>
            </TABLE></td>
          <td><TABLE BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
              <TR> 
                <TD> <IMG SRC="images/left-box_01.gif" WIDTH=15 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_02.gif" WIDTH=560 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_03.gif" WIDTH=13 HEIGHT=16 ALT=""></TD>
              </TR>
              <TR> 
                <TD> <IMG SRC="images/left-box_04.gif" WIDTH=15 HEIGHT=370 ALT=""></TD>
                <TD bgcolor="#FFFFFF"> 
                  <!-- This is the IFRAME -->
                  <iframe scrolling="auto" name="_adminFrame" align="middle" frameborder="0" width="100%" height="100%" src="main.jsp"></iframe> 
                </TD>
                <TD> <IMG SRC="images/left-box_06.gif" WIDTH=13 HEIGHT=370 ALT=""></TD>
              </TR>
              <TR> 
                <TD> <IMG SRC="images/left-box_07.gif" WIDTH=15 HEIGHT=14 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_08.gif" WIDTH=560 HEIGHT=14 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_09.gif" WIDTH=13 HEIGHT=14 ALT=""></TD>
              </TR>
            </TABLE></td>
        </tr>
      </table> </TD>
    <TD ROWSPAN=2 bgcolor="#CCCCFF">&nbsp; </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=28 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_08.gif" WIDTH=49 HEIGHT=400 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=352 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_09.gif" WIDTH=49 HEIGHT=38 ALT=""></TD>
    <TD COLSPAN=4 bgcolor="#CCCCFF">&nbsp; </TD>
    <TD bgcolor="#CCCCFF">&nbsp;</TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=38 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/spacer.gif" WIDTH=49 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=73 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=134 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=330 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=129 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=45 HEIGHT=1 ALT=""></TD>
    <TD></TD>
  </TR>
</TABLE>
<!-- End ImageReady Slices -->
</BODY>
</HTML>