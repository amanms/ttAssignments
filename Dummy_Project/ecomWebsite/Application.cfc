<cfcomponent output="false">
    <cfset this.name="ecomWebsite"/>
    <cfset this.applicationTimeout = createTimespan(0,2,0,0)>
    <cfset this.sessionManagement = true/>
    <cfset this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0)/>
    <cfset this.datasource = "ecomWebsite"/>
    

</cfcomponent>