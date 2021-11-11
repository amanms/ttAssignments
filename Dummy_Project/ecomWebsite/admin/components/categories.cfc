<cfcomponent output="false">
    <!--- function to get all categories --->
    <cffunction name="get_category" access="public" output="true" returntype="array">
        <cfargument name="id" type="string" required="false" default="">
        <cfargument name="category" type="string" required="false" default=""> 
        <cfset category_array = arrayNew(1)>
        <cfquery name="categories">
            <cfif arguments.id NEQ ''>
                select * from categories where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            
            <cfelseif arguments.category NEQ ''>
                select * from categories where categories = <cfqueryparam value="#arguments.category#" cfsqltype="varchar">
            <cfelse>
                select * from categories order by categories asc;
            </cfif>
            
        </cfquery>
        <cfloop from ="1" to = "#categories.recordCount#" index="i">
            <cfset category_array[i] = queryGetRow('#categories#',i)>
        </cfloop>
        <cfreturn category_array/>        
    </cffunction>
    <!--- function to edit categories --->
        <!--- function to update and insert into categories --->
    <cffunction name="edit_category" access="public" output="true" returntype="void">
        <cfargument name="id" type="string" required="false" default="">
        <cfargument name="category" type="string" required="false" default="">
        <cfquery name="update_category">
            <cfif (arguments.id NEQ '')>
                update categories set categories = <cfqueryparam value="#arguments.category#" cfsqltype="varchar">
                where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfelse>
                insert into categories (categories) values(<cfqueryparam value="#arguments.category#" cfsqltype="varchar">)
            </cfif>
        </cfquery>
    </cffunction>
           <!--- function to get categories by id --->
    <cffunction name="check" access="public" output="false" returntype="numeric">
        <cfargument name="a" type="numeric" required="false">
        <cfargument name="b" type="numeric" required="false">
        <cfargument name="c" type="numeric" required="false">
        <cfset result = arguments.a+arguments.b+arguments.c>
        <cfreturn result/>
    </cffunction>
</cfcomponent>