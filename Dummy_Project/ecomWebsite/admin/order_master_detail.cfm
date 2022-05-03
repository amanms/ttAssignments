<!--- Order details page for admin to track orders --->
<cfinclude template="top.inc.cfm">
<cfset orders = createObject('component','components/orders')>
<cfset order_master = orders.orders()>

<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
    <cfif isNumeric(url.id)>
        <cfset id = url.id>
        <cfset order_master_detail = orders.order_details('#id#')>
    <cfelse>
        <cflocation url="order_master.cfm">
    </cfif>
	
</cfif>

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
                           
                            <cfloop from="1" to="#order_master_detail.recordCount#" index="i">
                                <cfset row = queryGetRow(order_master_detail,i)>
                                <cfset cart_total = 0>
                                <cfset cart_total = cart_total + (row.price * row.quantity)>
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