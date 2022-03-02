<cfinclude template="top.cfm">
<cfif (structKeyExists(session,'USER_LOGIN') AND session['USER_LOGIN'] EQ 'yes')>
    <cfset userid = session['USER_ID']>
    <cfif isNumeric(userid)>
        
        <cfset cart_items = functions.get_cart_items(user_id=userid)>
    <cfelse>
        <cflocation url="logout.cfm">
    </cfif>
<cfelse>
    <cflocation url="logout.cfm">
</cfif>

<div class="cart-main-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <form action="#">               
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                                <tr>
                                    <th class="product-thumbnail">products</th>
                                    <th class="product-name">name of products</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <cfloop from="1" to="#cart_items.recordCount#" index="i">
                                    <cfset row = queryGetRow(cart_items,i)>
                                    
                                    

                                    <tr>
                                        <td class="product-thumbnail"><a href="#"><img src="Images/<cfoutput>#row.filepath#</cfoutput>" alt="product img" /></a></td>
                                        <td class="product-name"><a href="#"><cfoutput>#row.name#</cfoutput></a>
                                            
                                        </td>
                                        <td class="product-price"><span class="amount"><cfoutput>Rs#row.price#</cfoutput></span></td>
                                        <td class="product-quantity"><input type="number" id="<cfoutput>#row.id#</cfoutput>qty"  value="<cfoutput>#row.quantity#</cfoutput>" min="1" max="10"/>
                                            <br/><a href="javascript:void(0)" onclick="manage_cart(<cfoutput>#row.id#</cfoutput>,'update')">update</a>
                                        </td>
                                        <td class="product-subtotal"><cfoutput>Rs#row.quantity*row.price#</cfoutput></td>
                                        <td class="product-remove"><a href="javascript:void(0)" onclick="manage_cart(<cfoutput>#row.id#</cfoutput>,'remove')"><i class="icon-trash icons"></i></a></td>
                                    </tr>

                                </cfloop>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="buttons-cart--inner">
                                <div class="buttons-cart">
                                    <a href="index.cfm">Continue Shopping</a>
                                </div>
                                <div class="buttons-cart checkout--btn">
                                    <a href="checkout.cfm">checkout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </form> 
            </div>
        </div>
    </div>
</div>

<cfinclude template="footer.cfm">
