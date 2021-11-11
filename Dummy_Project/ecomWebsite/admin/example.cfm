<cfinclude template="functions.inc.cfm">

<cfset product = createObject('component','user')>
<cfdump var="#product.get_result()#"/>