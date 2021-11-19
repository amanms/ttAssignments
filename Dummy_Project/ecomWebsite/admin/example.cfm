<cfinclude template="functions.inc.cfm">

<cfset product = createObject('component','components/index')>
<cfdump var="#product.get_total_count(order_count='order_count')#"/>