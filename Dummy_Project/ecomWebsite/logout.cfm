<cfinclude template="functions.inc.cfm">
<cfset structDelete(session,'USER_LOGIN')>
<cfset structDelete(session,'USER_ID')>
<cfset structDelete(session,'USER_NAME')>

<cflocation url="index.cfm">

