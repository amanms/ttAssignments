<!--- Dashboard page to display total number of users,products and orders --->
<cfinclude template="top.inc.cfm">
<!--- instance of toatl count details component--->
<cfset total_count_obj = createObject('component','components/total_count')>

<div class="cardBox">
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_count_obj.get_total_count(user_count='user_count')#</cfoutput></div>
            <div class="cardName">User Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-people-fill"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_count_obj.get_total_count(product_count='product_count')#</cfoutput></div>
            <div class="cardName">Product Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-bag-fill"></i>
        </div>
    </div>
    <div class="card">
        <div>
            <div class="numbers"><cfoutput>#total_count_obj.get_total_count(order_count='order_count')#</cfoutput></div>
            <div class="cardName">Order Count</div>
        </div>
        <div class="iconBox">
            <i class="bi bi-file-check-fill"></i>
        </div>
    </div>
</div>
<cfinclude template="footer.inc.cfm">