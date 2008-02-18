<cfcomponent output="false">

<!--- Begin Function  --->
<cffunction name="init" displayname="init" access="package" output="false">
	<cfargument required="true" type="string" name="dsn">
	<cfset module_dsn = arguments.dsn>
	<cfreturn this>
</cffunction>
<!--- End Function --->

<!--- Begin Function  --->
<cffunction access="package" output="false" returntype="string" name="fail">
	<cfargument name="userID" type="numeric" default="0">
	<cfargument name="message" type="string" default="">
	<cfargument name="detail" type="string" default="">
	<cfargument name="type" type="string" default="">
	<cfargument name="tagContext" type="Array" default="">
	<cfargument name="remoteIP" type="string" default="">
	<cfargument name="showOutput" type="boolean" default="true">

	<cfset obj_cfcTest_sql = createObject("component","cfcTest_sql").init(dsn=module_dsn)>
	<cfset x = obj_cfcTest_sql.fail(argumentCollection=arguments)>
	<cfif arguments.showOutput>
		<cfif arguments.remoteIP EQ "75.176.87.141" or arguments.userID EQ 12>
			<cfset lcl_showError = true>
		<cfelse>
			<cfset lcl_showError = false>
		</cfif>
		<cfset obj_cfcTest_display = createObject("component","cfcTest_display")>	
		<cfsavecontent variable="s_fail">
			<cfoutput>#obj_cfcTest_display.fail(message=arguments.message,detail=arguments.detail,type=arguments.type,tagContext=arguments.tagContext,showError=lcl_showError,remoteIP=arguments.remoteIP)#</cfoutput>
		</cfsavecontent>
	<cfelse>
		<cfset s_fail = "">	
	</cfif>	

	<cfreturn s_fail>
</cffunction>
<!--- End Function --->

<!--- Begin Function  --->
<cffunction access="package" output="false" returntype="string" name="showErrors">
	<cfargument name="numberToGet" type="numeric" default="20">
	
	<cfset obj_cfcTest_sql = createObject("component","cfcTest_sql").init(dsn=module_dsn)>
	<cfset q_showErrors = obj_cfcTest_sql.showErrors(numberToGet=arguments.numberToGet)>
	<cfset obj_cfcTest_display = createObject("component","cfcTest_display").init()>	
	<cfsavecontent variable="s_showErrors">
		<cfoutput>#obj_cfcTest_display.showErrors(errorQuery=q_showErrors)#</cfoutput>
	</cfsavecontent>

	<cfreturn s_showErrors>
</cffunction>
<!--- End Function --->


</cfcomponent>