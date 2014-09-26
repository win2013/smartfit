<%@include file="imports.jsp"%>
<HTML>
<HEAD>
<TITLE>SmartFit: Admin Module</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</HEAD>
<body bgcolor="#99CCFF" link="#3333CC" vlink="#3333CC" alink="#0099FF" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('buttons/members_b.gif','buttons/trainers_b.gif','buttons/club_programs_b.gif','buttons/clubstats_b.gif','buttons/clubinfo_b.gif','buttons/messaging_b.gif')">
<!-- ImageReady Slices (pagelayout.psd) -->
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD ROWSPAN=2> <IMG SRC="images/pagelayout_01.gif" WIDTH=49 HEIGHT=90 ALT=""></TD>
    <TD> <IMG SRC="images/pagelayout_02.gif" WIDTH=180 HEIGHT=62 ALT=""></TD>
    <TD COLSPAN=2> <IMG SRC="images/pagelayout_03.gif" WIDTH=464 HEIGHT=62 ALT=""></TD>
    <TD valign="top" background="images/pagelayout_04.gif" bgcolor="#99CCFF"><div align="right">
        <TABLE WIDTH=120 BORDER=0 CELLPADDING=0 CELLSPACING=0>
          <TR> 
            <TD COLSPAN=3> <IMG SRC="images/logout_border_01.gif" WIDTH=120 HEIGHT=10 ALT=""></TD>
          </TR>
          <TR> 
            <TD ROWSPAN=2> <IMG SRC="images/logout_border_02.gif" WIDTH=26 HEIGHT=49 ALT=""></TD>
            <TD height="26" background="images/logout_border_03.gif" class="largeHeading"><div align="center"><a href="index.jsp">LOGOUT</a></div></TD>
            <TD ROWSPAN=2> <IMG SRC="images/logout_border_04.gif" WIDTH=29 HEIGHT=49 ALT=""></TD>
          </TR>
          <TR> 
            <TD> <IMG SRC="images/logout_border_05.gif" WIDTH=65 HEIGHT=23 ALT=""></TD>
          </TR>
        </TABLE>
      </div></TD>
    <TD valign="top" bgcolor="#99CCFF">&nbsp;</TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=62 ALT=""></TD>
  </TR>
  <TR> 
    <TD COLSPAN=4 ROWSPAN=2 bgcolor="#99CCFF"><table width="90%" border="0" cellspacing="0" cellpadding="2">
        <tr> 
          <td valign="top"> <TABLE WIDTH=175 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
              <TR> 
                <TD> <IMG SRC="images/left-box_01.gif" WIDTH=15 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_02.gif" WIDTH=147 HEIGHT=16 ALT=""></TD>
                <TD> <IMG SRC="images/left-box_03.gif" WIDTH=13 HEIGHT=16 ALT=""></TD>
              </TR>
              <TR> 
                <TD> <IMG SRC="images/left-box_04.gif" WIDTH=15 HEIGHT=395 ALT=""></TD>
                <TD bgcolor="#FFFFFF"><div align="center"> 
                    <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                      <tr> 
                        <td class="largeHeading"><div align="center">Administrator 
                            Menu</div></td>
                      </tr>
                    </table>
                  </div>
                  <div align="center"></div>
                  <div align="center"></div>
                  <div align="center"></div>
                  <div align="center"></div>
                  <div align="center"></div>
                  <div align="center"> 
                    <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                      <tr> 
                        <td><div align="center"><a href="membersMain.jsp" target="_adminFrame" onMouseOver="MM_swapImage('members','','buttons/members_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/members_w.gif" name="members" width="128" height="25" border="0"></a></div></td>
                      </tr>
                      <tr> 
                        <td><div align="center"><a href="trainersMain.jsp" target="_adminFrame" onMouseOver="MM_swapImage('trainers','','buttons/trainers_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/trainers_w.gif" name="trainers" width="128" height="25" border="0"></a></div></td>
                      </tr>
                      <tr> 
                        <td><div align="center"><a href="messaging_main.jsp" target="_adminFrame" onMouseOver="MM_swapImage('Messaging','','buttons/messaging_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/messaging_w.gif" name="Messaging" width="128" height="25" border="0"></a></div></td>
                      </tr>
                      <tr> 
                        <td><div align="center"><a href="clubProgram_main.jsp" target="_adminFrame" onMouseOver="MM_swapImage('programs','','buttons/club_programs_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/club_programs_w.gif" name="programs" width="128" height="25" border="0"></a></div></td>
                      </tr>
                      <tr> 
                        <td><div align="center"><a href="stats_setInterval.jsp" target="_adminFrame" onMouseOver="MM_swapImage('stats','','buttons/clubstats_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/clubstats_w.gif" name="stats" width="128" height="25" border="0"></a></div></td>
                      </tr>
                      <tr> 
                        <td><div align="center"><a href="clubInfo_main.jsp" target="_adminFrame" onMouseOver="MM_swapImage('club_info','','buttons/clubinfo_b.gif',1)" onMouseOut="MM_swapImgRestore()"><img src="buttons/clubinfo_w.gif" name="club_info" width="128" height="25" border="0"></a></div></td>
                      </tr>
                    </table>
                    <table width="90%" border="0" cellspacing="0" cellpadding="2">
                      <tr> 
                        <td><img src="leftsidepicture.gif" width="128" height="195"></td>
                      </tr>
                    </table>
                  </div></TD>
                <TD> <IMG SRC="images/left-box_06.gif" WIDTH=13 HEIGHT=395 ALT=""></TD>
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
      </table></TD>
    <TD ROWSPAN=2 bgcolor="#99CCFF">&nbsp; </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=28 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_08.gif" WIDTH=49 HEIGHT=405 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=352 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_09.gif" WIDTH=49 HEIGHT=38 ALT=""></TD>
    <TD COLSPAN=5 bgcolor="#99CCFF">&nbsp; </TD>
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