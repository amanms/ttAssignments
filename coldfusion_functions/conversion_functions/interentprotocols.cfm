<html> 
    <head> 
    <title>IMAP Mail Client</title> 
    </head> 
    <body> 
    <!--- Replace your username and password with valid IMAP email account name and password. Replace "server address" with your IMAP server address---> 
    <cfimap 
    server = "imap.gmail.com" 
    username = "aman2441999@gmail.com" 
    action="open" 
    secure="yes" 
    password = "hyyvwsemffezukng" 
    connection = "test.cf.gmail"> 
    <!--- Retrieve header information from the mailbox. ---> 
    <cfimap 
    action="getHeaderOnly" 
    connection="test.cf.gmail" 
    name="queryname"> 
    <cfdump var="#queryname#"> 
    <cfimap 
    action="close" 
    connection = "test.cf.gmail"> 
    </body>
</html>
<!---<cfmail to="rajaman845@gmail.com" from="aman2441999@gmail.com" subject="example mail" >
    your Email Message!
</cfmail>--->