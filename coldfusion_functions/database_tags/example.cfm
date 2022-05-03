
<html>
    <form action = "cfinsert.cfm" method = "post"> 
        <pre> 
        Email: <input type = "Text" name = "Email"> 
        From: <input type = "Text" name = "FromUser"> 
        Subject: <input type = "Text" name = "Subject"> 
        Message: <textarea name = "MessageText" COLS = "40" ROWS = "6"></textarea> 
        Date Posted: <cfoutput>#DateFormat(Now())#</cfoutput> 
        <!--- Dynamically determine today's date. ---> 
        <input type = "hidden" 
        name = "Posted" value = "<cfoutput>#Now()#</cfoutput>"> 
        </pre> 
        <input type = "Submit" 
        name = "" value = "insert my comment"> 
        </form>
</html>
<br>

<!--- cfdbinfo ---->
<cfset datasrc = "ecomWebsite"> 
<cfdbinfo
type="columns" 
datasource="#datasrc#"
dbname="DummyProject"
table="admin"
name="dbdata"> 
<cfoutput> 
<cfdump var="#dbdata#" abort="true">
The #datasrc# data source has the following databases:<br /> 
</cfoutput> 
<table border="1"> 
<tr> 
<th valign="top" align="left">Database name</th><th>Type</th> 
</tr> 
<cfoutput query="dbdata"> 
<tr> 
<td>#dbdata.TABLE_NAME#</td><td>#dbdata.TABLE_TYPE#</td> 
</tr> 
</cfoutput> 
</table>

<br>

