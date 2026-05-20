

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
<script id="f5_cspm">(function(){var f5_cspm={f5_p:'LDCMLCEAFLIBOGHHPBLKJLEODGJDKEMGPEECIINNPDFJMFPLAAEJNIKDPLLJIHNJPCOBBEPHDAJIMKOCOILAOPIDAKEFCJKNEJFOLEHKAIFAACHGIAEENOBFGHGNLFMI',setCharAt:function(str,index,chr){if(index>str.length-1)return str;return str.substr(0,index)+chr+str.substr(index+1);},get_byte:function(str,i){var s=(i/16)|0;i=(i&15);s=s*32;return((str.charCodeAt(i+16+s)-65)<<4)|(str.charCodeAt(i+s)-65);},set_byte:function(str,i,b){var s=(i/16)|0;i=(i&15);s=s*32;str=f5_cspm.setCharAt(str,(i+16+s),String.fromCharCode((b>>4)+65));str=f5_cspm.setCharAt(str,(i+s),String.fromCharCode((b&15)+65));return str;},set_latency:function(str,latency){latency=latency&0xffff;str=f5_cspm.set_byte(str,40,(latency>>8));str=f5_cspm.set_byte(str,41,(latency&0xff));str=f5_cspm.set_byte(str,35,2);return str;},wait_perf_data:function(){try{var wp=window.performance.timing;if(wp.loadEventEnd>0){var res=wp.loadEventEnd-wp.navigationStart;if(res<60001){var cookie_val=f5_cspm.set_latency(f5_cspm.f5_p,res);window.document.cookie='f5avr1609615543aaaaaaaaaaaaaaaa_cspm_='+encodeURIComponent(cookie_val)+';path=/;'+'';}
return;}}
catch(err){return;}
setTimeout(f5_cspm.wait_perf_data,100);return;},go:function(){var chunk=window.document.cookie.split(/\s*;\s*/);for(var i=0;i<chunk.length;++i){var pair=chunk[i].split(/\s*=\s*/);if(pair[0]=='f5_cspm'&&pair[1]=='1234')
{var d=new Date();d.setTime(d.getTime()-1000);window.document.cookie='f5_cspm=;expires='+d.toUTCString()+';path=/;'+';';setTimeout(f5_cspm.wait_perf_data,100);}}}}
f5_cspm.go();}());</script>