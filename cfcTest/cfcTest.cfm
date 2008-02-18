<!--- <cflock timeout="20" type="exclusive" scope="Session">
	<cfset session.siteDsn="braddoro">
	<cfset session.postsToShow=20>
	<cfif isdefined("cookie.userGUID")>
		<cfset session.userGUID = cookie.userGUID>
	<cfelse>
		<cfset session.userGUID = "none">
	</cfif>
</cflock>
<cfset obj_application = createObject("component","application_logic").init(dsn=session.siteDsn)>
<cfset obj_user = createObject("component","user_logic").init(dsn=session.siteDsn)>
<cfset q_authenticateUser = obj_user.authenticateUser(userGUID=session.userGUID)>
<cfset session.userID = q_authenticateUser.userID>
<cfset session.siteName = q_authenticateUser.siteName>
<cfset session.userGUID = q_authenticateUser.userGUID>
<cfcookie expires="never" name="userGUID" value="#q_authenticateUser.userGUID#">
 --->
<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<title>cfcTest</title>
<head>
<link href="" rel="stylesheet" type="text/css">
</head>
<body class="body">
<fieldset>
<cfset obj_cfcTest_logic = createObject("component","cfcTest_logic").init(dsn="braddoro")>
<div id="menu">#obj_cfcTest_logic.showErrors(numberToGet=20)#</div>
</fieldset>
</div>
</cfoutput>
</body>
</html>