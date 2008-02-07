<script language="JavaScript" type="text/javascript">
function ChangeTextSize (element,changeby) {
	document.getElementById(element).rows = parseInt(document.getElementById(element).rows)+parseInt(changeby);
}
function ChangeTextSizeW(element,changeby) {
	document.getElementById(element).cols = parseInt(document.getElementById(element).cols)+parseInt(changeby);
}
function js_BuildRequest(Task, container, ItemID) {
	var sPostString = "";
	sPostString += "Task=" + Task + "&";
    if (Task == "Save" || Task == "Add") {
      document.getElementById(container).innerHTML = "";
      sPostString += "QuestionID=" + document.getElementById("QuestionID").value + "&";
      sPostString += "Question=" + encodeURI(document.getElementById("Question").value.replace("&","and")) + "&";
      if (document.getElementById("LO").checked == true) {
        sPostString += "LO=" + document.getElementById("LO").value + "&";
      } else {
        sPostString += "LO=" + "" + "&";
      }
      if (document.getElementById("BR").checked == true) {
        sPostString += "BR=" + document.getElementById("BR").value + "&";
      } else {
        sPostString += "BR=" + "" + "&";
      }
      if (document.getElementById("PR").checked == true) {
        sPostString += "PR=" + document.getElementById("PR").value + "&";
      } else {
        sPostString += "PR=" + "" + "&";
      }
      if (document.getElementById("UW").checked == true) {
        sPostString += "UW=" + document.getElementById("UW").value + "&";
      } else {
        sPostString += "UW=" + "" + "&";
      }
      if (document.getElementById("SM").checked == true) {
        sPostString += "SM=" + document.getElementById("SM").value + "&";
      } else {
        sPostString += "SM=" + "" + "&";
      }
      if (document.getElementById("CR").checked == true) {
        sPostString += "CR=" + document.getElementById("CR").value + "&";
      } else {
        sPostString += "CR=" + "" + "&";
      }
      if (document.getElementById("FD").checked == true) {
        sPostString += "FD=" + document.getElementById("FD").value + "&";
      } else {
        sPostString += "FD=" + "" + "&";
      }
      if (document.getElementById("ST").checked == true) {
        sPostString += "ST=" + document.getElementById("ST").value + "&";
      } else {
        sPostString += "ST=" + "" + "&";
      }
      if (document.getElementById("CI").checked == true) {
        sPostString += "CI=" + document.getElementById("CI").value + "&";
      } else {
        sPostString += "CI=" + "" + "&";
      }
      if (document.getElementById("NI").checked == true) {
        sPostString += "NI=" + document.getElementById("NI").value + "&";
      } else {
        sPostString += "NI=" + "" + "&";
      }
      if (document.getElementById("GLB").checked == true) {
        sPostString += "GLB=" + document.getElementById("GLB").value + "&";
      } else {
        sPostString += "GLB=" + "" + "&";
      }
      if (document.getElementById("FCRA").checked == true) {
        sPostString += "FCRA=" + document.getElementById("FCRA").value + "&";
      } else {
        sPostString += "FCRA=" + "" + "&";
      }
      if (document.getElementById("ECOA").checked == true) {
        sPostString += "ECOA=" + document.getElementById("ECOA").value + "&";
      } else {
        sPostString += "ECOA=" + "" + "&";
      }
      if (document.getElementById("HMDA").checked == true) {
        sPostString += "HMDA=" + document.getElementById("HMDA").value + "&";
      } else {
        sPostString += "HMDA=" + "" + "&";
      }
      if (document.getElementById("RESPA").checked == true) {
        sPostString += "RESPA=" + document.getElementById("RESPA").value + "&";
      } else {
        sPostString += "RESPA=" + "" + "&";
      }
      if (document.getElementById("TILA").checked == true) {
        sPostString += "TILA=" + document.getElementById("TILA").value + "&";
      } else {
        sPostString += "TILA=" + "" + "&";
      }
      if (document.getElementById("FACTA").checked == true) {
        sPostString += "FACTA=" + document.getElementById("FACTA").value + "&";
      } else {
        sPostString += "FACTA=" + "" + "&";
      }
      if (document.getElementById("HOEPA").checked == true) {
        sPostString += "HOEPA=" + document.getElementById("HOEPA").value + "&";
      } else {
        sPostString += "HOEPA=" + "" + "&";
      }
      if (document.getElementById("FHAct").checked == true) {
        sPostString += "FHAct=" + document.getElementById("FHAct").value + "&";
      } else {
        sPostString += "FHAct=" + "" + "&";
      }
      if (document.getElementById("FHA").checked == true) {
        sPostString += "FHA=" + document.getElementById("FHA").value + "&";
      } else {
        sPostString += "FHA=" + "" + "&";
      }
      if (document.getElementById("VA").checked == true) {
        sPostString += "VA=" + document.getElementById("VA").value + "&";
      } else {
        sPostString += "VA=" + "" + "&";
      }
      if (document.getElementById("HUD").checked == true) {
        sPostString += "HUD=" + document.getElementById("HUD").value + "&";
      } else {
        sPostString += "HUD=" + "" + "&";
      }
      if (document.getElementById("NC").checked == true) {
        sPostString += "NC=" + document.getElementById("NC").value + "&";
      } else {
        sPostString += "NC=" + "" + "&";
      }
      if (document.getElementById("KY").checked == true) {
        sPostString += "KY=" + document.getElementById("KY").value + "&";
      } else {
        sPostString += "KY=" + "" + "&";
      }
      if (document.getElementById("MD").checked == true) {
        sPostString += "MD=" + document.getElementById("MD").value + "&";
      } else {
        sPostString += "MD=" + "" + "&";
      }
      if (document.getElementById("IL").checked == true) {
        sPostString += "IL=" + document.getElementById("IL").value + "&";
      } else {
        sPostString += "IL=" + "" + "&";
      }
      sPostString += "Correct=" + document.getElementById("Correct").value + "&";
      sPostString += "Active=" + document.getElementById("Active").value + "&";
      sPostString += "Answer1=" + encodeURI(document.getElementById("Answer1").value.replace("&","and")) + "&";
      sPostString += "Answer2=" + encodeURI(document.getElementById("Answer2").value.replace("&","and")) + "&";
      sPostString += "Answer3=" + encodeURI(document.getElementById("Answer3").value.replace("&","and")) + "&";
      sPostString += "Answer4=" + encodeURI(document.getElementById("Answer4").value.replace("&","and")) + "&";
      //alert(sPostString);
    }
	document.getElementById(container).innerHTML = http_post_request("dougie_ajax.cfm",sPostString);
    //http://xkr.us/articles/javascript/encode-compare/
}
function isNumber(frm, fld, val) {
	if(isNaN(val)) {
		document.forms[frm].elements[fld].focus();
		alert("This is not a number.");
	}
}
function collapsePanel(changeme) {
	if (document.getElementById(changeme).style.display == "block") {
		document.getElementById(changeme).style.display = "none";
	} else {
		document.getElementById(changeme).style.display = "block";
	}
}
function http_post_request(url, sPostString) {
	var results = "";
	var ajax_http_request = false;
	var AjaxTime = new Date();
	sPostString += "AjaxTime=" + AjaxTime.getTime();
	if (window.XMLHttpRequest) { 
		ajax_http_request = new XMLHttpRequest();
		if (ajax_http_request.overrideMimeType) {
			ajax_http_request.overrideMimeType("text/html");
		}
	} else if (window.ActiveXObject) { 
		try {
			ajax_http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e0) {
			try {
				ajax_http_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e1) {
				var strErr = "Object Error";
				strErr += "\nNumber: " + e1.number;
				strErr += "\nDescription: " + e1.description;
				results = strErr;
			}
		}
	}
	if (!ajax_http_request) {
		results = "Cannot create XML/HTTP instance";
	} else {
		ajax_http_request.open("POST", url, false);
		ajax_http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		ajax_http_request.setRequestHeader("Content-length", sPostString.length);
		ajax_http_request.setRequestHeader("Connection", "close");
		ajax_http_request.send(sPostString);
		results = ajax_http_request.responseText;
	}
	return results;
}
function js_Clear(a) {
document.getElementById(a).innerHTML = "";
}
/*
function URLEncode( )
{
	// The Javascript escape and unescape functions do not correspond
	// with what browsers actually do...
	var SAFECHARS = "0123456789" +					// Numeric
					"ABCDEFGHIJKLMNOPQRSTUVWXYZ" +	// Alphabetic
					"abcdefghijklmnopqrstuvwxyz" +
					"-_.!~*'()";					// RFC2396 Mark characters
	var HEX = "0123456789ABCDEF";

	var plaintext = document.URLForm.F1.value;
	var encoded = "";
	for (var i = 0; i < plaintext.length; i++ ) {
		var ch = plaintext.charAt(i);
	    if (ch == " ") {
		    encoded += "+";				// x-www-urlencoded, rather than %20
		} else if (SAFECHARS.indexOf(ch) != -1) {
		    encoded += ch;
		} else {
		    var charCode = ch.charCodeAt(0);
			if (charCode > 255) {
			    alert( "Unicode Character '" 
                        + ch 
                        + "' cannot be encoded using standard URL encoding.\n" +
				          "(URL encoding only supports 8-bit characters.)\n" +
						  "A space (+) will be substituted." );
				encoded += "+";
			} else {
				encoded += "%";
				encoded += HEX.charAt((charCode >> 4) & 0xF);
				encoded += HEX.charAt(charCode & 0xF);
			}
		}
	} // for

	document.URLForm.F2.value = encoded;
	return false;
};

function URLDecode( )
{
   // Replace + with ' '
   // Replace %xx with equivalent character
   // Put [ERROR] in output if %xx is invalid.
   var HEXCHARS = "0123456789ABCDEFabcdef"; 
   var encoded = document.URLForm.F2.value;
   var plaintext = "";
   var i = 0;
   while (i < encoded.length) {
       var ch = encoded.charAt(i);
	   if (ch == "+") {
	       plaintext += " ";
		   i++;
	   } else if (ch == "%") {
			if (i < (encoded.length-2) 
					&& HEXCHARS.indexOf(encoded.charAt(i+1)) != -1 
					&& HEXCHARS.indexOf(encoded.charAt(i+2)) != -1 ) {
				plaintext += unescape( encoded.substr(i,3) );
				i += 3;
			} else {
				alert( 'Bad escape combination near ...' + encoded.substr(i) );
				plaintext += "%[ERROR]";
				i++;
			}
		} else {
		   plaintext += ch;
		   i++;
		}
	} // while
   document.URLForm.F1.value = plaintext;
   return false;
};
*/
</script>