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
                                        
                                        <th class="product-thumbnail">Product</th>
                                        <th class="product-name"><span class="nobr">Product Name</span></th>
                                        <th class="product-stock-stauts"><span class="nobr"> Quantity </span></th>
                                        <th class="product-stock-stauts"><span class="nobr"> Total </span></th>
                                        <th class="product-price"><span class="nobr">Address</span></th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfset uid = #session['USER_ID']#>
                                    
                                    <cfquery name="order">
                                        select distinct(order_detail.id),order_detail.*,products.name,products.filepath,orders.* from order_detail,products,orders
                                        where order_detail.order_id =orders.id and order_detail.user_id=#uid# and order_detail.product_id=products.id;
                                    </cfquery>
                                    <cfloop from="1" to="#order.recordCount#" index="i">
                                        <cfset row = queryGetRow(order,#i#)>
                                        <cfset cart_total = 0>
                                        <cfset cart_total = #cart_total# + (#row.price# * #row.quantity#)>
                                        
                                        <tr>
                                            <td class="product-thumbnail"><img src="Images/<cfoutput>#row.filepath#</cfoutput>"></td>
                                            <th class="product-name"><span class="nobr"><cfoutput>#row.name#</cfoutput></span><br/>    
                                                Rs<cfoutput>#row.price#</cfoutput>
                                            </th>
                                            <th class="product-stock-stauts"><span class="nobr"><cfoutput>#row.quantity#</cfoutput></span></th>
                                            <th class="product-stock-stauts"><span class="nobr"><cfoutput>#cart_total#</cfoutput></span></th>
                                            <th class="product-price"><span class="nobr"><cfoutput>#row.address#</cfoutput></span><br/>
                                                <cfoutput>#row.city#</cfoutput><br/>
                                                <cfoutput>#row.pincode#</cfoutput>
                                            </th>
                                            



                                     
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