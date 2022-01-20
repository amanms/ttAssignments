<cfhttp
url="http://www.myassignments.com/rest/example/restService"
method="get"
port="80"
result="res">
<cfhttpparam type="header" name="Accept" value="application/json; charset=utf-8">
</cfhttp>
<cfdump var="#res#">