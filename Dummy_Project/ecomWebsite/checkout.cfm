<cfinclude template="top.cfm">

<cfset cart_total = 0>
<cfloop from="1" to="#cart_items.recordCount#" index="i">
    <cfset row = queryGetRow(cart_items,i)>
    <cfset product_id = row.product_id>
    <cfset price = row.price>
    <cfset quantity = row.quantity>
    <cfset cart_total = cart_total + (row.price * row.quantity)>
    <cfset product_name = row.name>
    <cfset filepath = row.filepath>
</cfloop>
<cfif structKeyExists(form,'submit')>
    <cfset order = functions.order_submit(address = form.address,city = form.city,
                            pincode = form.pincode,payment_type = form.payment_type,
                            user_id = session['USER_ID'],total_price = cart_total)>
    
        <cfquery name="insert_order">
            insert into order_detail(order_id,quantity,price,user_id,product_name,filepath)
            values('#order_id#','#quantity#','#price#','#user_id#','#product_name#','#filepath#')
        </cfquery>
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
                                                        <input type="text" name="address"  placeholder="Street Address" required>
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
                        <cfloop from="1" to="#cart_items.recordCount#" index="i">
                            <cfset row = queryGetRow(cart_items,i)>
                            <cfset row_price = row.price>
                            <cfset cart_total = cart_total + (row.price * row.quantity)>
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