

<cffunction name="getname" access="public" output="false" returntype="string">
	<cfargument name='data' type="string" required="true">
	<cfset result = Replace(arguments.data, " ", "", "ALL")/>
	<cfreturn result/>
</cffunction>

