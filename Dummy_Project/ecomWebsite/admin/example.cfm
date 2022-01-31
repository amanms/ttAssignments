<cfinclude template="functions.inc.cfm">

<cfset product = createObject('component','components/orders')>
<cfdump var="#product.order_details('15')#"/>