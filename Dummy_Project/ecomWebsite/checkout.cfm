<cfinclude template="top.cfm">
<cfif (structKeyExists(session,'USER_LOGIN') AND #session['USER_LOGIN']# EQ 'yes')>
    <cfset userid = #session['USER_ID']#>
    <cfif isNumeric(#userid#)>
        <cfquery name="cartitems">
            select * from cart where userId = #userid#;
        </cfquery>
        <cfset count = #cartitems.recordCount#>
        <cfif #count# EQ 0>
            <cflocation url="index.cfm">
        </cfif>
    <cfelse>
        <cflocation url="logout.cfm">
    </cfif>
</cfif>

<cfset cart_total = 0>
<cfloop from="1" to="#cartitems.recordCount#" index="i">
    <cfset row = queryGetRow(cartitems,#i#)>
    <cfset price = #row.price#>
    <cfset quantity = #row.quantity#>
    <cfset cart_total = #cart_total# + (#row.price# * #row.quantity#)>
</cfloop>
<cfif structKeyExists(form,'submit')>
    <cfset address = #form.address#>
    <cfset city = #form.city#>
    <cfset pincode = #form.pincode#>
    <cfset payment_type = #form.payment_type#>
    <cfset user_id = #session['USER_ID']#>
    <cfset total_price = #cart_total#>
    <cfset payment_status = "pending">
    <cfif #payment_type# EQ 'COD'>
        <cfset payment_status = "success">
    </cfif>
    <cfset order_status = "pending">
    <cfquery name="insert" result="result">
        insert into orders (user_id,address,city,pincode,payment_type,total_price,payment_status,order_status)
        values('#user_id#','#address#','#city#','#pincode#','#payment_type#','#total_price#','#payment_status#','#order_status#')
    </cfquery>
    <cfset order_id = result.generatedkey>
    <cfoutput>#order_id#</cfoutput>
    <cfloop from="1" to="#cartitems.recordCount#" index="i">
        <cfset row = queryGetRow(cartitems,#i#)>
        <cfset product_id = #row.product_id#>
        <cfset price = #row.price#>
        <cfset quantity = #row.quantity#>
        <cfset cart_total = #cart_total# + (#row.price# * #row.quantity#)>
    
        <cfquery name="insert_order">
            insert into order_detail(order_id,product_id,quantity,price,user_id)
            values('#order_id#','#product_id#','#quantity#','#price#','#user_id#')
        </cfquery>
    </cfloop>
    <cfquery name="delete">
        delete from cart;
    </cfquery>
    <cflocation url="thankyou.cfm">
</cfif>

<div class="checkout-wrap ptb--100">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="checkout__inner">
                    <div class="accordion-list">
                        <div class="accordion">
                            
                            <div class="accordion__title">
                                Address Information
                            </div>
                            <form method="POST">
                                <div class="accordion__body">
                                    <div class="bilinfo">
                                        
                                            <div class="row">
                                                
                                                <div class="col-md-12">
                                                    <div class="single-input">
                                                        <input type="text" name="address" placeholder="Street Address" required>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="single-input">
                                                        <input type="text" name="city" placeholder="City/State" required>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="single-input">
                                                        <input type="text" name="pincode" placeholder="Post code/ zip" required>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                    </div>
                                </div>
                                <div class="accordion__title">
                                    payment information
                                </div>
                                <div class="accordion__body">
                                    <div class="paymentinfo">
                                        <div class="single-method">
                                            COD <input type="radio" name="payment_type" value="COD" required/>
                                            &nbsp;&nbsp;UPI <input type="radio" name="payment_type" value="UPI" required/>
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" name="submit"/>
                            <form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="order-details">
                    <h5 class="order-details__title">Your Order</h5>
                    <div class="order-details__item">
                        <cfset cart_total = 0>
                        <cfloop from="1" to="#cartitems.recordCount#" index="i">
                            <cfset row = queryGetRow(cartitems,#i#)>
                            <cfset row_price = #row.price#>
                            <cfset cart_total = #cart_total# + (#row.price# * #row.quantity#)>
                            <div class="single-item">
                                <div class="single-item__thumb">
                                    <img src="Images/<cfoutput>#row.filepath#</cfoutput>" alt="ordered item">
                                </div>
                                <div class="single-item__content">
                                    <a href="#"><cfoutput>#row.name#</cfoutput></a>
                                    <span class="price"><cfoutput>#row.quantity#</cfoutput></span>
                                    <span class="price"><cfoutput>#row.price#</cfoutput></span>
                                </div>
                                <div class="single-item__remove">
                                    <a href="javascript:void(0)" onclick="manage_cart(<cfoutput>#row.id#</cfoutput>,'remove')"><i class="icon-trash icons"></i></a>
                                </div>
                            </div>
                        </cfloop>
                    </div>
                    <div class="ordre-details__total">
                        <h5>Order total</h5>
                        <span class="price"><cfoutput>#cart_total#</cfoutput></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<cfinclude template="footer.cfm">