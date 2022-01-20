<!--- This example consists of two CFML pages. 
The first page posts to the second. ---> 
<!--- The first, posting page. 
This page posts variables to another page and displays the body of the response from 
the second page. Change the URL and port as necessary for your environment. ---> 
<!---<cfhttp 
method="post" 
url="http://www.myassignments.com/ColdFusion/cfhttpparamexample.cfm" 
port="80" 
throwonerror="Yes"> 
<cfhttpparam name="form_test" type="FormField" value="This is a form variable"> 
<cfhttpparam name="url_test" type="URL" value="This is a URL variable"> 
<cfhttpparam name="cgi_test" type="CGI" value="This is a CGI variable"> 
<cfhttpparam name="cookie_test" type="Cookie" value="This is a cookie"> 
</cfhttp> 
<!--- Output the results returned by the posted-to page. ---> 
<cfoutput> 
#cfhttp.fileContent# 
</cfoutput>--->
<cfquery name="result" datasource="ecomWebsite" result="rs">
    select name from users where id = '1'
</cfquery>
<cfdump var="#result.name#"/>