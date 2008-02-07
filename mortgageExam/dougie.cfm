<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><cfoutput>#SiteName#</cfoutput></title>
<link href="braddoro.css" rel="stylesheet" type="text/css">
<cfset thispage = "dougie.cfm"/>
<cfinclude template="dougie_javascript.cfm">
</head>
<body class="body" onload="document.getElementById('Question').focus();">
<cfparam name="url.id" type="string" default="">
<cfoutput>
<!--- Header --->
<div id="header" class="head">
  The Dougie Thing&nbsp;
  |<a href="#thispage#?task=list&sort=desc">list</a>|<a href="#thispage#?task=test">test</a>|<a href="#thispage#?task=add" title="Add a new record.">add</a>|
</div>
<!--- Show test--->
<cfif isdefined("url.task") and url.task EQ "test">
  <div id="list" class="panel">
    <cfquery dataSource="blog" name="Questions">
      select top 5 * from AdminDB.dbo.Dougie2 order by newid()
    </cfquery>
    <table class="panelinside" style="border-collapse:collapse;">
      <TR id="header">
        <TH>Sample Test</TH>
      </TR>
    <cfloop query="Questions">
      <cfif currentrow mod 2><cfset rowclass = "even2"/><cfelse><cfset rowclass = "odd2"/></cfif>
      <TR class="#rowclass#">
        <TD>
          <strong>Question: #currentrow#</strong><br clear="all">
          #rereplace(Question,"<br>",chr(10)&chr(13),"All")#
        </TD>
      </TR>
        </TR>
        <TR class="#rowclass#">
          <TD>
          <INPUT type="radio" id="Q_#QuestionID#" name="Q_#QuestionID#" value="1" onclick="alert(this.id+' '+this.value);">
          #Answer1#<br clear="all"/>
          <INPUT type="radio" id="Q_#QuestionID#" name="Q_#QuestionID#" value="2" onclick="alert(this.id+' '+this.value);">
          #Answer2#<br clear="all"/>
          <INPUT type="radio" id="Q_#QuestionID#" name="Q_#QuestionID#" value="3" onclick="alert(this.id+' '+this.value);">
          #Answer3#<br clear="all"/>
          <INPUT type="radio" id="Q_#QuestionID#" name="Q_#QuestionID#" value="4" onclick="alert(this.id+' '+this.value);">
          #Answer4#<br clear="all"/>
          </TD>
        </TR>
    </cfloop>
    </table>
  </div>
</cfif>
<!--- Show List --->
<cfif isdefined("url.task") and url.task EQ "list">
  <div id="list" class="panel">
    <a href="#thispage#?task=list&sort=asc">asc</a>&nbsp;<a href="#thispage#?task=list&sort=desc">desc</a>
    <cfquery dataSource="blog" name="Questions">
      select QuestionID, Question from AdminDB.dbo.Dougie2 <cfif isdefined("url.sort")>order by QuestionID #url.sort#</cfif>
    </cfquery>
    <table class="panelinside" style="border-collapse:collapse;">
      <TR id="header">
        <TH colspan="2">Question</TH>
      </TR>
    <cfloop query="Questions">
      <cfif currentrow mod 2><cfset rowclass = "even2"/><cfelse><cfset rowclass = "odd2"/></cfif>
      <TR class="#rowclass#">
        <TD><a href="#thispage#?task=show&id=#QuestionID#">#QuestionID#</a></TD>
        <TD>#rereplace(Question,"<br>",chr(10)&chr(13),"All")#</TD>
      </TR>
    </cfloop>
    </table>
  </div>
</cfif>
<!--- Show single --->
<cfif isdefined("url.task") and url.task EQ "show">
  <div id="show" class="panelinside">
    <cfif isdefined("url.back") and url.back GT 0>
        <cfset sql = "select top 1 * from admindb.dbo.dougie2 where QuestionID < #val(url.back)# order by QuestionID desc"/>
    </cfif>
    <cfif isdefined("url.Next") and url.Next GT 0>
        <cfset sql = "select top 1 * from admindb.dbo.dougie2 where QuestionID > #val(url.Next)# order by QuestionID"/>
    </cfif>
    <cfif isdefined("url.id") and url.id GT 0>
        <cfset sql = "select * from AdminDB.dbo.Dougie2 where QuestionID = #val(url.id)#"/>
    </cfif>
    <cfquery dataSource="blog" name="Questions">#sql#</cfquery>
    <cfset tableColumns = 3/>
    <table class="" width="100%" border="0">
      <cfloop query="Questions">
        <TR class="odd">
          <TD>
            <INPUT type="checkbox" name="LO" value="checked" id="LO" class="tiny" title="click to select or deselect" #LO#> Loan Officer<br>
            <INPUT type="checkbox" name="BR" value="checked" id="BR" class="tiny" title="click to select or deselect" #BR#> Broker<br>
            <INPUT type="checkbox" name="PR" value="checked" id="PR" class="tiny" title="click to select or deselect" #PR#> Processor<br>
            <INPUT type="checkbox" name="UW" value="checked" id="UW" class="tiny" title="click to select or deselect" #UW#> Underwriter<br>
            <INPUT type="checkbox" name="CR" value="checked" id="CR" class="tiny" title="click to select or deselect" #CR#> Credit<br>
            <INPUT type="checkbox" name="FD" value="checked" id="FD" class="tiny" title="click to select or deselect" #FD#> Federal<br>
            <INPUT type="checkbox" name="ST" value="checked" id="ST" class="tiny" title="click to select or deselect" #ST#> State<br>
            <INPUT type="checkbox" name="CI" value="checked" id="CI" class="tiny" title="click to select or deselect" #CI#> City<br>
            <INPUT type="checkbox" name="IL" value="checked" id="IL" class="tiny" title="click to select or deselect" #IL#> Illionios<br>
          </TD>
          <TD>
            <INPUT type="checkbox" name="SM" value="checked" id="SM" class="tiny" title="click to select or deselect" #SM#> Secondary Market<br>
            <INPUT type="checkbox" name="GLB" value="checked" id="GLB" class="tiny" title="click to select or deselect" #GLB#> Grahm Leach Bliely<br>
            <INPUT type="checkbox" name="FCRA" value="checked" id="FCRA" class="tiny" title="click to select or deselect" #FCRA#> Fair Credit Reporting Act<br>
            <INPUT type="checkbox" name="ECOA" value="checked" id="ECOA" class="tiny" title="click to select or deselect" #ECOA#> Equal Credit Opportunity Act<br>
            <INPUT type="checkbox" name="HMDA" value="checked" id="HMDA" class="tiny" title="click to select or deselect" #HMDA#> Home Mortgage Disclosure Act<br>
            <INPUT type="checkbox" name="RESPA" value="checked" id="RESPA" class="tiny" title="click to select or deselect" #RESPA#> Real Estate Settlement Procedures Act<br>
            <INPUT type="checkbox" name="TILA" value="checked" id="TILA" class="tiny" title="click to select or deselect" #TILA#> Truth in Lending Act<br>
            <INPUT type="checkbox" name="FACTA" value="checked" id="FACTA" class="tiny" title="click to select or deselect" #FACTA#> Fair and Accurate Credit Transaction Act<br>
          </TD>
          <TD>
            <INPUT type="checkbox" name="HOEPA" value="checked" id="HOEPA" class="tiny" title="click to select or deselect" #HOEPA#> Home Ownership Equity Protection Act<br>
            <INPUT type="checkbox" name="FHAct" value="checked" id="FHAct" class="tiny" title="click to select or deselect" #FHAct#> Fair Housing Act<br>
            <INPUT type="checkbox" name="FHA" value="checked" id="FHA" class="tiny" title="click to select or deselect" #FHA#> Federal Housing Administration<br>
            <INPUT type="checkbox" name="VA" value="checked" id="VA" class="tiny" title="click to select or deselect" #VA#> Veterans Administration<br>
            <INPUT type="checkbox" name="HUD" value="checked" id="HUD" class="tiny" title="click to select or deselect" #HUD#> Housing and Urban Development<br>
            <INPUT type="checkbox" name="NI" value="checked" id="NI" class="tiny" title="click to select or deselect" #NI#> Not in Use<br>
            <INPUT type="checkbox" name="NC" value="checked" id="NC" class="tiny" title="click to select or deselect" #NC#> North Carolina<br>
            <INPUT type="checkbox" name="KY" value="checked" id="KY" class="tiny" title="click to select or deselect" #KY#> Kentucky<br>
            <INPUT type="checkbox" name="MD" value="checked" id="MD" class="tiny" title="click to select or deselect" #MD#> Maryland<br>
          </TD>
         </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="hidden" name="QuestionID" value="#QuestionID#" id="QuestionID">
            <cf_grow_boxes ElementName="Question">
            <textarea id="Question" name="Question" class="tiny" cols="100" rows="5">
              #rereplace(Question,"<br>",chr(10)&chr(13),"All")#
            </textarea>
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="text" id="Answer1" name="Answer1" value="#Answer1#" size="100" maxlength="500" class="tiny" title="answer 1">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="text" id="Answer2" name="Answer2" value="#Answer2#" size="100" maxlength="500" class="tiny" title="answer 2">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="text" id="Answer3" name="Answer3" value="#Answer3#" size="100" maxlength="500" class="tiny" title="answer 3">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="text" id="Answer4" name="Answer4" value="#Answer4#" size="100" maxlength="500" class="tiny" title="answer 4">
          </TD>
        </TR>
        <TR class="odd">
          <TD style="display:inline;">
            <SELECT name="Correct" id="Correct" title="Correct Question" size="4">
              <option value="1"<cfif Correct EQ 1> selected</cfif>>One</option>
              <option value="2"<cfif Correct EQ 2> selected</cfif>>Two</option>
              <option value="3"<cfif Correct EQ 3> selected</cfif>>Three</option>
              <option value="4"<cfif Correct EQ 4> selected</cfif>>Four</option>
            </SELECT> Correct Question Number
          </TD>
          <TD style="display:inline;padding-left:1em;">
            <SELECT name="Active" id="Active" title="Is question active?" size="2">
              <option value="Y"<cfif Active EQ "Y"> selected</cfif>>Yes</option>
              <option value="N"<cfif Active EQ "N"> selected</cfif>>No</option>
            </SELECT> Is question active?
          </TD>
          <TD align="right" style="display:inline;padding-left:1em;">
            <a href="#thispage#?task=show&Back=#QuestionID#" title="Go to the prior record.">Back</a> 
            <INPUT type="button" name="Save" value="Save" alt="Save" title="Save" onclick="js_BuildRequest(this.value,'save_output',#QuestionID#)" onmouseout="js_Clear('save_output')"> 
            <a href="#thispage#?task=show&Next=#QuestionID#" title="Go to the next record.">Next</a> 
            <a href="#thispage#?task=add" title="Add a new record.">Add</a>
            <span id="save_output" class="tiny"></span> 
          </TD>
        </TR>
      </cfloop>
    </table>
  </div>
</cfif>
<!--- Add --->
<cfif isdefined("url.task") and url.task EQ "add">
<cfset Active = "Y"/>     
 <cfset Answer1 = ""/>    
 <cfset Answer2 = ""/>    
 <cfset Answer3 = ""/>    
 <cfset Answer4 = ""/>    
 <cfset BR = ""/>         
 <cfset CI = ""/>
 <cfset r = Randomize(getTickCount())>
 <cfset Correct = RandRange(1, 4)/>
 <cfset CR = ""/>         
 <cfset ECOA = ""/>       
 <cfset FACTA = ""/>      
 <cfset FCRA = ""/>       
 <cfset FD = ""/>         
 <cfset FHA = ""/>        
 <cfset FHAct = ""/>      
 <cfset GLB = ""/>        
 <cfset HMDA = ""/>       
 <cfset HOEPA = ""/>      
 <cfset HUD = ""/>        
 <cfset IL = ""/>         
 <cfset KY = ""/>         
 <cfset LO = ""/>         
 <cfset MD = ""/>         
 <cfset NC = ""/>         
 <cfset NI = ""/>         
 <cfset PR = ""/>         
 <cfset Question = ""/>   
 <cfset QuestionID = ""/> 
 <cfset RESPA = ""/>      
 <cfset SM = ""/>         
 <cfset ST = ""/>         
 <cfset TILA = ""/>       
 <cfset UW = ""/>         
 <cfset VA = ""/>         
  <div id="show" class="panelinside">
    <cfset tableColumns = 3/>
    <table class="" width="100%" border="0">
      <cfoutput>
        <TR class="odd">
          <TD>
            <INPUT type="checkbox" name="LO" value="checked" id="LO" class="tiny" title="click to select or deselect" #LO#> Loan Officer<br>
            <INPUT type="checkbox" name="BR" value="checked" id="BR" class="tiny" title="click to select or deselect" #BR#> Broker<br>
            <INPUT type="checkbox" name="PR" value="checked" id="PR" class="tiny" title="click to select or deselect" #PR#> Processor<br>
            <INPUT type="checkbox" name="UW" value="checked" id="UW" class="tiny" title="click to select or deselect" #UW#> Underwriter<br>
            <INPUT type="checkbox" name="CR" value="checked" id="CR" class="tiny" title="click to select or deselect" #CR#> Credit<br>
            <INPUT type="checkbox" name="FD" value="checked" id="FD" class="tiny" title="click to select or deselect" #FD#> Federal<br>
            <INPUT type="checkbox" name="ST" value="checked" id="ST" class="tiny" title="click to select or deselect" #ST#> State<br>
            <INPUT type="checkbox" name="CI" value="checked" id="CI" class="tiny" title="click to select or deselect" #CI#> City<br>
            <INPUT type="checkbox" name="IL" value="checked" id="IL" class="tiny" title="click to select or deselect" #IL#> Illionios<br>
          </TD>
          <TD>
            <INPUT type="checkbox" name="SM" value="checked" id="SM" class="tiny" title="click to select or deselect" #SM#> Secondary Market<br>
            <INPUT type="checkbox" name="GLB" value="checked" id="GLB" class="tiny" title="click to select or deselect" #GLB#> Grahm Leach Bliely<br>
            <INPUT type="checkbox" name="FCRA" value="checked" id="FCRA" class="tiny" title="click to select or deselect" #FCRA#> Fair Credit Reporting Act<br>
            <INPUT type="checkbox" name="ECOA" value="checked" id="ECOA" class="tiny" title="click to select or deselect" #ECOA#> Equal Credit Opportunity Act<br>
            <INPUT type="checkbox" name="HMDA" value="checked" id="HMDA" class="tiny" title="click to select or deselect" #HMDA#> Home Mortgage Disclosure Act<br>
            <INPUT type="checkbox" name="RESPA" value="checked" id="RESPA" class="tiny" title="click to select or deselect" #RESPA#> Real Estate Settlement Procedures Act<br>
            <INPUT type="checkbox" name="TILA" value="checked" id="TILA" class="tiny" title="click to select or deselect" #TILA#> Truth in Lending Act<br>
            <INPUT type="checkbox" name="FACTA" value="checked" id="FACTA" class="tiny" title="click to select or deselect" #FACTA#> Fair and Accurate Credit Transaction Act<br>
          </TD>
          <TD>
            <INPUT type="checkbox" name="HOEPA" value="checked" id="HOEPA" class="tiny" title="click to select or deselect" #HOEPA#> Home Ownership Equity Protection Act<br>
            <INPUT type="checkbox" name="FHAct" value="checked" id="FHAct" class="tiny" title="click to select or deselect" #FHAct#> Fair Housing Act<br>
            <INPUT type="checkbox" name="FHA" value="checked" id="FHA" class="tiny" title="click to select or deselect" #FHA#> Federal Housing Administration<br>
            <INPUT type="checkbox" name="VA" value="checked" id="VA" class="tiny" title="click to select or deselect" #VA#> Veterans Administration<br>
            <INPUT type="checkbox" name="HUD" value="checked" id="HUD" class="tiny" title="click to select or deselect" #HUD#> Housing and Urban Development<br>
            <INPUT type="checkbox" name="NI" value="checked" id="NI" class="tiny" title="click to select or deselect" #NI#> Not in Use<br>
            <INPUT type="checkbox" name="NC" value="checked" id="NC" class="tiny" title="click to select or deselect" #NC#> North Carolina<br>
            <INPUT type="checkbox" name="KY" value="checked" id="KY" class="tiny" title="click to select or deselect" #KY#> Kentucky<br>
            <INPUT type="checkbox" name="MD" value="checked" id="MD" class="tiny" title="click to select or deselect" #MD#> Maryland<br>
          </TD>
         </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <INPUT type="hidden" name="QuestionID" value="#QuestionID#" id="QuestionID">
            <cf_grow_boxes ElementName="Question">
            <textarea id="Question" name="Question" class="tiny" cols="100" rows="5">
              #rereplace(Question,"<br>",chr(10)&chr(13),"All")#
            </textarea>
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <cfif Correct EQ 1><cfset rowclass = "emphasis"/><cfelse><cfset rowclass = "tiny"/></cfif>
            <INPUT type="text" id="Answer1" name="Answer1" value="#Answer1#" size="100" maxlength="500" class="#rowclass#" title="answer 1">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <cfif Correct EQ 2><cfset rowclass = "emphasis"/><cfelse><cfset rowclass = "tiny"/></cfif>
            <INPUT type="text" id="Answer2" name="Answer2" value="#Answer2#" size="100" maxlength="500" class="#rowclass#" title="answer 2">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <cfif Correct EQ 3><cfset rowclass = "emphasis"/><cfelse><cfset rowclass = "tiny"/></cfif>
            <INPUT type="text" id="Answer3" name="Answer3" value="#Answer3#" size="100" maxlength="500" class="#rowclass#" title="answer 3">
          </TD>
        </TR>
        <TR class="odd">
          <TD colspan="#tableColumns#">
            <cfif Correct EQ 4><cfset rowclass = "emphasis"/><cfelse><cfset rowclass = "tiny"/></cfif>
            <INPUT type="text" id="Answer4" name="Answer4" value="#Answer4#" size="100" maxlength="500" class="#rowclass#" title="answer 4">
          </TD>
        </TR>
        <TR class="odd">
          <TD style="display:inline;">
            <SELECT name="Correct" id="Correct" title="Correct Question" size="4">
              <option value="1"<cfif Correct EQ 1> selected</cfif>>One</option>
              <option value="2"<cfif Correct EQ 2> selected</cfif>>Two</option>
              <option value="3"<cfif Correct EQ 3> selected</cfif>>Three</option>
              <option value="4"<cfif Correct EQ 4> selected</cfif>>Four</option>
            </SELECT> Correct Question Number
          </TD>
          <TD style="display:inline;padding-left:1em;">
            <SELECT name="Active" id="Active" title="Is question active?" size="2">
              <option value="Y"<cfif Active EQ "Y"> selected</cfif>>Yes</option>
              <option value="N"<cfif Active EQ "N"> selected</cfif>>No</option>
            </SELECT> Is question active?
          </TD>
          <TD align="right" style="display:inline;padding-left:1em;">
            <INPUT type="button" name="Add" value="Add" alt="Add" title="Add" onclick="js_BuildRequest(this.value,'add_output',0)" onmouseout="js_Clear('add_output')">
            <a href="#thispage#?task=add" title="Add a new record.">New</a>
            <span id="add_output" class="tiny"></span>
          </TD>
        </TR>
      </cfoutput>
    </table>
  </div>
</cfif>
</cfoutput>
</body>
</html>