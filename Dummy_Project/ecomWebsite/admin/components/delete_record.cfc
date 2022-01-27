<cfcomponent output="false">
    <!--- function to delete category records --->
    <cffunction name = "delete_category" access="remote" output="true" returntype="void">
        <cfargument name="id" type="numeric" required="true">
        <cfset msg="">
        <cfquery name="delete_record">
            delete from categories where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfset msg = "ok">
        </cfquery>
        <cfoutput>#msg#</cfoutput>
    </cffunction>

    <!--- function to delete products --->
    <cffunction name = "delete_product" access="remote" output="true" returntype="void">
        <cfargument name="id" type="numeric" required="true">
        <cfset msg="">
        <cfquery name="delete_record">
            delete from products where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfset msg = "ok">
        </cfquery>
        <cfoutput>#msg#</cfoutput>
    </cffunction>
</cfcomponent>