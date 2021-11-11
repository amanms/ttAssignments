<cfinclude template="top.cfm">
<!---<cfset result = get_product('','10022','11')>
<cfdump var="#result#"/>
<cfquery name="getdata" result="result">
    select * from dbo.products
</cfquery>
<cfdump var="#getdata#"/>
<cfoutput>#result.sql#</cfoutput><br>
<cfset x = "select">
<cfset y = " TOP 2">
<cfset y &= " * from dbo.products order by id">
<cfset x &= #y# >
<cfoutput>#x#</cfoutput><br>--->
<cfset result = functions.get_product(cat_id=3)>
<cfdump var="#result#" abort="true"/>