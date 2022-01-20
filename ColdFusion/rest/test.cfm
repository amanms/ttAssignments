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
            <cfform>
                <cfdiv class="form-group" >
                    <label for="firstname">First Name</label>
                    <cfinput type="text" class="form-control" name="firstName"  placeholder="First Name" onchange="validateFirstName(this.value)">
                    <small id = "firstNameFormat"></small>
                </cfdiv>
            </cfform>
        </cfdiv>
    </body>
</html>