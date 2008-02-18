<cfcomponent output="false">

<!--- Begin Function  --->
<cffunction name="init" displayname="init" access="package" output="false">
	
	<cfreturn this>
</cffunction>
<!--- End Function --->

<!--- Begin Function  --->
<cffunction access="package" output="false" returntype="String" name="showErrors">
	<cfargument name="errorQuery" type="query" required="true">
	

	<cfsavecontent variable="s_showErrors">
	<cfoutput>
	<br>
	<table id="quoteList" width="100%" border="1" style="border-collapse:collapse;">
		<tr>
			<th>userID</th>
			<th>when</th>
			<th>remoteIP</th>
			<th>type</th>
			<th>message</th>
			<th>detail</th>
		</tr>
	<cfloop query="arguments.errorQuery">
		<tr>
			<td>#numberformat(userID,"0000")#</td>
			<td>#dateFormat(addedDate,"mm/dd/yyyy")# #timeFormat(addedDate,"hh:mm TT")#</td>
			<td>#remoteIP#</td>
			<td>#type#</td>
			<td>#message#</td>
			<td>#detail#</td>
		</tr>
	</cfloop>
	</table>
	</cfoutput>
	</cfsavecontent>

<!--- 
onmouseover="js_changeBG(this.id,'##AB9448');" onmouseout="js_changeBG(this.id,'##E7E7E7');" style="cursor:default;" title="click to view"
onclick="js_buildRequest('#arguments.action#','#arguments.outputDiv#',#quoteID#);"
 id="quoteID_#quoteID#" 
 --->
	<cfreturn s_showErrors>
</cffunction>
<!--- End Function --->

</cfcomponent>