<cfinclude template="functions.inc.cfm">
<cfset name =#form.name#>
<cfset email = #form.email#>
<cfset mobile = #form.mobile#>
<cfset password = #form.password#>
<cfquery name="user">
    select * from users where email ='#email#';
</cfquery>
<cfif #user.recordCount# GT 0>
    <cfoutput>present</cfoutput>
<cfelse>
    <cfset password_salt = hash(generateSecretKey("AES"),"SHA-512")>
    <cfset password_hash = hash(#password#&#password_salt#,"SHA-512")>
    <cfquery name="insert">
        insert into dbo.users(name,mobile,email,password,salt)
		values('#name#','#mobile#','#email#','#password_hash#','#password_salt#')
    </cfquery>
    <cfoutput>insert</cfoutput>
</cfif>