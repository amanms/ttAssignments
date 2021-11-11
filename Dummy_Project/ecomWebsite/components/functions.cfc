<cfcomponent output="false">
    <!--- function to get list of categories --->
    <cffunction name="get_category" access="public" output="false" returntype="array">
        <cfset category_array = arrayNew(1)>
        <cfquery name="category">
            select categories.id,categories.categories from categories order by categories asc;
        </cfquery>
        <cfloop from ="1" to = "#category.recordCount#" index="i">
            <cfset category_array[i] = queryGetRow('#category#',#i#)>
        </cfloop>
        <cfreturn category_array/>
    </cffunction>

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
    </cffunction>

    <cffunction name="get_product_category" access="public" output="false" returntype="array">
		<cfargument name="limit" type="string" required="false">
		<cfargument name ="cat_id" type="string" required="false">
		<cfargument name="product_id" type="string" required="false">
		<cfargument name="sort" type="string" required="false">
		
		<cfset productarray = arrayNew(1)>
		<cfset sql = "select products.*,categories.categories from products,categories where ">
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
			<cfset productarray[#i#] = queryGetRow('#getproduct#',#i#)>
		</cfloop>
		<cfreturn productarray/>
	</cffunction>

    
</cfcomponent>