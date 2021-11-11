<cfcomponent output="false">
    <!--- function to count number of users --->
    <cffunction name="user_count"  access="public" output="false" returntype="string">
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
    </cffunction>

</cfcomponent>