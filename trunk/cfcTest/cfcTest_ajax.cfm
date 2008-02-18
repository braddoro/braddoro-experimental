<cfparam name="_html" type="string" default="">
<cfparam name="form.task" type="string" default="">

<!--- showMessages --->
<cfif form.task EQ "showMessages">
	<cfset obj_message_logic = createObject("component","message_logic").init(dsn=session.siteDsn)>
	<cfsavecontent variable="_html">
	<cfoutput>#obj_message_logic.showMessages(userID=val(session.userID))#</cfoutput>
	</cfsavecontent>
</cfif>
<!--- saveMessage --->
<cfif form.task EQ "saveMessage">
	<cfset obj_message_logic = createObject("component","message_logic").init(dsn=session.siteDsn)>
	<cfset x = obj_message_logic.saveMessage(from_userID=val(session.userID),to_userID=val(form.message_userID),messageText=form.messageText)>

	<cfset obj_message_logic = createObject("component","message_logic").init(dsn=session.siteDsn)>
	<cfsavecontent variable="_html">
	<cfoutput>#obj_message_logic.showMessages(userID=val(session.userID))#</cfoutput>
	</cfsavecontent>
</cfif>