
<cfinclude template="top.cfm">
<div class="wishlist-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="wishlist-content">
                    <form action="#">
                        <div class="wishlist-table table-responsive">
                            <table>
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
                                    <cfset uid = session['USER_ID']>
                                    <cfquery name="order">
                                        select * from orders where user_id = #uid#;
                                    </cfquery>
                                    <cfloop from="1" to="#order.recordCount#" index="i">
                                        <cfset row = queryGetRow(order,i)>
                                        <tr>
                                            <td class="product-add-to-cart"><a href="order_details.cfm"><cfoutput>#row.id#</cfoutput></a></td>
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
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<cfinclude template="footer.cfm">