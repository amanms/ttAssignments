<cfif structKeyExists(form,'logoutButton')>
  <cfset logoutUser()/>

</cfif>

<cfif structKeyExists(URL,'logout')>
  <cfset logoutUser()/>
</cfif>

<cfif structKeyExists(form,'loginButton')>
  <cfset arrayErrorMessage = validateUser(form.userName,form.password)/>
  <cfif arrayIsEmpty(arrayErrorMessage)>
    
    <cfset userLogedIn = loginUser(form.userName,form.password)/>
  </cfif>

</cfif>



<cffunction name="validateUser" access="public" output="false" returntype="array">
    <cfargument name = "userName" type="string" required="true">
    <cfargument name = "userPassword" type="string" required="true">
    <cfset var arrErrormsg  = arrayNew(1)/>
    <cfif NOT isValid('email',arguments.userName)>
        <cfset arrayPrepend(arrErrormsg,'Please provide a valid email')/>
    </cfif>
    <cfif arguments.userPassword EQ " ">
        <cfset arrayPrepend(arrErrormsg,'Please enter your password')/>
    </cfif>
    <cfreturn arrErrormsg/>
</cffunction>

<cffunction name = "loginUser" access="public" output="false" returntype="boolean">
    <cfargument name = "userName" type="string" required="true">
    <cfargument name = "userPassword" type="string" required="true">
    <cfset var isLoggedIn = false/>
    <cfquery  name="loginDetails">
      SELECT Id,firstName,lastName,userName,userPassword from Users
      WHERE userName = '#arguments.userName#' AND userPassword = '#arguments.userPassword#';
    </cfquery>
    <cfif loginDetails.recordCount EQ 1>
      <cflogin>
        <cfloginuser name="#loginDetails.firstName# #loginDetails.lastName# "password="#loginDetails.UserPassword#" roles=""/>
      </cflogin>
      <cfset session.loggedInUser = {'userFirstName' = loginDetails.firstName,'userLastName' = loginDetails.lastName,'userId' = loginDetails.Id}/>
      <cfset var isLoggedIn = true/>
    </cfif>
    <cfreturn isLoggedIn/>

</cffunction>

<cffunction name = "logoutUser" access="public" output="false" returntype="void">
  <cfset structDelete(session,'loggedInUser')/>
  <cflocation URL = "Login.cfm">
</cffunction>



<html>
    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
      <title>ColdFusion Registration system!</title>
    </head>
    <body>
  
      <cfdiv class="container mt-4">
      <h3>Please Login  Here:</h3>
      <hr>
      <cfform>
      <cfif structKeyExists(variables,'arrayErrorMessage') AND NOT arrayIsEmpty(arrayErrorMessage)>
        <cfoutput>
          <cfloop array="#arrayErrorMessage#" item="message">
            <p >#message#</p>
          </cfloop>
        </cfoutput>
      </cfif>
      <cfif structKeyExists(variables,'userLogedIn') AND userLogedIn EQ false>
        <p>user not found</p>
      </cfif>
      <cfif structKeyExists(session,'loggedInUser')>
        <cfoutput><p> Welcome #session.loggedInUser.userFirstName#</p></cfoutput>
        <p>Logged in</p>
        <p><a href = "Login.cfm?logout">Logout</a></p>
        <button type="submit" name = "logoutButton" class="btn btn-primary" onclick="#logoutUser()#">Log Out</button>

      <cfelse>
        <cfdiv class="form-group">
            <label for="username">User Name</label>
            <cfinput type="text" class="form-control" name ="userName"  placeholder="Email" required="true" validate="eMail" message="Please enter your email Id">
        </cfdiv>
        <cfdiv class="form-group">
          <label for="password">Password</label>
          <cfinput type="password" class="form-control" name="password" placeholder="Password" required="true" message="Please enter your password">
        </cfdiv>
        <button type="submit" name = "loginButton" class="btn btn-primary">Log in</button>
      </cfif>
      </cfform>
      </cfdiv>
  
    </body>
  </html>