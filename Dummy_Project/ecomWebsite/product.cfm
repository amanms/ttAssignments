
<cfinclude template="top.cfm">
<cfif (structKeyExists(url,'id'))>
    <cfset product = functions.get_product('','',url.id)>
<cfelse>
    <cflocation url="index.cfm">
</cfif>

        <section class="htc__product__details bg__white ptb--100">
            
            <div class="htc__product__details__top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
                            <div class="htc__product__details__tab__content">
                                
                                <div class="product__big__images">
                                    <div class="portfolio-full-image tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                            <img src="Images/<cfoutput>#product['1']['filepath']#</cfoutput>" alt="full-image">
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40">
                            <div class="ht__product__dtl">
                                <h2><cfoutput>#product['1']['name']#</cfoutput></h2>
                                <ul  class="pro__prize">
                                    <li><cfoutput>Rs#product['1']['price']#</cfoutput></li>
                                </ul>
                                <p class="pro__info"><cfoutput>#product['1']['description']#</cfoutput></p>
                                <div class="ht__pro__desc">
                                    <div class="sin__desc">
                                        <p><span>Qty</span>
                                            <select id="qty">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>

                                            </select>
                                        </p>
                                    </div>
                                    <div class="sin__desc align--left">
                                        <p><span>Categories:</span></p>
                                        <ul class="pro__cat__list">
                                            <li><cfoutput>#product['1']['categories']#</cfoutput></li>
                                        </ul>
                                    </div>
                                    
                                    </div>
									
                                </div>
								<a class="fr__btn" href="javascript:void(0)" onclick="manage_cart(<cfoutput>#product['1']['id']#</cfoutput>,'add')">Add to cart</a><br>
                                <div class="form-output login_msg">
                                    <p class="form-messege field_error"></p>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            
        </section>
        
        
										
<cfinclude template="footer.cfm">    