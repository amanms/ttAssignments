<cfinclude template="functions.inc.cfm">
<cfset email = #email#>
<cfset password = #password#>
<cfquery name="user">
    select * from users where email ='#email#';
</cfquery>
<cfset user_salt = #user.salt#>
<cfset login_password = hash(#password#&#user_salt#,"SHA-512")>
<cfquery name="logincheck" result="result">
    select * from dbo.users where email = '#email#' AND password = '#login_password#';
</cfquery>


<cfif #logincheck.recordCount# GT 0>
    <cfif #logincheck.role# EQ '1'>
        <cfset session['USER_LOGIN'] = 'admin'>
    <cfelse>
        <cfset session['USER_LOGIN'] = 'yes'>
    </cfif>
    
    <cfset session['USER_ID'] = #logincheck.id#>
    <cfset session['USER_NAME'] = #logincheck.name#>
    <cfoutput>valid</cfoutput>
<cfelse>
    <cfoutput>wrong</cfoutput>
</cfif>
    
