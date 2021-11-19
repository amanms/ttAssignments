<cfcomponent output="false">
    
    <cffunction name="get_total_count" access="public" output="true" returntype="numeric">
        <cfargument name="user_count" type="string" required="false" default="">
        <cfargument name="product_count" type="string" required="false" default="">
        <cfargument name="order_count" type="string" required="false" default="">
        <cfset var toatl_count = 1>
        <cfquery name="fetch_total_count">
            <cfif arguments.user_count NEQ ''>
                select count(*) as total_count from users where role = '0'
            <cfelseif arguments.product_count NEQ ''>
                select count(*) as total_count from products
            <cfelseif arguments.order_count NEQ ''>
                select count(*) as total_count from orders
            </cfif>
        </cfquery>
        <cfset toatl_count = fetch_total_count.total_count>
        <cfreturn toatl_count/>
        
    </cffunction>
    <!--- function to count number of users 
    <cffunction name="user_count"  access="public" output="false" returntype="numeric">
        <cfquery name="user">
            select count(*) as total_user from users where role = '0'
        </cfquery>
        <cfreturn user.total_user/>
    </cffunction>
    <!--- function to count number of products --->
    <cffunction name="product_count"  access="public" output="false" returntype="string">
        <cfquery name="product">
            select count(*) as total_product from products
        </cfquery>
        <cfreturn product.total_product/>
    </cffunction>

    <!--- function to count number of orders --->
    <cffunction name="order_count"  access="public" output="false" returntype="string">
        <cfquery name="order">
            select count(*) as total_order from orders
        </cfquery>
        <cfreturn order.total_order/>
    </cffunction>--->

</cfcomponent>