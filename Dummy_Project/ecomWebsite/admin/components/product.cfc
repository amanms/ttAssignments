<cfcomponent output="false">
    <!--- function to get product details --->
    <cffunction name="get_product" access="public" output="true" returntype="array">
        <cfargument name="id" type="string" required="false" default="">
        <cfargument name="product_name" type="string" required="false" default=""> 
        <cfset product_array = arrayNew(1)>
        <cfquery name="product">
            <cfif arguments.id NEQ ''>
                select * from dbo.products where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfelseif arguments.product_name NEQ '' >
                select products.id,products.name from products where name = <cfqueryparam value="#arguments.product_name#" cfsqltype="varchar">
            <cfelse>
                SELECT products.id,products.name,products.filePath,products.price,categories.categories from products,categories where products.categoryId = categories.id order by id desc;        
            </cfif>
        </cfquery>
        <cfloop from ="1" to = "#product.recordCount#" index="i">
            <cfset product_array[i] = queryGetRow('#product#',i)>
        </cfloop>
        <cfreturn product_array/> 
    </cffunction>

    <cffunction name="update_product" access="public" output="true" returntype="void">
        <cfargument name="id" type="string" required="false" default="">
        <cfargument name="categories_id" type="string" required="false" default="">
        <cfargument name="product_name" type="string" required="false" default="">
        <cfargument name="filepath" type="string" required="false" default="">
        <cfargument name="description" type="string" required="false" default="">
        <cfargument name="size" type="string" required="false" default="">
        <cfargument name="colour" type="string" required="false" default="">
        <cfargument name="price" type="string" required="false" default="">
        <cfquery name="update_product">
            <cfif (arguments.id NEQ '')>
                update products 
                set categoryId = <cfqueryparam value="#arguments.categories_id#" cfsqltype="integer">,
                    name = <cfqueryparam value="#arguments.product_name#" cfsqltype="varchar">,
                    filepath = <cfqueryparam value="#arguments.filepath#" cfsqltype="varchar">,
                    description = <cfqueryparam value="#arguments.description#" cfsqltype="varchar">,
                    size = <cfqueryparam value="#arguments.size#" cfsqltype="varchar">,
                    colour = <cfqueryparam value="#arguments.colour#" cfsqltype="varchar">,
                    price = <cfqueryparam value="#arguments.price#" cfsqltype="integer">
                where id = <cfqueryparam value="#arguments.id#" cfsqltype="integer">
            <cfelse>
                insert into dbo.products(categoryId,name,filepath,description,size,colour,price) 
				values(<cfqueryparam value="#arguments.categories_id#" cfsqltype="integer">,<cfqueryparam value="#arguments.product_name#" cfsqltype="varchar">,<cfqueryparam value="#arguments.filepath#" cfsqltype="varchar">,
                <cfqueryparam value="#arguments.description#" cfsqltype="varchar">,<cfqueryparam value="#arguments.size#" cfsqltype="varchar">,<cfqueryparam value="#arguments.colour#" cfsqltype="varchar">,<cfqueryparam value="#arguments.price#" cfsqltype="integer">)
            </cfif>
        </cfquery>
        

    </cffunction>
</cfcomponent>