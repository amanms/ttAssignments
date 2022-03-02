
<cfinclude template="top.cfm">
<!--- A search page to search products --->
<cfif (structKeyExists(url,'str') AND url.str NEQ '')>
    <cfset search_product = createObject('component','components/functions')>
    <cfset search_product_result = search_product.get_search_items(url.str)/>

<cfelse>
    <cflocation url="index.cfm">
</cfif>


<div class="body__overlay"></div>
        
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <cfif search_product_result.recordCount GT 0>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="htc__product__rightidebar">
                                
                                
                                <div class="row">
                                    <div class="shop__grid__view__wrap">
                                        <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                            <cfloop from="1" to="#search_product_result.recordCount#" index="i">
                                                <cfset row = queryGetRow('#search_product_result#',i)>

                                            
                                                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                                    <div class="category">
                                                        <div class="ht__cat__thumb">
                                                            <a href="product.cfm?id=<cfoutput>#row.id#</cfoutput>">
                                                                <img src="Images/<cfoutput>#row.filepath#</cfoutput>" alt="product images">
                                                            </a>
                                                        </div>
                                                        
                                                        <div class="fr__product__inner">
                                                            <h4><cfoutput>#row.name#</cfoutput></h4>
                                                            <ul class="fr__pro__prize">
                                                                <li><cfoutput>#row.price#</cfoutput></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </cfloop>
                                        </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    <cfelse>
                        <cfoutput>NO record exists</cfoutput>
                    </cfif>
                
				</div>
            </div>
        </section>
<cfinclude template="footer.cfm">