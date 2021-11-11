<cfinclude template="top.inc.cfm">

<cfset index = createObject('component','components/index')>
<cfset total_users = index.user_count()>
<cfset total_product = index.product_count()>
<cfset total_order = index.order_count()>

<div class="cardBox">
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_users#</cfoutput></div>
            <div class="cardName">User Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-people-fill"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_product#</cfoutput></div>
            <div class="cardName">Product Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-bag-fill"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_order#</cfoutput></div>
            <div class="cardName">Order Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-file-check-fill"></i>
        </div>
    </div>
</div>
<cfinclude template="footer.inc.cfm">