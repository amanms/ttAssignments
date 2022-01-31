
<cfinclude template="top.inc.cfm">
<cfset orders = createObject('component','components/orders')>
<cfset order_master = orders.orders()>
<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Order Master </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
                    <table class="table">
                        <thead>
                            <tr>
                                
                                <th class="product-thumbnail">Order Id</th>
                                <th class="product-name"><span class="nobr">Order Date</span></th>
                                <th class="product-price"><span class="nobr">Address</span></th>
                                <th class="product-stock-stauts"><span class="nobr"> Payment Type </span></th>
                                <th class="product-stock-stauts"><span class="nobr"> Payment Status </span></th>
                                <th class="product-stock-stauts"><span class="nobr"> Order Status </span></th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <cfloop from="1" to="#order_master.recordCount#" index="i">
                                <cfset row = queryGetRow(order_master,i)>
                                <tr>
                                    <td class="product-add-to-cart"><a href="order_master_detail.cfm?id=<cfoutput>#row.id#</cfoutput>"><cfoutput>#row.id#</cfoutput></a></td>
                                    <td class="product-name"><cfoutput>#row.added_on#</cfoutput></td>
                                    <td class="product-name"><cfoutput>#row.address#</cfoutput><br/>
                                        <cfoutput>#row.city#</cfoutput>
                                        <cfoutput>#row.pincode#</cfoutput>
                                    
                                    </td>
                                    <td class="product-name"><cfoutput>#row.payment_type#</cfoutput></td>
                                    <td class="product-name"><cfoutput>#row.payment_status#</cfoutput></td>
                                    <td class="product-name"><cfoutput>#row.order_status#</cfoutput></td>

                                    
                                </tr>
                            </cfloop>
                            
                        </tbody>
                        
                    </table>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>
<cfinclude template="footer.inc.cfm">