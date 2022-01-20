<!--- This is the cfhttpparamexample.cfm page that receives and processes the Post request. Its response body is the generated HTML output. ---> 
<h3>Output the passed variables</h3> 
<cfoutput> 
Form variable: #form.form_test# 
<br>URL variable: #URL.url_test# 
<br>Cookie variable: #Cookie.cookie_test# 
<br>CGI variable: #CGI.cgi_test#<br> 
<br>Note that the CGI variable is URL encoded. 
</cfoutput>