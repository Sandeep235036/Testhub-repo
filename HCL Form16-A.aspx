

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <script language="javascript" type="text/javascript">
        //Form16 Validation.
        function validate() {

            if (TrimAll(document.all["ctl00_cphPage_ddlYear"].value) == '') {
                alert("Year is mandatory field.");
                document.all["ctl00_cphPage_ddlYear"].focus();
                return false;
            }
        }
        //function ShowInfoMsg() {
        //    var Msg = "Note:- Adobe Reader only up to version 9.0 is required to view Form 16 correctly.";
        //    alert(Msg);
        //}

        function ShowInfoMsg() {
            document.getElementById('infoModal').style.display = 'block';
        }

        function closePopup() {

            document.getElementById('infoModal').style.display = 'none';

        }


        function ShowHelpDoc() {
            window.open("XMLFiles/Form 16 Instructions_FY 2024-25.docx", "Form16Help");
        }
        function OnF16Click(f16type, f16FlagValue) {
            if (f16FlagValue == 'N') {
                alert(f16type + " is consolidated in a single document for this year. For any clarification regarding your Form 16 please open SSD on ES.");
            }
            else {
                alert(f16type + " does not exist. For any clarification regarding your Form 16 please open SSD on ES.");
            }
            return false;
        }
        function NewWindow() {
            document.forms[0].target = '_blank';
        }
    </script>
    <script>
        function Confirm_Submit() {
            var conf = confirm("It is redirecting to another web page. Are you sure to proceed ?");
            if (conf == true) {
                return true;
            }
            else { return false; }
        }
    </script>

    <script src="JS/JScript.js"></script>
    <script src="JS/JScript1.js"></script>

    <script src="JS/JsCalender.js" type="text/javascript"></script>

    <!-- Autobot -->
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    
    

    <link rel="shortcut icon" type="image/ico" href="/favicon.ico" />

    <style type="text/css">
        .SiteOptimized {
            FONT-FAMILY: Tahoma, Verdana, Arial;
            font-size: 10px;
            color: Red;
            font-weight: bold;
        }

        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }

        .hide-calender-icon ~ .x-form-trigger.x-form-date-trigger {
    display: none; 
}
    </style>
    <script type="text/javascript" language="javascript">
        function sanitize(inputs) {
            const map = {
                '&': '',
                '<': '',
                '>': '',
                '"': '',
                "'": '',
                "/": '',
                "$": '',
                "%": '',
                "~": '',
            };
            const reg = /[&<>"']/ig;
            var ss = inputs.replace(reg, (match) => (map[match]));
            return ss;
        }
        function OpenInNewTab(url) {
            window.open(url, '_blank').focus();
        }
        function ShowEducationMessage() {
            var WinSettings = 'center:yes;scroll:no;resizable:no;status:no;dialogHeight:550px;dialogWidth:750px';
            window.showModalDialog('EducationPopup.aspx', '', WinSettings);
        }
        function ShowEducationSSDHelp() {
            var WinSettings = 'center:yes;scroll:no;resizable:no;status:no;dialogHeight:330px;dialogWidth:750px';
            window.showModalDialog('EducationSSDPopup.aspx', '', WinSettings);
        }
        function ShowSeatCodeUpdationMsg() {
            //        alert("Seat Code updation is not part of ESS. For any queries/issues in Seat Code updation, kindly raise SSD against the same and not against My Profile (ESS).");
            var result = confirm('Seat Codes can be only updated in the Seating Management System. By clicking on “Proceed to SMS”, you will be re-directed to the  Seating Management System.');

            return result;

        }



        //will give a confirmation before logging out of the application.
        function ShowValidationPage() {
            try {
                var page;
                do {
                    if (document.forms.length > 0)
                        document.forms[0].disabled = true;
                    page = window.showModalDialog("Validate.aspx", null, "dialogHeight:200px;dialogWidth:450px;status=no;help:no;");
                } while (page == "");
                if (page != "")
                    window.location.href = page;
            }
            catch (ex) {
                alert("Popup blocker was detected.Please turn-off Popup Blocker to view the page");
            }
        }
        var strMyHCLPage;
        var strLogoutPage;
        var strMyHCLMyPage;
        var strMyHCLSSDPage;
        function ShowDataConfirmationPage(page) {
            try {
                var isChrome = /chrome/.test(navigator.userAgent.toLowerCase());
                var isfirefox = /firefox/.test(navigator.userAgent.toLowerCase());
                var issafari = /safari/.test(navigator.userAgent.toLowerCase());
                if (!isChrome && !isfirefox && !issafari) {
                    var retVal = window.showModalDialog("DataConfirmation.aspx", null, "dialogHeight:550px;dialogWidth:580px;status=no;help:no;");
                    if (retVal == "Y") {
                        if (page == "MYHCL")
                            window.location.href = strMyHCLPage;
                        else if (page == "MYPAGE")
                            window.location.href = strMyHCLMyPage;
                        else if (page == "SSD")
                            window.location.href = strMyHCLSSDPage;
                        else
                            window.location.href = strLogoutPage;
                    }
                }
                else {
                    var url = page;
                    var a = window.open("DataConfirmation.aspx?CONFM=" + url, "MsgWindow", "width=580, height=550 ,status=yes, toolbar=no, menubar=no, location=no,addressbar=no");

                }
            }

            catch (ex) {
                alert("Popup blocker was detected.Please turn-off Popup Blocker to view the page");
            }
        }
        //Chrome and other browser Pop up work on Delegate click
        /*function LoadDelegateWindow()
        {
            var Success = 'false';
            var WinSettings = 'center:yes;scroll:no;resizable:no;status:no;dialogHeight:300px;dialogWidth:600px';
            var MyArgs = new Array(Success);
            var MyArgs=window.showModalDialog('Delegate.aspx',MyArgs, WinSettings);
            if (MyArgs!=undefined && MyArgs[0]=='True')
            {
                window.location.reload();
                return false;
            }
        	
        }*/
        function LoadDelegateWindow() {
            var Success = 'false';
            var MyArgs = new Array(Success);
            var isChrome = /chrome/.test(navigator.userAgent.toLowerCase());
            if (!isChrome) {

                var arrRetVal;
                arrRetVal = window.showModalDialog("Delegate.aspx", null, "dialogHeight:450px;dialogWidth:620px;status=no;help:no;");
                window.location.reload();
                return false;
            }
            else {
                var a = window.open("Delegate.aspx", "MsgWindow", "width=620, height=450,status=yes, toolbar=no, menubar=no, location=no,addressbar=no");
                window.location.reload();
                return false;
            }
        }


        function ChangeCursor() {
            document.getElementById('Label1').cursor = "crosshair";
        }
        function LogoutApp() {
            if (window.confirm("You are about to logout of the ESS application")) {
                return true;

            }

        }

        function OpenWin() {
            window.open("ESSFAQs.doc", "new_win")
            return false;

        }

        function Navigate2(url, msg) {
            if (msg != "")
                alert(msg);
            window.location = url;
            return false;

        }

        function OnTabClick(tabclicked, divtab, tabids, divids) {
            //alert(tabclicked + "\n" + divtab);
            var arr = tabids.split("#@#");
            var i;
            for (i = 0; i < arr.length; i++)
                if (document.getElementById(arr[i]) != null)
                    document.getElementById(arr[i]).className = 'InfotypeTab';

            var arr = divids.split("#@#");
            for (i = 0; i < arr.length; i++)
                if (document.getElementById(arr[i]) != null)
                    document.getElementById(arr[i]).className = "InfotypeTabPanel";

            //document.getElementById(arr[i]).style.display = 'none';

            document.getElementById(tabclicked).className = "InfotypeTabSelected";
            document.getElementById(divtab).className = "InfotypeTabPanelSelected";
            //document.getElementById(divtab).style.display = '';

        }

    </script>
    <script type="text/javascript">  
        var _backgroundElement = document.createElement("div");
        _backgroundElement.style.display = 'none';

        function pageLoad() {
            var manager = Sys.WebForms.PageRequestManager.getInstance();
            manager.add_beginRequest(OnBeginRequest);
            manager.add_endRequest(OnEndRequest);

            // divPageContent is the parent of the new DIV
            $get("divPageContent").appendChild(_backgroundElement);
        }

        var lcPostbackElementID;
        function OnBeginRequest(sender, args) {
            //        lcPostbackElementID = args.get_postBackElement().id.toLowerCase();
            //        if (lcPostbackElementID == "<= UltraWebListbar1.ClientID.ToLower() %>")
            lcPostbackElementID = args.get_postBackElement();
            if (!lcPostbackElementID)
                return;
            EnableUI(false);
        }

        function OnEndRequest(sender, args) {
            //        if (lcPostbackElementID == "<= UltraWebListbar1.ClientID.ToLower() %>")
            if (!lcPostbackElementID)
                return;
            EnableUI(true);
        }

        function EnableUI(state) {
            if (!state) {
                _backgroundElement.style.display = '';
                _backgroundElement.style.position = 'fixed';
                _backgroundElement.style.left = '0px';
                _backgroundElement.style.top = '30px';

                var clientBounds = this._getClientBounds();
                var clientWidth = clientBounds.width;
                var clientHeight = clientBounds.height;
                _backgroundElement.style.width =
                    Math.max(Math.max(document.documentElement.scrollWidth,
                        document.body.scrollWidth), clientWidth) + 'px';
                _backgroundElement.style.height =
                    Math.max(Math.max(document.documentElement.scrollHeight,
                        document.body.scrollHeight), clientHeight) + 'px';
                _backgroundElement.style.zIndex = 10000;
                _backgroundElement.className = "modalBackground";

                //$get("<=ESSHeader1.Menu1.ClientID%>").disabled = true;
                //$get("<=UpdatePanel1.ClientID%>").disabled = true;

            }
            else {
                _backgroundElement.style.display = 'none';

                //$get("<=ESSHeader1.Menu1.ClientID%>").disabled = false;
                //$get("<=UpdatePanel1.ClientID%>").disabled = false;
            }
        }

        function _getClientBounds() {
            var clientWidth;
            var clientHeight;
            switch (Sys.Browser.agent) {
                case Sys.Browser.InternetExplorer:
                    clientWidth = document.documentElement.clientWidth;
                    clientHeight = document.documentElement.clientHeight;
                    break;
                case Sys.Browser.Safari:
                    clientWidth = window.innerWidth;
                    clientHeight = window.innerHeight;
                    break;
                case Sys.Browser.Opera:
                    clientWidth = Math.min(window.innerWidth,
                        document.body.clientWidth);
                    clientHeight = Math.min(window.innerHeight,
                        document.body.clientHeight);
                    break;
                default:  // Sys.Browser.Firefox, etc.
                    clientWidth = Math.min(window.innerWidth,
                        document.documentElement.clientWidth);
                    clientHeight = Math.min(window.innerHeight,
                        document.documentElement.clientHeight);
                    break;
            }
            return new Sys.UI.Bounds(0, 0, clientWidth, clientHeight);
        }

        function afterItemSelectedHandler(listBar, item, igEvent) {
            if (item.TargetUrl.indexOf("_DoPostBack") > 0) {
                //alert(item.TargetUrl);
                igEvent.cancel = true;
                eval(item.TargetUrl);
            }
        }

    </script>


    <!-- OneTrust Cookies Consent Notice start for myhcl.com -->
    <script type="text/javascript" src="https://cdn.cookielaw.org/consent/8804cb43-fad1-4f62-9bc7-710614d5c349/OtAutoBlock.js" crossorigin="anonymous"></script>
    <script src="https://cdn.cookielaw.org/scripttemplates/otSDKStub.js" type="text/javascript" charset="UTF-8" data-domain-script="8804cb43-fad1-4f62-9bc7-710614d5c349" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function OptanonWrapper() { }
    </script>
    <!-- OneTrust Cookies Consent Notice end for myhcl.com -->

<title>

</title><style type="text/css">
	.ctl00_ESSHeader1_Menu1_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.ctl00_ESSHeader1_Menu1_1 { color:White;font-family:Verdana;font-size:0.8em;text-decoration:none; }
	.ctl00_ESSHeader1_Menu1_2 { color:White;font-family:Verdana;font-size:0.8em;width:100%; }
	.ctl00_ESSHeader1_Menu1_3 {  }
	.ctl00_ESSHeader1_Menu1_4 { padding:2px 5px 2px 5px; }
	.ctl00_ESSHeader1_Menu1_5 { padding:0px 2px 0px 2px; }
	.ctl00_ESSHeader1_Menu1_6 { border-style:none; }
	.ctl00_ESSHeader1_Menu1_7 {  }
	.ctl00_ESSHeader1_Menu1_8 {  }
	.ctl00_ESSHeader1_Menu1_9 { border-style:none; }
	.ctl00_ESSHeader1_Menu1_10 {  }
	.ctl00_ESSHeader1_Menu1_11 { border-style:none; }
	.ctl00_ESSHeader1_Menu1_12 {  }
	.ctl00_ESSHeader1_Menu1_13 { border-style:none; }
	.ctl00_ESSHeader1_Menu1_14 {  }
	.ctl00_ESSHeader1_Menu1_15 { border-style:none; }
	.ctl00_ESSHeader1_Menu1_16 {  }

</style></head>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" ms_positioning="GridLayout" onload="pageLoad();" style="font-family: hcltech_roobertbold">
    <form name="aspnetForm" method="post" action="./Form16.aspx" id="aspnetForm" onclick="javascript:dateChrome();">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<script src="/ESS/WebResource.axd?d=pynGkmcFUV13He1Qd6_TZBToa3-WXL9dLlWNne1ZSP_GgkK5RK_LUGibFyJY5Z2ZFSSJlQ2&amp;t=638901734248157332" type="text/javascript"></script>

<LINK media="screen" href="HCLBrand/BrandTheme.css" type="text/css" rel="STYLESHEET">
<script src="/ESS/ScriptResource.axd?d=6qyDOaOZyslxHkxXsb2KVQUtnbZ44Rc4bImgKN7vXVY_HrM1BNfDaJIsluxPD0hjNsZsN8hwSETq_JGRSxRnwu1YYJYqEyxk89ZcocpmpA68oK9s0&amp;t=ffffffff93d1c106" type="text/javascript"></script><script type="text/javascript" src="/ig_common/20053/scripts/ig_shared.js" ></script><script type="text/javascript" src="/ig_common/20053/scripts/ig_weblistbar2_2.js" ></script>
<script type="text/javascript">
//<![CDATA[
function MenuPostBack(page)
{
	 WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00", "", false, "", page, false, true));
}
//]]>
</script>

<script src="/ESS/ScriptResource.axd?d=uHIkleVeDJf4xS50Krz-yDzz_s4Dz5nNldm0KJlAdIBa8rX2B7IeZcO5F3D2yTr8TvsFLkDlBIQJBTbX4kwkb8yI5ByjrKfw0okwEAmRIjycACP2-AhSCFSKteOLjhciE_xWHkiKzmx8gI01E9R2dbOpxCs1&amp;t=5c0e0825" type="text/javascript"></script>
<script src="/ESS/ScriptResource.axd?d=Jw6tUGWnA15YEa3ai3FadNfr2-CPl4otSp1VcHn7Q_7MUmkK3CNltrgaIpA-W4-hUN7Z6HywfOfWbZMQrjjErhvdAkGQF9GimN2Ge59C1yspVbDADjKtFEf-OYFyEX5fBOjmbfmX-CSr4jztle0Ep94DBDQ1&amp;t=5c0e0825" type="text/javascript"></script>
<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="D1DCF9D3" />
	<input type="hidden" name="__PREVIOUSPAGE" id="__PREVIOUSPAGE" value="y9Gq21QooCu90TiWxF142F_BVf87-PJS1RDYGMlAUduP3-05R40uvyMgs7XlLaMuaUkABWsTNOXaIUi6jx8a-YP6wec1" />
</div>
        <div id="divPageContent">
        </div>
        <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ScriptManager1', 'aspnetForm', [], [], [], 90, 'ctl00');
//]]>
</script>

         <input type="hidden" name="ctl00$forgeryToken" id="ctl00_forgeryToken" />
        
        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="200" class="LightBackColor2">
            <tr id="ctl00_menuMasterHeader" height="10%">
	<td colspan="2">
                    
<link href="./HCLBrand/images/masterStyle.css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
    /* function LoadDelegateWindow() 
      {
          var Success = 'false';
          var WinSettings = 'center:yes;scroll:no;resizable:no;status:no;dialogHeight:300px;dialogWidth:600px';
          var MyArgs = new Array(Success);
          var MyArgs = window.showModalDialog('Delegate.aspx', MyArgs, WinSettings);
          if (MyArgs != undefined && MyArgs == 'True') 
          {
              window.location.reload();
              return false;
          }
      }*/
    function LoadDelegateWindow() {
        var Success = 'false';
        var MyArgs = new Array(Success);
        var isChrome = /chrome/.test(navigator.userAgent.toLowerCase());
        if (!isChrome) {

            var arrRetVal;
            arrRetVal = window.showModalDialog("Delegate.aspx", null, "dialogHeight:450px;dialogWidth:620px;status=no;help:no;");
            window.location.reload();
            return false;
        }
        else {
            var a = window.open("Delegate.aspx", "MsgWindow", "width=580, height=550 ,status=yes, toolbar=no, menubar=no, location=no,addressbar=no");
            window.location.reload();
            return false;
        }
    }

</script>
<table id="Table1" width="100%" cellspacing="0" border="0" cellpadding="0" class="MediumDarkGradient">
    <tbody>
        <tr valign="top" height="50" width="100%">
            <td valign="middle" align="left"  style="padding-left: 5px" colspan="2">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tr>
                        <td colspan="2" height="50px;">
                            <img alt="logo" class="brand-logo" src="./HCLBrand/images/hclTech.svg" height="20"><strong class="ess brand-name">  Employee Self Service</strong></td>

                        <td align="right" valign="middle">
                            
                        </td>
                    </tr>

                </table>
            </td>
            <td valign="middle" align="center">

                <div id="ctl00_ESSHeader1_UpdateProgress1" style="display:none;">
		
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" class="AjaxRequest">
                                <tr>
                                    <td align="right" valign="top">
                                        <span id="ctl00_ESSHeader1_lblRequesting" class="AjaxRequest">Requesting...</span>
                                    </td>
                                    <td width="20%">&nbsp;<img src="images/progress.gif" alt="Progress" width="100" height="15" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        
	</div>
                    
<script language="Javascript" src="JS/JScript.js"></script>
<script language="Javascript">
var strdivSearchHelpName="";
function CallFn()
{
if (event.keyCode == 13)
{
if (Validate()) {
__doPostBack('ctl00$ESSHeader1$ESSSearch1$btnFind','');
return false;
}
else
{
return false;
}
}
}
function Validate() {
    //Add code to handle your event here.
    var strSearch = 'ctl00_ESSHeader1_ESSSearch1_txtSearch'
    if (TrimAll(document.all[strSearch].value) == '' || TrimAll(document.all[strSearch].value) == 'Enter Search Criteria') {
        alert("Enter search criteria");
        document.all[strSearch].value = '';
        document.all[strSearch].focus();
        return false;
    }
    else if (FindIt('%', document.all[strSearch].value)) {

        alert("% Symbol is an invalid character");
        document.all[strSearch].focus();
        return false;
    }
    else if (FindIt('\'', document.all[strSearch].value)) {
        alert("\' Symbol is a invalid character");
        document.all[strSearch].focus();
        return false;
    }
    else if (TrimAll(document.all[strSearch].value) != 'Enter Search Criteria' && document.all[strSearch].value.length < 2) {
        alert("Search criteria should not be less than 2 characters");
        document.all[strSearch].value = '';
        document.all[strSearch].focus();
        return false;
    }
    return true;
}
function ShowHelp() 
{
    try 
    {
        document.getElementById("ctl00_ESSHeader1_ESSSearch1_divSearchHelp").style.visibility = "visible";
        HideCombo();
    }
    catch(ex)
    {
    }
}
function CloseHelpDiv()
{
    try
    {
	    document.getElementById("ctl00_ESSHeader1_ESSSearch1_divSearchHelp").style.visibility = 'hidden';
	    ShowCombo();
    }
    catch(ex)
    {
    }
}
function SearchTextClicked(obj)
{
	document.getElementById("ctl00_ESSHeader1_ESSSearch1_txtSearch").value = obj.innerText;
	CloseHelpDiv();
}

    function fun1(event, a) {
        
        var Alphabet;
        //Alphabet = "^[a-zA-Z]+$";
       Alphabet = /^[A-Za-z0-9\s\=\+\-\,\.\@]+$/;  
        //A-Z or a-z Alphabets only allowed
        var x = document.getElementById(a);   
        var chCode = ('charCode' in event) ? event.charCode : event.keyCode;
        //
        var validation = true;
        if (String.fromCharCode(chCode).search(Alphabet) == -1 && event.keyCode != '8') {
            x.focus();
            alert("Please enter valid character!");
            event.keyCode = 0;
            validation = false;
        }
        return validation;
    }


//function fun1(event, a) {
//        
//        var Alphabet;
//        //Alphabet = "^[a-zA-Z]+$";
//        Alphabet = /^[A-Za-z0-9\s\=\+\-\,\.\@]+$/;  
//        //A-Z or a-z Alphabets only allowed
//        var x = document.getElementById(a);
//        var chCode = ('charCode' in event) ? event.charCode : event.keyCode;
//        //alert("The Unicode character code is: " + chCode);
//        //
//        var validation = true;
//        if (String.fromCharCode(chCode).search(Alphabet) == -1) {
//            x.focus();
//            alert("Please enter valid character!");
//            event.keyCode = 0;
//            validation = false;
//        }
//        return validation;
//    }

</script>
<!--<IMG SRC="./Images/new.gif" alt="New Feature - ESS Search">-->
<table border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <td id="test" style="padding-top: 2px;" width="22px" height="22px" valign="top" align="center"
            aonmouseover="javascript:this.className='Light1MediumGradient';this.style.cursor='hand';"
            bonmouseout="javascript:this.className='searchimg';this.style.cursor='';"
            onclick="ShowHelp()">
          
        </td>
        <td style="padding-top: 2px;">
            <span id="ctl00_ESSHeader1_ESSSearch1_lblSearch" class="ESSSearchLabel">Search: </span>
        </td>
        <td valign="top" style="padding-top: 1px;">
            <input name="ctl00$ESSHeader1$ESSSearch1$txtSearch" type="text" maxlength="25" id="ctl00_ESSHeader1_ESSSearch1_txtSearch" tabindex="1" class="ESSSearchText" onblur="if (this.value == &#39;&#39;) {this.value = &#39;Enter Search String&#39;;this.style.color = &#39;Gray&#39;;} else {this.style.color = &#39;Black&#39;;}" onfocus="if (this.value == &#39;Enter Search String&#39;) {this.value = &#39;&#39;; this.style.color = &#39;Black&#39;; this.focus();}" onKeyPress="return fun1(event,&#39;ctl00_ESSHeader1_ESSSearch1_txtSearch&#39;);" style="color:Black;width:125px;" />
        </td>
        <td valign="top" style="padding-right: 2px;">
            <input type="submit" name="ctl00$ESSHeader1$ESSSearch1$btnFind" value="Go" onclick="return Validate();" id="ctl00_ESSHeader1_ESSSearch1_btnFind" tabindex="1" class="ESSSearchButton" />
        </td>
    </tr>
</table>
<div id="ctl00_ESSHeader1_ESSSearch1_divSearchHelp" class="LightBackColor2" style="border-right: #305d9f outset; border-top: #305d9f outset; z-index: 1001; left: 300px; visibility: hidden; border-left: #305d9f outset; width: 505px; border-bottom: #305d9f outset; position: absolute; top: 75px; height: 430px;">
    

<script language="Javascript" src="JS/JScript.js"></script>
<script language="javascript" for="document" event="onkeypress">
<!--
	if (event.keyCode==27)
		CloseHelpDiv();
//-->
</script>
<script language="javascript">
<!--
function Highlight(obj)
{
    obj.className = "ESSSearchHelpHeaderHover";
}
function NoHighlight(obj)
{
    obj.className = "ESSSearchHelpHeader";
}
function HighlightFields(obj)
{
    obj.className = "ESSSearchHelpDetailHover";
}
function NoHighlightFields(obj)
{
    obj.className = "ESSSearchHelpDetail";
}
//Function to hide the combo when search help div is opened.
function HideCombo()
{
	var tagElements;
    tagElements = document.getElementsByTagName('SELECT');
    for (var k = 0 ; k < tagElements.length; k++) 
		{
          tagElements[k].style.visibility = 'hidden';
        }
}
//Function to show the combo when search help div is closed.
function ShowCombo()
{
	var tagElements;
    tagElements = document.getElementsByTagName('SELECT');
    for (var k = 0 ; k < tagElements.length; k++) 
		{
          tagElements[k].style.visibility = '';
        }
}

//-->
</script>
<table width="100%" class="LightBackColor2">
<tr><td width="99%">

<table border="0" cellpadding="0" cellspacing="0" width="100%" class="LightBackColor2">
    <tr>
        <td id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_PageTitle1_tdPageTitle" align="center" class="PageTitle">ESS Search Help</td>
	
    </tr>
</table>

</td><td>
<img width="12px" height="12px" src="Images/DELETE.jpg" alt="Close" onclick="javascript:CloseHelpDiv();">
</td></tr></table>
<div id="divHelp" style="OVERFLOW: auto;height:400px">
<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp" cellspacing="0" border="0" style="width:97%;border-collapse:collapse;">
		<tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl00_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl00_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl00_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl01_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl01_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl01_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl02_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl02_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl02_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl03_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl03_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl03_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl04_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl04_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl04_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl05_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl05_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl05_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl06_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl06_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl06_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl07_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl07_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl07_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl08_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl08_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl08_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl09_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl09_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl09_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl10_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl10_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl10_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl11_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl11_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl11_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl12_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl12_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl12_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl13_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl13_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl13_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl14_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl14_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl14_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl15_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl15_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl15_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl16_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl16_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl16_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr><tr>
			<td>
			<table id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl17_tblOverview" width="100%">
				<tr>
					<td align="left" class="ESSSearchHelpHeader">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl17_divSubType">
						</div>
					</td>
				</tr>
				<tr>
					<td align="left" class="ESSSearchHelpDetail">
						<div id="ctl00_ESSHeader1_ESSSearch1_ESSSearchHelp1_dlESSSearchHelp_ctl17_divSearchFields">
						</div>
					</td>
				</tr>
			</table>
			
			<table width="100%">
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</td>
		</tr>
	</table></div>

</div>

                
                

            </td>
        </tr>
        <tr width="100%" height="30">
            <td class="date mainDate"><span id="ctl00_ESSHeader1_LblDate" class="CurrentDate" style="display:inline-block;width:200px;">Wednesday, May 20, 2026</span></td>
    <td width="73%">
      <table border="0" cellpadding="1" cellspacing="0" class="date" style="table-layout: fixed; width: 100%; text-align: left;">
      <tbody>
        <tr class="headerData">
        <td><span class="firstCall">Person ID:</span> <span class="lastCall"><span id="ctl00_ESSHeader1_lblEmpCode" class="ESSHeader">52283767</span></span></td>
        <td><span class="firstCall">Name:</span> <span class="lastCall"><span id="ctl00_ESSHeader1_LblEmpName" class="ESSHeader">Sandeep Garg</span></span></td>
        <td><span class="firstCall">Employment ID:</span> <span class="lastCall"><span id="ctl00_ESSHeader1_lblCountrySpecficID" class="ESSHeader">52283767</span></span></td>
      </tr>
    </tbody>
  </table>
</td>

            <td valign="top" width="30%" align="right" class="ESSlink" style="padding-right: 2px;">
               
     <a href="#ctl00_ESSHeader1_Menu1_SkipLink"><img alt="Skip Navigation Links" src="/ESS/WebResource.axd?d=rKN1opQVoh180LaGjXZZkKweAodN9hM-Wb2AZJWS88-1SKwc4Tk4PL_gN-4gDrRXSDr5vw2&amp;t=638901734248157332" width="0" height="0" style="border-width:0px;" /></a><table id="ctl00_ESSHeader1_Menu1" class="MediumBackColor StaticMenu ctl00_ESSHeader1_Menu1_5 ctl00_ESSHeader1_Menu1_2" cellpadding="0" cellspacing="0" border="0" style="background-color: #3C91FF;">
		<tr>
			<td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Help" id="ctl00_ESSHeader1_Menu1n0"><table class="ctl00_ESSHeader1_Menu1_4" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;"><a class="ctl00_ESSHeader1_Menu1_1 ctl00_ESSHeader1_Menu1_3" href="#" style="cursor:text;">Help</a></td><td style="width:0;"><img src="/ESS/WebResource.axd?d=YAYach_zykzn7tRotFpEUm_UU7wgFlT4oS88ffzr5mefMPhzrCVJP4g67SZRiIPKfOAvyQJlJkz06BD13GKBNHBICqY1&amp;t=638901734248157332" alt="Expand Help" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="ESS Home" id="ctl00_ESSHeader1_Menu1n1"><table class="ctl00_ESSHeader1_Menu1_4" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;"><a class="ctl00_ESSHeader1_Menu1_1 ctl00_ESSHeader1_Menu1_3" href="/ESS/esshome.aspx">ESS Home</a></td>
				</tr>
			</table></td><td style="width:3px;"></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="MyHCLTech" id="ctl00_ESSHeader1_Menu1n2"><table class="ctl00_ESSHeader1_Menu1_4" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;"><a class="ctl00_ESSHeader1_Menu1_1 ctl00_ESSHeader1_Menu1_3" href="#" style="cursor:text;">MyHCLTech</a></td><td style="width:0;"><img src="/ESS/WebResource.axd?d=YAYach_zykzn7tRotFpEUm_UU7wgFlT4oS88ffzr5mefMPhzrCVJP4g67SZRiIPKfOAvyQJlJkz06BD13GKBNHBICqY1&amp;t=638901734248157332" alt="Expand MyHCLTech" style="border-style:none;vertical-align:middle;" /></td>
				</tr>
			</table></td><td onmouseover="Menu_HoverStatic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="Logout" id="ctl00_ESSHeader1_Menu1n3"><table class="ctl00_ESSHeader1_Menu1_4" cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td style="white-space:nowrap;"><a class="ctl00_ESSHeader1_Menu1_1 ctl00_ESSHeader1_Menu1_3" href="javascript:ShowDataConfirmationPage(&#39;LOGOUT&#39;);">Logout</a></td>
				</tr>
			</table></td>
		</tr>
	</table><div id="ctl00_ESSHeader1_Menu1n0Items" class="ctl00_ESSHeader1_Menu1_0 DynamicMenu ctl00_ESSHeader1_Menu1_8">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="About ESS" id="ctl00_ESSHeader1_Menu1n4">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="/ESS/About.aspx" style="border-style:none;font-size:1em;">About</a></td>
					</tr>
				</table></td>
			</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="FAQHCLT" id="ctl00_ESSHeader1_Menu1n5">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="/ESS/XMLFiles/ESS-FAQs.pdf" style="border-style:none;font-size:1em;">FAQ</a></td>
					</tr>
				</table></td>
			</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="PPTHCLT" id="ctl00_ESSHeader1_Menu1n6">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="/ESS/XMLFiles/ESS.pdf" style="border-style:none;font-size:1em;">PPT</a></td>
					</tr>
				</table></td>
			</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="User Document HCLT" id="ctl00_ESSHeader1_Menu1n7">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="/ESS/XMLFiles/ESS%20User%20Guide.pdf" style="border-style:none;font-size:1em;">User Document</a></td>
					</tr>
				</table></td>
			</tr>
		</table><div class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7 ctl00_ESSHeader1_Menu1_0" id="ctl00_ESSHeader1_Menu1n0ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
			<img src="/ESS/WebResource.axd?d=flfovlppGN8ii6uRlKVZOuiy2xG3g5QUUqpmgc7ukhGhMeO2bXRA2aIw7IEwRzxWmEMTFBJvbDcgIrZKtU83JrJ8h6k1&amp;t=638901734248157332" alt="Scroll up" />
		</div><div class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7 ctl00_ESSHeader1_Menu1_0" id="ctl00_ESSHeader1_Menu1n0ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
			<img src="/ESS/WebResource.axd?d=q5MZef8MLXrgpV2VtG7gXTXTP2qvBLrge7KSZ9EP91SVKTGe3FVSiX2IQzIN-l1alSpUYPXbWBAsmELjmQsxlPi5cvg1&amp;t=638901734248157332" alt="Scroll down" />
		</div>
	</div><div id="ctl00_ESSHeader1_Menu1n2Items" class="ctl00_ESSHeader1_Menu1_0 DynamicMenu ctl00_ESSHeader1_Menu1_8">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="MyHCLTech" id="ctl00_ESSHeader1_Menu1n8">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="javascript:ShowDataConfirmationPage(&#39;MYHCL&#39;);" style="border-style:none;font-size:1em;">MyHCLTech</a></td>
					</tr>
				</table></td>
			</tr><tr onmouseover="Menu_HoverDynamic(this)" onmouseout="Menu_Unhover(this)" onkeyup="Menu_Key(this)" title="SSD" id="ctl00_ESSHeader1_Menu1n9">
				<td><table class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7" cellpadding="0" cellspacing="0" border="0" width="100%">
					<tr>
						<td style="white-space:nowrap;width:100%;"><a class="ctl00_ESSHeader1_Menu1_1 DynamicMenuItem ctl00_ESSHeader1_Menu1_6" href="javascript:ShowDataConfirmationPage(&#39;SSD&#39;);" style="border-style:none;font-size:1em;">SSD</a></td>
					</tr>
				</table></td>
			</tr>
		</table><div class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7 ctl00_ESSHeader1_Menu1_0" id="ctl00_ESSHeader1_Menu1n2ItemsUp" onmouseover="PopOut_Up(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
			<img src="/ESS/WebResource.axd?d=flfovlppGN8ii6uRlKVZOuiy2xG3g5QUUqpmgc7ukhGhMeO2bXRA2aIw7IEwRzxWmEMTFBJvbDcgIrZKtU83JrJ8h6k1&amp;t=638901734248157332" alt="Scroll up" />
		</div><div class="DynamicMenuItem ctl00_ESSHeader1_Menu1_7 ctl00_ESSHeader1_Menu1_0" id="ctl00_ESSHeader1_Menu1n2ItemsDn" onmouseover="PopOut_Down(this)" onmouseout="PopOut_Stop(this)" style="text-align:center;">
			<img src="/ESS/WebResource.axd?d=q5MZef8MLXrgpV2VtG7gXTXTP2qvBLrge7KSZ9EP91SVKTGe3FVSiX2IQzIN-l1alSpUYPXbWBAsmELjmQsxlPi5cvg1&amp;t=638901734248157332" alt="Scroll down" />
		</div>
	</div><a id="ctl00_ESSHeader1_Menu1_SkipLink"></a>		
            </td>
        </tr>
    </tbody>
</table>

                </td>
</tr>

            <tr height="90%">
                <td id="ctl00_menuMasterBody" valign="top" style="border-width: 1.5px; border-color: rgb(169, 142, 244); border-style: solid;">
                    
<style type="text/css">
.UltraWebListbar1defItem{}
.UltraWebListbar1selItem{}
.UltraWebListbar1hovItem{}
.UltraWebListbar1defGroup{}
.UltraWebListbar1selGroup{}
.UltraWebListbar1hovGroup{}
.UltraWebListbar1grp{ height:300px;}
</style>
<input type="hidden" name="ctl00$UltraWebListbar1_hidden" id="ctl00$UltraWebListbar1_hidden" /><table cellpadding=0 cellspacing=0  width="100%" id="UltraWebListbar1" style="border-style:Solid;border-width:1px; width:100%; height:200px;" >
	<tr style="width:100%;height:100%;">
		<td Cellpadding=0 CellSpacing=0 width='100%' height='100%'>
			<table style='width:100%;height:100%;' cellpadding=0 cellspacing=0>
				<tr style="width:100%;height:100%">
					<td style="width:100%;height:100%">
						<table border="0" width="100%" height="100%" cellspacing=0 cellpadding=0>
							<tr valign="top">
								<td style="width:100%;" valign="top">
									<table border="0" style="width:100%" cellpadding=0 cellspacing=0>
											<tr style="display:'';" id="UltraWebListbar1_Group_0_top_tr">
											<td id="UltraWebListbar1_Group_0_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonSelectedStyle" align="Left">
											<div id="UltraWebListbar1_Group_0_text_top"   >
											My Information – Personal
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_1_top_tr">
											<td id="UltraWebListbar1_Group_1_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_1_text_top"   >
											My Information – Employment
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_2_top_tr">
											<td id="UltraWebListbar1_Group_2_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_2_text_top"   >
											My Information – Account
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_3_top_tr">
											<td id="UltraWebListbar1_Group_3_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_3_text_top"   >
											My Information – Savings
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_4_top_tr">
											<td id="UltraWebListbar1_Group_4_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_4_text_top"   >
											Status
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_5_top_tr">
											<td id="UltraWebListbar1_Group_5_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_5_text_top"   >
											Reports
											</div>
											</td></tr>
											<tr style="display:none;" id="UltraWebListbar1_Group_6_top_tr">
											<td id="UltraWebListbar1_Group_6_top"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_6_text_top"   >
											Exit
											</div>
											</td></tr>
									</table>
								</td>
							</tr>
							<tr valign="top" >
								<td height="300px">
									<table style="height:100%; width:100%" cellspacing=0 cellpadding=0>
										<tr style="height:100%" valign="top">
											<td style="height:100%" >
												<table id='UltraWebListbar1_Items' class=DefaultGroupStyle style=" height:300px;;height:100%;width:100%;" cellspacing=0 cellpadding=0>
													<tr style="height:100%" valign="top">
														<td style="height:100%">
															<div  style='overflow:auto;width:100%;height:100%;display: "";' id="UltraWebListbar1_Items_0" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_0">
<div>Personal Data</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_1">
<div>Profile Picture</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_2">
<div>Additional Personal Data</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_3">
<div>Address</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_4">
<div>Education</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_5">
<div>Previous Employer</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_6">
<div>Communication</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_7">
<div>Family Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_8">
<div>ID Card Request</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_9">
<div>Passport Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_10">
<div>Visa Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_11">
<div>Benefit Box – Family Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_12">
<div>DOB Update</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_13">
<div>My PaySlip</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_14">
<div>Form 16</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_15">
<div>PF Statement</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_16">
<div>VPF Start/Change/Stop</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_17">
<div>Declaration of Relatives</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_0_Item_18">
<div>Nominees Declaration for Terminal Benefits</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_1" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_0">
<div>Organization Assignment</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_1">
<div>Travel Plan</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_2">
<div>Work Manager</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_3">
<div>DOJ and Work Experience</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_4">
<div>Current Working Location</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_1_Item_5">
<div>Appraiser</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_2" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_2_Item_0">
<div>Account</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_2_Item_1">
<div>Bank Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_2_Item_2">
<div>PAN</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_2_Item_3">
<div>Aadhar Details</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_2_Item_4">
<div>UAN</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_3" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_3_Item_0">
<div>Savings</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_4" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_4_Item_0">
<div>Submitted Request</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_4_Item_1">
<div>Archive Request</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_5" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_5_Item_0">
<div>PIF</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_5_Item_1">
<div>Car Scheme Form 60/BH Registration</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_5_Item_2">
<div>Employee Verification Letter</div>															</div>
															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_5_Item_3">
<div>Employment/Address proof</div>															</div>
															</div>
															<div  style='overflow:auto;width:100%;height:100%;display:none;' id="UltraWebListbar1_Items_6" >															<div width="100%" class=DefaultItemStyle															 align="left" 
															 id="UltraWebListbar1_6_Item_0">
<div>Logout</div>															</div>
															</div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr id="UltraWebListbar1_BotGroup" style="display:''" valign="bottom">
								<td style="width:100%" valign="bottom">
									<table border="0" style="width:100%;" cellpadding=0 cellspacing=0>
											<tr style="display:none;" id="UltraWebListbar1_Group_0_bottom_tr">
											<td id="UltraWebListbar1_Group_0_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_0_text_bottom"   >
											My Information – Personal
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_1_bottom_tr">
											<td id="UltraWebListbar1_Group_1_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_1_text_bottom"   >
											My Information – Employment
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_2_bottom_tr">
											<td id="UltraWebListbar1_Group_2_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_2_text_bottom"   >
											My Information – Account
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_3_bottom_tr">
											<td id="UltraWebListbar1_Group_3_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_3_text_bottom"   >
											My Information – Savings
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_4_bottom_tr">
											<td id="UltraWebListbar1_Group_4_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_4_text_bottom"   >
											Status
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_5_bottom_tr">
											<td id="UltraWebListbar1_Group_5_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_5_text_bottom"   >
											Reports
											</div>
											</td></tr>
											<tr style="display:'';" id="UltraWebListbar1_Group_6_bottom_tr">
											<td id="UltraWebListbar1_Group_6_bottom"
											style="height:;width:100%;"
 class="DefaultGroupButtonStyle" align="Left">
											<div id="UltraWebListbar1_Group_6_text_bottom"   >
											Exit
											</div>
											</td></tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			</tr>
		</table>
		<script type="text/javascript"> <!--
			var UltraWebListbar1UniqueID="ctl00$UltraWebListbar1";
			UltraWebListbar1_propsArray=["100%",0,"0i-1",0,true,false,];
			UltraWebListbar1_groupsArray=[new iglbar_ListbarGroup("UltraWebListbar1_Group_0","My Information – Personal","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_0_Item_0","Personal Data","0002","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_1","Profile Picture","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('ProfilePhoto.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_2","Additional Personal Data","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_3","Address","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_4","Education","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_5","Previous Employer","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_6","Communication","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_7","Family Details","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_8","ID Card Request","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('IDCardDetails_new.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_9","Passport Details","D6","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_10","Visa Details","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_11","Benefit Box – Family Details","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Healthcaredeclaration.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_12","DOB Update","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('DOBUpdate.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_13","My PaySlip","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('MyPaySlip.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_14","Form 16","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Form16.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_15","PF Statement","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('myPFStatement.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_16","VPF Start/Change/Stop","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('VPFEmployee.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_17","Declaration of Relatives","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('RelativesDec.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_0_Item_18","Nominees Declaration for Terminal Benefits","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('NomineeTermBenefit.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_1","My Information – Employment","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_1_Item_0","Organization Assignment","0001_HCLT","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_1_Item_1","Travel Plan","0017","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_1_Item_2","Work Manager","RM_INFRA","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_1_Item_3","DOJ and Work Experience","0019_EMPIN","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_1_Item_4","Current Working Location","CWL","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_1_Item_5","Appraiser","DM_ADARNEW","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_2","My Information – Account","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_2_Item_0","Account","ACCOUNT","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_2_Item_1","Bank Details","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_2_Item_2","PAN","D4","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_2_Item_3","Aadhar Details","D4D9","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_2_Item_4","UAN","D4D9_UAN","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('Infotype.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_3","My Information – Savings","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_3_Item_0","Savings","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('SavingInfo.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_4","Status","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_4_Item_0","Submitted Request","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_4_Item_1","Archive Request","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('OverView.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_5","Reports","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_5_Item_0","PIF","D3","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","JavaScript:OpenPIF()","self","","",true),new iglbar_Item("UltraWebListbar1_5_Item_1","Car Scheme Form 60/BH Registration","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('IndiaBenefit.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_5_Item_2","Employee Verification Letter","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('EMPEVLRequestOverview.aspx');","self","","",true),new iglbar_Item("UltraWebListbar1_5_Item_3","Employment/Address proof","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","javascript:MenuPostBack('AddressProof.aspx');","self","","",true)])
,new iglbar_ListbarGroup("UltraWebListbar1_Group_6","Exit","",true,"DefaultGroupStyle","DefaultGroupButtonStyle","DefaultGroupButtonHoverStyle","DefaultGroupButtonSelectedStyle",1,1,"","UltraWebListbar1_InnerFrame",[new iglbar_Item("UltraWebListbar1_6_Item_0","Logout","STATICPAGE","DefaultItemStyle","DefaultItemHoverStyle","DefaultItemSelectedStyle","JavaScript:ShowDataConfirmationPage(\'LOGOUT\')","self","","",true)])
];
			UltraWebListbar1_eventArray=[
["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false],["",false]];
			var UltraWebListbar1_obj=null;
			UltraWebListbar1_obj=iglbar_getListbarById("UltraWebListbar1");
		--> 
</script>

                </td>

                <td width="80%" valign="top">
                    
                    
    <table width="100%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td class="PageTitle" align="center">FORM 16 DOWNLOAD</td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <span id="ctl00_cphPage_lblGenericMsg" class="StatusLabel">Note:- For any clarification regarding your Form 16 please open ticket under USP-->ES - Taxation process - Form 16 in the category <font size="2px"><i>Form16 Queries.</i></font></span>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <table>
                    <tr>
                        <td valign="top" align="left" class="ESSLabel">
                            <span id="ctl00_cphPage_Label2">Financial Year :</span>
                            &nbsp;
                        </td>
                        <td valign="top" align="left">
                            <select name="ctl00$cphPage$ddlYear" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$cphPage$ddlYear\&#39;,\&#39;\&#39;)&#39;, 0)" id="ctl00_cphPage_ddlYear" class="select-control" style="width:150px;">
	<option selected="selected" value="2024">2024-2025</option>

</select>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <span id="ctl00_cphPage_lblErrMsg" class="StatusLabel"></span>
            </td>
        </tr>
        <tr>
            <td>
                <div>
	<table class="GridFrame" cellspacing="0" rules="all" border="1" id="ctl00_cphPage_gvForm16" style="width:100%;border-collapse:collapse;">
		<tr class="GridHeader" align="center" valign="top">
			<th scope="col">Employee Code</th><th scope="col">Company</th><th scope="col">Form 16 Part B<br> (downloaded from TRACES)</th><th scope="col">Form 16 Annexure</th><th scope="col">Form16 PartA<br>(downloaded from TRACES)</th>
		</tr><tr class="GridRow" align="center">
			<td>52283767</td><td>HCL Technologies Ltd.</td><td>
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnGForm16" value="Download" id="ctl00_cphPage_gvForm16_ctl02_btnGForm16" style="width:100px;" />
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnGForm16vw" value="View" onclick="return NewWindow();" id="ctl00_cphPage_gvForm16_ctl02_btnGForm16vw" style="width:100px;" />
                                
                                
                                <input type="hidden" name="ctl00$cphPage$gvForm16$ctl02$hdnF16Flag" id="ctl00_cphPage_gvForm16_ctl02_hdnF16Flag" value="A" />
                                
                            </td><td>
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnAnnx" value="Download" id="ctl00_cphPage_gvForm16_ctl02_btnAnnx" style="width:100px;" />
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnAnnxvw" value="View" onclick="return NewWindow();" id="ctl00_cphPage_gvForm16_ctl02_btnAnnxvw" style="width:100px;" />
                                <input type="hidden" name="ctl00$cphPage$gvForm16$ctl02$hdnAnnxFlag" id="ctl00_cphPage_gvForm16_ctl02_hdnAnnxFlag" value="A" />
                            </td><td>
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnForm12BA" value="Download" id="ctl00_cphPage_gvForm16_ctl02_btnForm12BA" style="width:100px;" />
                                <input type="submit" name="ctl00$cphPage$gvForm16$ctl02$btnForm12BAvw" value="View" onclick="return NewWindow();" id="ctl00_cphPage_gvForm16_ctl02_btnForm12BAvw" style="width:100px;" />
                                <input type="hidden" name="ctl00$cphPage$gvForm16$ctl02$hdn12BAFlag" id="ctl00_cphPage_gvForm16_ctl02_hdn12BAFlag" value="A" />
                            </td>
		</tr><tr class="GridHeader" style="height:5px;">
			<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
		</tr>
	</table>
</div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <a href="javascript:ShowHelpDoc()"><font bold="true"><i>Click here to view Form 16 Instructions</i></font></a>
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td>
                
            </td>
        </tr>
        <tr>
            <td align="left">
                <span id="ctl00_cphPage_Label3" class="StatusLabel"><br/><br/>  Note:- Login to ESS from Your personal devices to download the form 16 to your personal device.</span>
            </td>
        </tr>
        <tr>
            <td align="left">
                
            </td>
        </tr>
        <tr>
            <td class="ESSField">
                <p>You may wish to use Tax Spanner platform as this platform is made available to you (India based employees) on voluntary basis to ease your efforts in filling your IT Returns for previous Financial Year. By using Tax spanner platform your personal details such as Name, PAN, Your Gross salary, Exemptions, Deductions and TDS will be transferred to Tax Spanner. HCLTech will not receive any processed data from Tax Spanner whatsoever. By clicking and using Tax spanner platform from here, you agree and consent to using services of Tax spanner for filing your IT Returns and to the transfer of your personal details to Tax spanner. Please note that for all details (including your personal details) collected by Tax Spanner on Tax Spanner platform, Privacy policy of Tax Spanner shall apply.     </p>
                <p>To the extent not prohibited by law, under no circumstances shall HCLTech or any of its subsidiaries be liable to you or any other third parties, claiming through you, for any loss or damage arising directly or indirectly from your use of or inability to use the Tax Spanner platform. Employee need to bear professional charges if any levied by Tax Spanner for filing Income Tax return.</p>
            </td>
        </tr>

        <tr>
            <td>
                <input type="submit" name="ctl00$cphPage$BtnSubmit" value="Submit" onclick="return Confirm_Submit();" id="ctl00_cphPage_BtnSubmit" class="btn btn-primary" />
            </td>
        </tr>
    </table>

    <div id="infoModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); z-index: 1000;">

        <div>

            <div style="background: White; margin: 10% auto; padding: 20px; border-radius: 10px; width: 60%; position: relative; text-align: left; overflow: auto; font-family: hcltech_roobertregular; font-weight: normal !important;height:350px;">

                <span onclick="closePopup()" style="position: absolute; top: 10px; right: 20px; font-size: 18px; cursor: pointer;">&times;</span>

                <div style="white-space: pre-line;" id="popupText" class="ESSLabel">
                    <strong><u>Form 16 Download details &amp; Support Information</u></strong><br />
                    <div style="text-align: center; &quot;">
                        <span style="color: red;"><strong>Note:</strong> In order to download Form 16 directly in your personal device, please login to MYHCLTECH and then search ESS for downloading Form 16.
                        </span>
                    </div>
                    <strong>Accessing Form 16 (Part A, Part B &amp; Annexure):</strong><br />
                    <strong>Exited employees</strong> can access and download Form 16 through the <strong>Ioffboarding portal.</strong><br />

                    Note: Name and address appearing in Part-A is as per your records with Income Tax Department. For any discrepancy, you need to get it rectified directly from Income Tax (IT) Department.<br />
                    <div style="text-align: center; &quot;">
                        <a href="javascript:ShowHelpDoc()" style="color: blue; font-weight: bold; text-decoration: underline;">Click here to view Form 16 Instructions
                        </a>
                    </div>
                    <br />
                    <span style="color: red;">For questions regarding Form 16, submit a ticket under: <strong>USP → ES - Taxation Process → Form 16</strong> and choose the subcategory:<strong>Non-Technical.</strong>
                    </span>

                </div>

            </div>

        </div>

    </div>

                </td>
            </tr>
            <!--            <tr>
            <td align="right" valign="bottom"><span id="ctl00_lblSiteOptimized" class="SiteOptimized" style="display:inline-block;width:250px;">Site optimized for Internet Explorer 6.0 & Above</span></td>
            </tr>-->
        </table>

        
        <input type="hidden" name="ctl00$UserEmailId" id="ctl00_UserEmailId" value="SANDEEP.GARG@HCL.COM" />

    

<script type="text/javascript">
//<![CDATA[
javascript:ShowInfoMsg();strMyHCLPage='https://myhcltech.com';
strMyHCLMyPage='https://myhcltech.com';
strMyHCLSSDPage='https://unifiedplatform.myhcl.com';
strLogoutPage='https://wf6.myhcl.com/ess/appClose.htm';
var ctl00_ESSHeader1_Menu1_Data = new Object();
ctl00_ESSHeader1_Menu1_Data.disappearAfter = 500;
ctl00_ESSHeader1_Menu1_Data.horizontalOffset = 0;
ctl00_ESSHeader1_Menu1_Data.verticalOffset = 0;
ctl00_ESSHeader1_Menu1_Data.hoverClass = 'ctl00_ESSHeader1_Menu1_16 DynamicMenuHover';
ctl00_ESSHeader1_Menu1_Data.hoverHyperLinkClass = 'ctl00_ESSHeader1_Menu1_15 DynamicMenuHover';
ctl00_ESSHeader1_Menu1_Data.staticHoverClass = 'ctl00_ESSHeader1_Menu1_14 StaticMenuHover';
ctl00_ESSHeader1_Menu1_Data.staticHoverHyperLinkClass = 'ctl00_ESSHeader1_Menu1_13 StaticMenuHover';
ctl00_ESSHeader1_Menu1_Data.iframeUrl = '/ESS/WebResource.axd?d=beToSAE3vdsL1QUQUxjWdZ2BYbF-ieCdow197KOtJB9bmfRa9DCfGdU0bhYcm6sUHglpng2&t=638901734248157332';
Sys.Application.add_init(function() {
    $create(Sys.UI._UpdateProgress, {"associatedUpdatePanelId":null,"displayAfter":1,"dynamicLayout":true}, null, null, $get("ctl00_ESSHeader1_UpdateProgress1"));
});
//]]>
</script>
</form>
       <footer class="ds-hd-footer ds-hd-bg-gradient">
  <p>Best viewed on the latest versions of MS Edge, Chrome or Safari.</p>
  <div class="hcl-brand-logo"><img src="HCLBrand/images/hcl.svg" alt="" class=""> </div>
 
</footer>
</body>
</html>
<script language="javascript" type="text/javascript">  
    function OpenSmartSurveyForm() {

        var someSession = 'E3';
        var companycode = '1000';
        //        alert(someSession);
        //              alert (companycode);

        if (someSession.trim() != 'TP' && someSession.trim() != 'SP' && someSession.trim() != 'CR' && someSession.trim() != 'AT' && someSession.trim() != 'CT' && someSession.trim() != 'RE' && someSession.trim() != 'MS' && someSession.trim() != 'C7') {
            var WinSettings = 'center:yes;scroll:no;resizable:no;status:no;dialogHeight:300px;dialogWidth:370px';
            window.showModalDialog('ESSPopUpSmartSurvey.aspx', '', WinSettings);
        }



    }







</script>
<script id="f5_cspm">(function(){var f5_cspm={f5_p:'LGCNBGNIJENNHKKBMBFKFAANGAGMNJADNOFIPFPLFNJKBCJJMFBLGOOFDKBLECDDMLKBCBOPDAANKEBBGILAJIKEAKIBGKNMOMLPIKIGCCCPHKGOLAJMHKDEPCIGIHFI',setCharAt:function(str,index,chr){if(index>str.length-1)return str;return str.substr(0,index)+chr+str.substr(index+1);},get_byte:function(str,i){var s=(i/16)|0;i=(i&15);s=s*32;return((str.charCodeAt(i+16+s)-65)<<4)|(str.charCodeAt(i+s)-65);},set_byte:function(str,i,b){var s=(i/16)|0;i=(i&15);s=s*32;str=f5_cspm.setCharAt(str,(i+16+s),String.fromCharCode((b>>4)+65));str=f5_cspm.setCharAt(str,(i+s),String.fromCharCode((b&15)+65));return str;},set_latency:function(str,latency){latency=latency&0xffff;str=f5_cspm.set_byte(str,40,(latency>>8));str=f5_cspm.set_byte(str,41,(latency&0xff));str=f5_cspm.set_byte(str,35,2);return str;},wait_perf_data:function(){try{var wp=window.performance.timing;if(wp.loadEventEnd>0){var res=wp.loadEventEnd-wp.navigationStart;if(res<60001){var cookie_val=f5_cspm.set_latency(f5_cspm.f5_p,res);window.document.cookie='f5avr1609615543aaaaaaaaaaaaaaaa_cspm_='+encodeURIComponent(cookie_val)+';path=/;'+'';}
return;}}
catch(err){return;}
setTimeout(f5_cspm.wait_perf_data,100);return;},go:function(){var chunk=window.document.cookie.split(/\s*;\s*/);for(var i=0;i<chunk.length;++i){var pair=chunk[i].split(/\s*=\s*/);if(pair[0]=='f5_cspm'&&pair[1]=='1234')
{var d=new Date();d.setTime(d.getTime()-1000);window.document.cookie='f5_cspm=;expires='+d.toUTCString()+';path=/;'+';';setTimeout(f5_cspm.wait_perf_data,100);}}}}
f5_cspm.go();}());</script>