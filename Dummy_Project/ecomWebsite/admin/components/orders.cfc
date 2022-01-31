<cfcomponent output="false">

    <!---  function to get orders --->
    <cffunction name="orders" access="public" output="true" returntype="query">
        <cfquery name="get_orders">
            select orders.id,
                    orders.added_on,
                    orders.address,
                    orders.city,
                    orders.pincode,
                    orders.payment_type,
                    orders.payment_status,
                    orders.order_status,
                    orders.total_price
            from orders;
        </cfquery>
        <cfreturn get_orders/>
    </cffunction>

    <!--- function to get order details --->
    <cffunction name="order_details" access="public" output="true" returntype="query">
        <cfargument name="id" type="string" required="true" default="">
        <cfquery name="get_order_detail">
            select distinct(order_detail.id),
            order_detail.price,
            order_detail.quantity,
            order_detail.product_name,
            order_detail.filepath
            from order_detail
            where order_detail.order_id =#arguments.id#
        </cfquery>
        <cfreturn get_order_detail/>
    </cffunction>
</cfcomponent>