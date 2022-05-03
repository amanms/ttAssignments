<cfif isDefined("form.posted")>
    <cfinsert datasource="ecomWebsite" tablename="comments" 
    formfields="Email,FromUser,Subject,MessageText,Posted"> 
    
</cfif>