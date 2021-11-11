<cfinclude template="functions.inc.cfm">
<cfset uid = #session['USER_ID']#>
<cfset new_password = #newpassword#>
<cfset confirm_password = #confirmpassword#>
<cfquery name="user">
    select * from users where id=#uid#;
</cfquery>
<cfif #new_password# EQ #confirm_password#>
    <cfset new_salt = hash(generateSecretKey("AES"),"SHA-512")>
    <cfset new_password = hash(#new_password#&#new_salt#,"SHA-512")>
    <cfquery name="update">
        update users set salt = '#new_salt#',password = '#new_password#' where id=#uid#;
    </cfquery>
    <cfoutput>valid</cfoutput>
<cfelse>
    <cfoutput>invalid</cfoutput>
</cfif>



