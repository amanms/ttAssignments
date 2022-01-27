<cfinclude template="functions.inc.cfm">

<cfset product = createObject('component','components/delete_record')>
<cfset product.delete_category(17)>
<cfdump var="#product.records#"/>