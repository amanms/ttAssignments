<cfif structKeyExists(form,'formSubmit')>
  <cfset arrayMessage = arrayNew(1)/>
  <cfif form.firstName EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a first name')/>
  </cfif>
  <cfif form.lastName EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a last name')/>
  </cfif>
  <cfif form.userName EQ '' OR NOT isValid("eMail",form.userName)>
    <cfset arrayAppend(arrayMessage,'Please provide a valid email')/>
  </cfif>
  <cfif form.password EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a valid password')/>
  </cfif>
  <cfif form.address EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a valid address')/>
  </cfif>
  <cfif form.country EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a valid country ')/>
  </cfif>
  <cfif form.state EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a valid state')/>
  </cfif>
  <cfif form.zipcode EQ ''>
    <cfset arrayAppend(arrayMessage,'Please provide a valid zipcode')/>
  </cfif>
  <cfquery name="usercount">
    SELECT * from dbo.Users
  </cfquery>
  <cfoutput>#usercount#</cfoutput>
  <!---<cfif arrayIsEmpty(arrayMessage)>
    <cfset form.password = generateSecretKey("AES")/>
    <cfquery name = "validateUsername">
      SELECT userName from dbo.Users
      WHERE  userName = '#form.userName#'
    </cfquery>
    <cfdump var="#validateUsername.recordCount#"></cfdump>

    <cfif validateUsername.recordCount eq >
      <cfoutput><p>data already exists</p></cfoutput>
    <cfelse>
      <cfquery>
        INSERT INTO dbo.Users
        (firstName,lastName,userName,userPassword,address,country,state,zipcode)
        VALUES
        ('#form.firstName#','#form.lastName#','#form.userName#','#form.password#','#form.address#','#form.country#','#form.state#','#form.zipcode#');
  
      </cfquery>
  

    </cfif>
    

  </cfif>--->
</cfif>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/registrationform.css">
    <title>ColdFusion Registration system!</title>
  </head>
  <body>

    <cfdiv class="container mt-4">
        <h3>Please Register Here:</h3>
        <hr>
        <cfform >
            <cfdiv class="form-group" >
              <label for="firstname">First Name</label>
              <cfinput type="text" class="form-control" name="firstName"  placeholder="First Name" onchange="validateFirstName(this.value)">
              <small id = "firstNameFormat"></small>
            </cfdiv>

            <cfdiv class="form-group">
              <label for="lastname">Last Name</label>
              <cfinput type="text" class="form-control" name ="lastName"  placeholder="Last Name" onchange="validateLastName(this.value)">
              <small id = "lastNameFormat"></small>
            </cfdiv>

            <cfdiv class="form-group">
                <label for="username">User Name</label>
                <cfinput type="text" class="form-control" name ="userName"  placeholder="Email" onchange="validateEmail(this.value)">
                <small id = "emailFormat"></small>
            </cfdiv>

            <cfdiv class="form-group">
              <label for="password">Password</label>
              <cfinput type="password" class="form-control" name="password" placeholder="Password" onchange="validatePassword(this.value)">
              <small id = "passwordFormat"></small>
            </cfdiv>

            <cfdiv class="form-group">
              <label for="Address">Address</label>
              <cfinput type="text" class="form-control" name="address" placeholder="Flat No/city" onchange="validateAddress(this.value)">
              <small id="addressFormat"></small>
            </cfdiv>

            <cfdiv class="form-group ">
                <label for="country">Country</label>
                <cfinput type="text" class="form-control" name="country" placeholder="Country" onchange="validateCountry(this.value)">
                <small id = "countryFormat"></small>
            </cfdiv>

            <cfdiv class="form-group ">
              <label for="state">State</label>
              <cfinput type="text" class="form-control" name="state" placeholder="State" onchange="validateState(this.value)">
              <small id = "stateFormat"></small>
            </cfdiv>

            <cfdiv class="form-group ">
              <label for="zipcode">Zipcode</label>
              <cfinput type="text" class="form-control" name="zipcode" placeholder="Zipcode" onchange="validateZipcode(this.value)">
              <small id = "zipcodeFormat"></small>
            </cfdiv>

            <button type="submit" name = "formSubmit" class="btn btn-primary" onclick="onSubmit()">Sign in</button>
            <a href="login.cfm">
              <button type="button" name = "loginbutton" class="btn btn-primary">Log in</button>

            </a>
        </cfform>
    </cfdiv>
    <cfif isDefined("arrayMessage") AND NOT arrayIsEmpty(arrayMessage)>
      <cfoutput>
        <cfloop array="#arrayMessage#" index="errormessage">
          <p>#errormessage#</p>
        </cfloop>
      </cfoutput>

    </cfif>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src = "../js/registrationform.js"></script>
  </body>
</html>
