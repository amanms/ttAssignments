<cfcomponent output="false">
    <!--- function to get list of categories --->
    <cffunction name="get_category" access="public" output="false" returntype="array">
        <cfset category_array = arrayNew(1)>
        <cfquery name="category">
            select categories.id,categories.category_name from categories order by category_name asc;
        </cfquery>
        <cfloop from ="1" to = "#category.recordCount#" index="i">
            <cfset category_array[i] = queryGetRow('#category#',#i#)>
        </cfloop>
        <cfreturn category_array/>
    </cffunction>

    <!--- function to get products
    <cffunction name="get_product" access="public" output="false" returntype="array">
        <cfargument name="limit" type="string" required="false" default="">
        <cfargument name ="cat_id" type="string" required="false" default="">
        <cfargument name="product_id" type="string" required="false" default="">
        <cfargument name="sort" type="string" required="false" default="">
        
        <cfset productarray = arrayNew(1)>
        <!---<cfset sql = "select products.*,categories.categories from products,categories where products.status=1 ">
        <cfif arguments.cat_id NEQ ''>
            <cfset sql &= " and products.categoryId=#arguments.cat_id# ">
        </cfif>
        <cfif arguments.product_id NEQ ''>
            <cfset sql &= " and products.id=#arguments.product_id# "> 
        </cfif>
        
    
        <cfset sql &= " and products.categoryId=categories.id ">
        <cfset sql &= " order by products.id desc">
        <cfquery name="getproduct" result="result">
            #sql#
        </cfquery>--->
        <cfquery name="product">
            <cfif arguments.cat_id NEQ ''>
                select products.*,categories.categories from products,categories where products.categoryId = <cfqueryparam value="#arguments.cat_id#" cfsqltype="integer"> and products.categoryId=categories.id

            <cfelseif arguments.product_id NEQ ''>
                select products.*,categories.categories from products,categories where products.id = <cfqueryparam value="#arguments.product_id#" cfsqltype="integer"> and products.categoryId=categories.id 
            </cfif>
        </cfquery>
        
        <cfloop from ="1" to = "#product.recordCount#" index="i">
            <cfset productarray[i] = queryGetRow('#product#',i)>
        </cfloop>
        
        <cfreturn productarray/>
    </cffunction>--->

    <cffunction name="get_product_category" access="public" output="false" returntype="array">
		<cfargument name="limit" type="string" required="false" default="">
		<cfargument name ="cat_id" type="string" required="false" default="">
		<cfargument name="product_id" type="string" required="false" default="">
		<cfargument name="sort" type="string" required="false" default="">
		
		<cfset productarray = arrayNew(1)>
		<cfset sql = "select products.*,categories.category_name from products,categories where ">
		<cfif arguments.cat_id NEQ ''>
			<cfset sql &= "  products.categoryId=#arguments.cat_id# ">
		</cfif>
		<cfif arguments.product_id NEQ ''>
			<cfset sql &= "  products.id=#arguments.product_id# "> 
		</cfif>
		
		<cfset sql &= " and products.categoryId=categories.id ">

		<cfif arguments.sort NEQ ''>
			<cfset sql &= " #arguments.sort#">
		<cfelse>
			<cfset sql &= " order by products.id desc">
		</cfif>
		
		<cfquery name="getproduct" result="result">
			#sql#
		</cfquery>
		<cfloop from ="1" to = "#getproduct.recordCount#" index="i">
			<cfset productarray[i] = queryGetRow('#getproduct#',i)>
		</cfloop>
		<cfreturn productarray/>
	</cffunction>

    <!---function to fetch cart items --->
    <cffunction name="get_cart_items" access="public" output="true" returntype="query">
        <cfargument name="user_id" type="numeric" required="true">
        <cfquery name="fetch_cart_items">
            select cart.filepath,cart.name,cart.price,cart.quantity,cart.id,cart.product_id from cart where userId = #arguments.user_id#
        </cfquery>
        <cfreturn fetch_cart_items/>
    </cffunction>

    <!---function to manage cart items --->
    <cffunction name="manage_cart_items" access="remote" output="true" returntype="void">
        <cfargument name="pid" type="string" required="true">
        <cfargument name="qty" type="string" required="true">
        <cfargument name="type" type="string" required="true">
        <cfquery name="cart_items">
            select count(*) as product_count from cart where product_id = <cfqueryparam value="#pid#" cfsqltype="integer">
        </cfquery>
        <cfset var msg="">
        <cfif (structKeyExists(session,'USER_LOGIN') AND session['USER_LOGIN'] EQ 'yes')>
            <cfif type EQ 'add'>
                <cfif cart_items.product_count GT '0'>
                    <cfset msg = "itempresent">
                    <cfoutput>#msg#</cfoutput>
                <cfelse>
                    <cfset get_product = get_product_category(product_id=pid)>
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


    <!---function to place orders--->
    <cffunction name="order_submit" access="remote" output="true" returntype="void">
        <cfargument name="address" type="string" required="true"/>
        <cfargument name="city" type="string" required="true"/>
        <cfargument name="pincode" type="string" required="true"/>
        <cfargument name="payment_type" type="string" required="true"/>
        <cfargument name="user_id" type="numeric" required="true"/>
        <cfargument name="total_price" type="numeric" required="true"/>
        <cfset payment_status = "pending">
        <cfif payment_type EQ 'COD'>
            <cfset payment_status = "success">
        </cfif>
        <cfset order_status = "pending">
        <cfquery name="insert" result="result">
            insert into orders (user_id,
                                address,
                                city,
                                pincode,
                                payment_type,
                                total_price,
                                payment_status,
                                order_status)
            values('#arguments.user_id#',
                    '#arguments.address#',
                    '#arguments.city#',
                    '#arguments.pincode#',
                    '#arguments.payment_type#',
                    '#arguments.total_price#',
                    '#payment_status#',
                    '#order_status#')
        </cfquery>
        <cfset order_id = result.generatedkey>
        
        <cfloop from="1" to="#fetch_cart_items.recordCount#" index="i">
            <cfset row = queryGetRow(fetch_cart_items,i)>
            <cfset product_id = row.product_id>
            <cfset price = row.price>
            <cfset quantity = row.quantity>
            <cfset product_name = row.name>
            <cfset filepath = row.filepath>
    
            <cfquery name="insert_order">
                insert into order_detail(order_id,quantity,price,user_id,product_name,filepath)
                values('#order_id#','#quantity#','#price#','#user_id#','#product_name#','#filepath#')
            </cfquery>
        </cfloop>
        <cfquery name="delete">
            delete from cart;
        </cfquery>
        <cflocation url="thankyou.cfm"/>
    </cffunction>

    <!---function to fetch ordered items --->
    <cffunction name="get_orders" access="public" output="true" returntype="query">
        <cfargument name="user_id" type='numeric' required='true'>
        <cfquery name="order">
            select distinct(order_detail.id),order_detail.*,orders.* from order_detail,orders
            where order_detail.order_id =orders.id and order_detail.user_id=#arguments.user_id#;
        </cfquery>
        <cfreturn order/>

    </cffunction>

    <!--- function to get search results --->
    <cffunction name="get_search_items" access="public" output="true" returntype="query">
        <cfargument name="str" type="string" required="true" default="">
        <cfquery name="search">
            select products.*,categories.category_name from products,categories where 
            products.categoryId=categories.id and (products.name like '%#arguments.str#%' or products.description like '%#arguments.str#%')
            order by products.id desc 
        </cfquery>
        <cfreturn search/>
    </cffunction>
    
</cfcomponent>