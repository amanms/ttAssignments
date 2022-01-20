<cfcomponent rest="true" restpath="restService">
    <!----<cffunction name="sayHelloWorld" access="remote" returntype="boolean" httpmethod="GET">
        <cfset rest = true>
        <cfset value = 10>
        <cfif value GT 20>
            <cfset rest = false>
        </cfif>
        <cfreturn  rest>
    </cffunction>
    <cffunction name="sayHello" access="remote" returntype="String" httpmethod="GET">
    <cfset rest = "Hello World">
    <cfreturn rest>
    </cffunction>
    <cfset response=structNew()>
    <cfset response.status=201>
    <cfset response.headers=structNew()>
    <cfset response.headers.location="http://localhost:8500/rest/example/restService">
    <cffunction name="getCustomer" access="remote" httpMethod="GET" produces="application/xml" restPath="{id}" returntype="string">
        <cfargument name="id" type="numeric" argtype="PathParam">
        <!--- Getting the customer. --->
        <cfquery name="result" datasource="ecomWebsite">
            select name from users where id = #arguments.id#;
        </cfquery>
        <cfreturn result.name/>
    <cffunction>--->
    <cfset response=structNew()>
    <cfset response.status=201>
    <cfset response.content="<customer id="&id&"><name>"&name&"</name></customer>"> <cfset response.headers=structNew()>
    <cfset response.headers.location="http://localhost:8500/rest/CustomerService/customers/123">
    
</cfcomponent>