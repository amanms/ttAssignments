
<cfinclude template="top.inc.cfm">
<cfif (structKeyExists(url,'id') AND #url.id# NEQ '')>
    <cfif isNumeric('#id#')>
        <cfset id = #url.id#>
    <cfelse>
        <cflocation url="order_master.cfm">
    </cfif>
	
</cfif>
<cfquery name="users">
	select * from users order by id desc;
</cfquery>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Order Detail </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
                    <table class="table">
                        <thead>
                            <tr>
                                
                                <th class="product-thumbnail">Product Name</th>
                                <th class="product-thumbnail">Product Image</th>
                                <th class="product-name">Quantity</th>
                                <th class="product-price"> price </th>
                                <th class="product-price"> Total Price </th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <cfquery name="order_details">
                                select * from orders where orders.id = #id#;
                            </cfquery>
                            
                            <cfquery name="order">
                                <!---select distinct(order_detail.id),order_detail.*,products.name,products.filepath from order_detail,products
                                 where order_detail.order_id=#id# and order_detail.product_id = products.id--->
                                 select distinct(order_detail.id),order_detail.* from order_detail
                                        where order_detail.order_id =#id#      
                            </cfquery>
                           
                            <cfloop from="1" to="#order.recordCount#" index="i">
                                <cfset row = queryGetRow(order,#i#)>
                                <cfset cart_total = 0>
                                <cfset cart_total = #cart_total# + (#row.price# * #row.quantity#)>
                                <tr>
                                    <td class="product-name"><cfoutput>#row.product_name#</cfoutput></td>
                                    <td class="product-name"><img src="../Images/<cfoutput>#row.filepath#</cfoutput>"</td>
                                    <td class="product-name"><cfoutput>#row.quantity#</cfoutput></td>
                                    <td class="product-name"><cfoutput>#row.price#</cfoutput></td>
                                    <td class="product-name"><cfoutput>#cart_total#</cfoutput></td> 
                                </tr>
                            </cfloop>
                            <tr>
                                <td colspan="3"></td>
                                <td class="product-name">Total Price</td>
                                <td class="product-name"><cfoutput>#order_details.total_price#</cfoutput></td>
                                
                            </tr>
                            
                        </tbody>
                        
                    </table>
                    <div id="address_details">
                        <strong>Address</strong>
                        <cfoutput>#order_details.address#</cfoutput>,  <cfoutput>#order_details.city#</cfoutput>,  <cfoutput>#order_details.pincode#</cfoutput><br/><br/>
                        
                        <strong>Order Status</strong>
                        <cfoutput>#order_details.order_status#</cfoutput>
                    </div>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>
<cfinclude template="footer.inc.cfm">