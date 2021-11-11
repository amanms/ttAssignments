<!---<cfinclude template="functions.inc.cfm">--->
<cfcomponent output="false">
    <cffunction name="manage_cart_items" access="remote" output="true" returntype="void">
        <cfargument name="pid" type="string" required="true">
        <cfargument name="qty" type="string" required="true">
        <cfargument name="type" type="string" required="true">
        <cfquery name="cartitems">
            select count(*) as product_count from cart where product_id = <cfqueryparam value="#pid#" cfsqltype="integer">
        </cfquery>
        <cfset msg="">
        <cfif (structKeyExists(session,'USER_LOGIN') AND session['USER_LOGIN'] EQ 'yes')>
            <cfif type EQ 'add'>
                <cfif cartitems.product_count GT '0'>
                    <cfset result = "itempresent">
                    <cfoutput>#result#</cfoutput>
                <cfelse>
                    <cfset get_product = functions.get_product(product_id=pid)>
                    <cfset filepath = get_product[1].filepath>
                    <cfset name = get_product[1].name>
                    <cfset price = get_product[1].price>
                    <cfquery name="insert">
                        insert into cart(userId,filepath,name,price,quantity,product_id)
                        values('#session['USER_ID']#','#filepath#','#name#','#price#','#qty#','#pid#')
                    </cfquery>
                </cfif>
                
            </cfif>
            <cfif type EQ 'remove'>
                <cfquery name="remove">
                    delete from cart where id = <cfqueryparam value="#pid#" cfsqltype="integer">
                </cfquery>
            </cfif>
            <cfif type EQ 'update'>
                <cfquery name="update">
                    update cart set quantity = <cfqueryparam value="#qty#" cfsqltype="integer"> where id = <cfqueryparam value="#pid#" cfsqltype="integer">
                </cfquery>
            </cfif>
            <cfset msg="loggedIn">
        <cfelse>
            <cfset msg="notloggedIn">
        </cfif>
        <cfoutput>#msg#</cfoutput>
    </cffunction>
    
</cfcomponent>