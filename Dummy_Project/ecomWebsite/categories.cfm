
<cfinclude template="top.cfm">
<cfset price_high_selected ="">
<cfset price_low_selected ="">
<cfset new_selected ="">
<cfset old_selected ="">
<cfset sort_order="">
<cfif structKeyExists(url,'sort')>
    <cfset sort = #url.sort#>
    <cfif #sort# EQ "price_high">
        <cfset sort_order = " order by products.price desc ">
        <cfset price_high_selected ="selected">
    </cfif>
    <cfif #sort# EQ "price_low">
        <cfset sort_order = " order by products.price asc ">
        <cfset price_low_selected ="selected">
    </cfif>
    <cfif #sort# EQ "new">
        <cfset sort_order = " order by products.id desc ">
        <cfset new_selected ="selected">
    </cfif>
    <cfif #sort# EQ "old">
        <cfset sort_order = " order by products.id asc ">
        <cfset old_selected ="selected">
    </cfif>
</cfif>
<cfif (structKeyExists(url,'id') AND #url.id# NEQ '')>
    <cfset cat_id = #url.id#>
    <cfif isNumeric('#cat_id#')>
        <cfset get_product = functions.get_product_category('','#cat_id#','','#sort_order#')>
    <cfelse>
        <cflocation url="index.cfm">
    </cfif>
<cfelse>
    <cflocation url="index.cfm">
</cfif>

<div class="body__overlay"></div>
        
        <section class="htc__product__grid bg__white ptb--100">
            <div class="container">
                <div class="row">
                    <cfif arrayLen(get_product) GT 0>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="htc__product__rightidebar">
                                <div class="htc__grid__top">
                                    <div class="htc__select__option">
                                        <select class="ht__select" onchange="sort_product_drop('<cfoutput>#cat_id#</cfoutput>')" id="sort_product_id">
                                            <option selected value="">Default sorting</option>
                                            <option value="price_low" <cfoutput>#price_low_selected#</cfoutput>>Sort by price low to high</option>
                                            <option value="price_high" <cfoutput>#price_high_selected#</cfoutput>>Sort by price high to low</option>
                                            <option value="new" <cfoutput>#new_selected#</cfoutput>>Sort by new first</option>
                                            <option value="old" <cfoutput>#old_selected#</cfoutput>>Sort by old first</option>

                                        </select>
                                    </div>
                                
                                </div>
                                
                                <div class="row">
                                    <div class="shop__grid__view__wrap">
                                        <div role="tabpanel" id="grid-view" class="single-grid-view tab-pane fade in active clearfix">
                                            <cfloop array="#get_product#" index="list">
                                            
                                                <div class="col-md-4 col-lg-3 col-sm-4 col-xs-12">
                                                    <div class="category">
                                                        <div class="ht__cat__thumb">
                                                            <a href="product.cfm?id=<cfoutput>#list['id']#</cfoutput>">
                                                                <img src="Images/<cfoutput>#list['filepath']#</cfoutput>" alt="product images">
                                                            </a>
                                                        </div>
                                                        
                                                        <div class="fr__product__inner">
                                                            <h4><cfoutput>#list['name']#</cfoutput></h4>
                                                            <ul class="fr__pro__prize">
                                                                <li><cfoutput>Rs#list['price']#</cfoutput></li>
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