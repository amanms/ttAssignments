<cfinclude template="top.cfm">
        <section class="htc__category__area ptb--100">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="section__title--2 text-center">
                            <h2 class="title__line">New Arrivals</h2>
                            <p>But I must explain to you how all this mistaken idea</p>
                        </div>
                    </div>
                </div>
                <div class="htc__product__container">
                    <div class="row">
                        <div class="product__list clearfix mt--30">
							
                            <cfset get_product = get_top_product('4')>
                            <cfloop array="#get_product#" index="list">

                                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                    <div class="category">
                                        <div class="ht__cat__thumb">
                                            <a href="product.cfm?id=<cfoutput>#list['id']#</cfoutput>">
                                                <img src="Images/<cfoutput>#list['filepath']#</cfoutput>" alt="product images">
                                            </a>
                                        </div>
                                        
                                        <div class="fr__product__inner">
                                            <h4><a href="product-details.html"><cfoutput>#list['name']#</cfoutput></a></h4>
                                            <ul class="fr__pro__prize">
                                                <li><cfoutput>#list['price']#</cfoutput></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            
                            </cfloop>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
<cfinclude template="footer.cfm">      