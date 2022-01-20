<!--- ArrayToList function , converts a 1-D array to list --->
<cfscript>
    // Declare an array
    myArray=["Google","Microsoft","Adobe","Facebook","Amazon"];
    myConvertedList=myArray.toList();
    WriteOutput(myConvertedList);
</cfscript>
<br>

<!--- BinaryDecode function , Converts a string to a binary object. Used to convert binary data that has been encoded into string format back into binary data. --->

<cfscript>
 
        function base64ToHex( String base64Value ){
            var binaryValue = binaryDecode( base64Value, "base64" );
            var hexValue = binaryEncode( binaryValue, "hex" );
            return( lcase( hexValue ) );
        }
        function base64ToString( String base64Value ){
            var binaryValue = binaryDecode( base64Value, "base64" );
            var stringValue = toString( binaryValue );
            return( stringValue );
        }
        function hexToBase64( String hexValue ){
            var binaryValue = binaryDecode( hexValue, "hex" );
            var base64Value = binaryEncode( binaryValue, "base64" );
            return( base64Value );
        }
        function hexToString( String hexValue ){
            var binaryValue = binaryDecode( hexValue, "hex" );
            var stringValue = toString( binaryValue );
            return( stringValue );
        }
        function stringToBase64( String stringValue ){
            var binaryValue = stringToBinary( stringValue );
            var base64Value = binaryEncode( binaryValue, "base64" );
            return( base64Value );
        }
        function stringToBinary( String stringValue ){
            var base64Value = toBase64( stringValue );
            var binaryValue = toBinary( base64Value );
            return( binaryValue );
        }
        function stringToHex( String stringValue ){
            var binaryValue = stringToBinary( stringValue );
            var hexValue = binaryEncode( binaryValue, "hex" );
            return( lcase( hexValue ) );
        }
        // ------------------------------------------------------ //
        // ------------------------------------------------------ //
        // ------------------------------------------------------ //
        // ------------------------------------------------------ //
        // Let's create a string value to test with.
        message = "GoodMorning! What's Up?";
        writeOutput( "Original :: " & message );
        writeOutput( "<br />" );
        // Now, let's check to the String-to-XXX conversions.
        writeOutput( "<br />" );
        messageAsHex = stringToHex( message );
        writeOutput( "Hex :: " & messageAsHex );
        writeOutput( "<br />" );
        messageAsBase64 = stringToBase64( message );
        writeOutput( "Base64 :: " & messageAsBase64 );
        writeOutput( "<br />" );
        messageAsBinary = stringToBinary( message );
        writeOutput( "Binary :: B" & arrayLen( messageAsBinary ) );
        writeOutput( "<br />" );
         
</cfscript>
<br>
<!--- CharsetEncode , Uses the specified encoding to convert binary data to a string. , retruns string --->
<h3>Character Encoding Conversion Example</h3> 
 
<!--- Do the conversions. --->
<cfscript> 
myString="Hello ColdFusion"
charEncoding="windows-1252"
chardecode=CharsetDecode(myString, charEncoding); 
charencode=CharsetEncode(chardecode, charEncoding); 
</cfscript> 
  
<!--- Display the input values and results. --->
<cfoutput> 
<h3>Parameter Settings</h3> 
<p><b>The string:</b> 
#myString#</p> 
<p><b>The character encoding:</b> #charEncoding#</p> 
  
<h3>Results of the operations:</h3> 
<p><b>Dump of the string converted to a binary object by CharsetDecode: 
</b> 
<cfdump var="#chardecode#"></p> 
<p><b>The binary object converted back to a string by CharsetEncode: 
</b> 
#charencode#</p> 
</cfoutput>
<br>

<!--- DeserializeJSON function , Converts a JSON  string data representation into CFML data, such as a CFML structure or array --->
<cfscript>
    record=deserializeJSON(
  '{
  "firstname": "John",
  "lastname": "Smith",
  "age": "36",
  "address":{
        "number":"12345",
        "street":"my_street",
        "city":"any city"
  }
  }'
  );
    writeOutput(record.firstname & " ");
    writeOutput(record.lastname & " ");
    writeOutput(record.address.number & " ");
    writeOutput(record.address.street & " ");
</cfscript>
<br>
<!--- hash function , Converts a variable-length string to a fixed-length string --->
<cfscript>
    // SHA-256 example
    writeOutput(hash("an important string", "SHA-256", "UTF-8")) 
    
</cfscript>
<br>
<cfscript>
    // SHA-512 example
    writeOutput(hash("an important string", "SHA-512", "UTF-8")) 
    
</cfscript>
<br>
<!--- HMac(Hash-based Message Authentication Code) function ,used to verify the data integrity and authenticity of a message transmitted. It involves a cryptographic hash function in combination with a secret key --->
<cfscript>
    //hmac(message,key,algorithm,encoding)
    x=hmac("Hi There","key1","HMACRIPEMD160")
    writeOutput(x) 
</cfscript>
<br> 
<!--- listToArray function --->
<cfset list = "red,orange,&yellow,green,&blue,violet"> 
<cfset arr = listToArray (list, ",&",false,true)>
<cfdump var="#arr#"/>
<br>
<cfscript>
    myList="ten;twenty;thirty;fort;fifty;sixty;;seventy;;;eighty"; 
    myArray=listToArray(myList,";",false,true); // Using includeEmptyFields=false
    WriteDump(myArray);
</cfscript>
<cfscript>
    myList="ten;twenty;thirty;fort;fifty;sixty;;seventy;;;eighty"; 
    myArray=listToArray(myList,";",true,true); // Using includeEmptyFields=true
    WriteDump(myArray);
</cfscript>
<br>
<!--- base64 --->
<cfscript>
    myid="johndoe"
    mypwd="john@123"
    myEncodedPwd=ToBase64(myid & ":" & mypwd)
    writeOutput(myEncodedPwd)
</cfscript>
<br>
<!--- toBinary function, returns a binary representation of the data --->
<cfscript>
    strValue = "Sgt. Pepper's Lonely Hearts Club Band"
    strBase64Value = ToBase64(strValue)
    strNewValue = ToString(ToBinary(strBase64Value))
    writeOutput("Base 64 is: " & strBase64Value & "<br/>") 
    writeOutput("Binary value is: " & strNewValue) 
</cfscript>
<br>
<cfset thisString="hello world">
<script type="text/javascript" language="JavaScript">
<cfoutput>#toScript(thisString, "jsVar")#</cfoutput>
</script>
<br>
<cfscript>
    bookName ="Hound of Baskervilles";
    myURL='http://site.com?book=#EncodeForURL(bookName)#';
    WriteOutput(myURL & "<br/>"); // http://site.com?book=Hound+of+Baskervilles
    writeOutput(urlDecode(myURL)) // http://site.com?book=Hound of Baskervilles
</cfscript>
<br>
<!--- val function , converts numeric characters that occur at the beginning of a string to a number,
    number or zero --->
<cfscript>
    val1="234A56?7"
    writeOutput(Val(val1) & "<br/>")
    val2="234'5678'9?'"
    writeOutput(Val(val2) & "<br/>")
    val3="BG234"
    writeOutput(Val(val3) & "<br/>")
    val4="0"
    writeOutput(Val(val4) & "<br/>")
</cfscript>
    