<cfparam name="_html" type="string" default="">
<cfparam name="form.task" type="string" default="">

<!--- Begin Task --->
<cfif form.task EQ "Add">
  <cfquery dataSource="blog" name="temp_query">
    declare @int_NewID int
    insert into AdminDB.dbo.Dougie2 (
      Active,
      Answer1,
      Answer2,
      Answer3,
      Answer4,
      BR,
      CI,
      Correct,
      CR,
      ECOA,
      FACTA,
      FCRA,
      FD,
      FHA,
      FHAct,
      GLB,
      HMDA,
      HOEPA,
      HUD,
      IL,
      KY,
      LO,
      MD,
      NC,
      NI,
      PR,
      Question,
      RESPA,
      SM,
      ST,
      TILA,
      UW,
      VA
      )
  Select
    '#form.Active#',
    '#form.Answer1#',
    '#form.Answer2#',
    '#form.Answer3#',
    '#form.Answer4#',
    '#form.BR#',
    '#form.CI#',
    #val(form.Correct)#,
    '#form.CR#',
    '#form.ECOA#',
    '#form.FACTA#',
    '#form.FCRA#',
    '#form.FD#',
    '#form.FHA#',
    '#form.FHAct#',
    '#form.GLB#',
    '#form.HMDA#',
    '#form.HOEPA#',
    '#form.HUD#',
    '#form.IL#',
    '#form.KY#',
    '#form.LO#',
    '#form.MD#',
    '#form.NC#',
    '#form.NI#',
    '#form.PR#',
    '#form.Question#',
    '#form.RESPA#',
    '#form.SM#',
    '#form.ST#',
    '#form.TILA#',
    '#form.UW#',
    '#form.VA#'
    select @int_NewID = scope_identity()
    select isnull(@int_NewID,0) as 'NewID'
  </cfquery>
  <cfsavecontent variable="_html">
      <cfoutput>
        <cfif temp_query.NewID GT 0>
            Added
         <cfelse>
            Not Added
        </cfif>
      </cfoutput>
  </cfsavecontent>
</cfif>
<!--- End Task --->

<!--- Begin Task --->
<cfif form.task EQ "Save">
  <cfquery dataSource="blog" name="temp_query">
    declare @int_Rows int
    UPDATE AdminDB.dbo.Dougie2 SET
    LO = '#form.LO#',
    BR = '#form.BR#',
    PR = '#form.PR#',
    UW = '#form.UW#',
    SM = '#form.SM#',
    CR = '#form.CR#',
    FD = '#form.FD#',
    ST = '#form.ST#',
    CI = '#form.CI#',
    NI = '#form.NI#',
    GLB = '#form.GLB#',
    FCRA = '#form.FCRA#',
    ECOA = '#form.ECOA#',
    HMDA = '#form.HMDA#',
    RESPA = '#form.RESPA#',
    TILA = '#form.TILA#',
    FACTA = '#form.FACTA#',
    HOEPA = '#form.HOEPA#',
    FHAct = '#form.FHAct#',
    FHA = '#form.FHA#',
    VA = '#form.VA#',
    HUD = '#form.HUD#',
    NC = '#form.NC#',
    KY = '#form.KY#',
    MD = '#form.MD#',
    IL = '#form.IL#',
    Correct = #val(form.Correct)#,
    Active = '#form.Active#',
    Answer1 = '#form.Answer1#',
    Answer2 = '#form.Answer2#',
    Answer3 = '#form.Answer3#',
    Answer4 = '#form.Answer4#',
    Question = '#form.Question#'
    WHERE QuestionID = #val(form.QuestionID)#
    select @int_Rows = @@rowcount
    select @int_Rows as 'Rows'
  </cfquery>
  <cfsavecontent variable="_html">
      <cfoutput>
        <cfif temp_query.Rows EQ 1>
            Saved
         <cfelse>
            Not Saved
        </cfif>
      </cfoutput>
  </cfsavecontent>
</cfif>
<!--- End Task --->

<cfoutput>#_html#</cfoutput>