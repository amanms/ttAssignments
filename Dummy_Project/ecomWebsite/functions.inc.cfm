
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
	<cffunction name="search_product" access="public" output="false" returntype="array">
		<cfargument name="search_str" type="string" required="false">
		<cfset productarray = arrayNew(1)>
		<cfset sql_query = "select products.*,categories.categories from products,categories where products.status=1 and products.categoryId=categories.id ">
		<cfif arguments.search_str NEQ ''>
			<cfset sql_query &= " and (products.name like '%#arguments.search_str#%') ">
		</cfif>
		<cfset sql_query &= " order by products.id desc">
		<cfquery name="getproduct" result="result">
			#sql_query#
		</cfquery>
		<cfloop from ="1" to = "#getproduct.recordCount#" index="i">
			<cfset productarray[i] = queryGetRow('#getproduct#',#i#)>
		</cfloop>
		<cfreturn productarray/>

	</cffunction>

	<cffunction name="get_product" access="public" output="false" returntype="array">
		<cfargument name="limit" type="string" required="false">
		<cfargument name ="cat_id" type="string" required="false">
		<cfargument name="product_id" type="string" required="false">
		<cfargument name="sort" type="string" required="false">
		
		<cfset productarray = arrayNew(1)>
		<cfset sql = "select products.*,categories.categories from products,categories where products.status=1 ">
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
		</cfquery>
		<cfloop from ="1" to = "#getproduct.recordCount#" index="i">
			<cfset productarray[#i#] = queryGetRow('#getproduct#',#i#)>
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
			<cfset sql &= " and products.categoryId=#arguments.cat_id# ">
		</cfif>
		<cfif arguments.product_id NEQ ''>
			<cfset sql &= " and products.id=#arguments.product_id# "> 
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

	<cffunction name="get_top_product" access="public" output="false" returntype="array">
		<cfargument name="limit" type="string" required="false">
		<cfset topproductarray = arrayNew(1)>
		<cfif arguments.limit NEQ ''>
			<cfquery name="topproduct">
				select TOP #arguments.limit# * from dbo.products order by id desc;
			</cfquery>
		</cfif>
		<cfloop from ="1" to = "#topproduct.recordCount#" index="i">
			<cfset topproductarray[i] = queryGetRow('#topproduct#',#i#)>
		</cfloop>
		<cfreturn topproductarray/>
	</cffunction>
	<cffunction name="cart_items" access="public" output="false" returntype="array">
		<cfargument name="id" type="string" required="true">
		<cfset cart_details = arrayNew(1)>
		<cfif arguments.id NEQ ''>
			<cfquery name="cartitems">
				select  * from dbo.cart where userId = #arguments.id#;
			</cfquery>
		</cfif>
		<cfloop from ="1" to = "#cartitems.recordCount#" index="i">
			<cfset cart_details[i] = queryGetRow('#cartitems#',#i#)>
		</cfloop>
		<cfreturn cart_details/>

	</cffunction>
	<!---<cffunction name="get_product" access="public" output="false" returntype="array">
		<cfargument name="top" type="string" required="false">
		<cfargument name="id" type="string" required="false">
		<cfset productarray = arrayNew(1)>
		<cfset sql = "select">
		<cfset str = " * from dbo.products where status = 1">
		<cfif arguments.top NEQ ''>
			<cfset top = " TOP #arguments.top#">
			<cfset sql &= #top#>
		</cfif>
		
		<cfset orderstr =  "order by id desc">
		<cfset sql &= #str# &= #orderstr#>
		<!---<cfif #arguments.type# EQ 'latest'>
			<cfset getproduct &= "order by id desc">
		</cfif>--->
		<cfquery name="getproduct" result="result">
			#sql#
		</cfquery>
		<cfloop from ="1" to = "#getproduct.recordCount#" index="i">
			<cfset productarray[#i#] = queryGetRow('#getproduct#',#i#)>
		</cfloop>
		<cfreturn productarray/>
	</cffunction>--->
