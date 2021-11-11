<cfinclude template="functions.inc.cfm">
<cfset email = #email#>
<cfset new_password = #newpassword#>
<cfset confirm_password = #confirmpassword#>
<cfset user_details = arrayNew(1)>
<cfquery name="user">
    select * from users;
</cfquery>
<cfset num = 0>
<cfloop from="1" to="#user.recordCount#" index="i">
    <cfset row = queryGetRow(user,#i#)>
    <cfif #email# EQ #row.email#>
        <cfset num = 1>
        <cfif #new_password# EQ #confirm_password#>
            <cfset user_salt = hash(generateSecretKey("AES"),"SHA-512")>
            <cfset user_password = hash(#new_password#&#user_salt#,"SHA-512")>
            <cfquery name="update">
                update users set salt = '#user_salt#',password = '#user_password#' where id=#row.id#;
            </cfquery>
            <cfoutput>insert</cfoutput>
        <cfelse>
            <cfoutput>passworderror</cfoutput>
        </cfif>
        
    </cfif>
</cfloop>
<cfif #num# NEQ 1>
    <cfoutput>invalid</cfoutput>
</cfif>

