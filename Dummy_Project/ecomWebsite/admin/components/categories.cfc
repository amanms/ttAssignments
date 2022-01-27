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
                select * from categories where category_name = <cfqueryparam value="#arguments.category#" cfsqltype="varchar">
            <cfelse>
                select * from categories order by category_name asc;
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
        <cfargument name="category_name" type="string" required="false" default="">
        <cfquery name="update_category">
            <cfif (arguments.id NEQ '')>
                update categories set category_name = <cfqueryparam value="#arguments.category_name#" cfsqltype="varchar">
                where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfelse>
                insert into categories (category_name) values(<cfqueryparam value="#arguments.category_name#" cfsqltype="varchar">)
            </cfif>
        </cfquery>
    </cffunction>
           <!--- function to get categories by id --->
    <cffunction name="on_submit_category" access="remote" output="true" returntype="string">
        <cfargument name="category_name" type="string" required="true">
        <cfset  category_list_by_name = get_category(category='#arguments.category_name#')>
        <cfset var msg=''>
        <cfif arrayLen(category_list_by_name) GT 0>
            <!---<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
                <cfif url.id EQ category_list_by_name [1].id>
                <cfelse>
                    <cfset msg="category already exists">
                </cfif>
            <cfelse>
                <cfset msg="category already exists">
            </cfif>--->
            <cfset msg="category already exists">
        </cfif>
        <cfif msg EQ ''>
            <cfif structKeyExists(url,'id') AND url.id NEQ ''>
                <cfset  update_category = edit_category(id='#url.id#',category_name='#arguments.category_name#')>
            <cfelse>
                <cfset  insert_category = edit_category(category_name='#arguments.category_name#')>
            </cfif>
            
            <!---<cfif url.id NEQ ''>
                <cfset  update_category = edit_category(id='#url.id#',category='#arguments.category_name#')>
            <cfelse>
                
                <cfset  insert_category = edit_category(category='#arguments.category_name#')>
            </cfif>--->
            
            <cfset msg="category added successfully">
        </cfif>
        <cfreturn msg/>
    </cffunction>


</cfcomponent>