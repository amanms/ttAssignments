<cfcomponent output="false">
    <cffunction name="get_user" access="public" output="true" returntype="array">
        <cfset user_array = arrayNew(1)>
        <cfquery name="user_details">
            select users.id,users.name,users.email,users.added_on,users.mobile from users where role = 0
        </cfquery>
        <cfloop from="1" to="#user_details.recordCount#" index="i">
            <cfset user_array[i] = queryGetRow('#user_details#',i)>
        </cfloop>
        <cfreturn user_array/>
    </cffunction>
</cfcomponent>