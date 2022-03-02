<!--- ArrayToList() Converts a one-dimensional array to a list. --->
<cfscript>
    // Declare an array
    myArray=["Google","Microsoft","Adobe","Facebook","Amazon"];
    myConvertedList=myArray.toList();
    WriteOutput(myConvertedList);
</cfscript>
<br>

<!--- Asc(string) Determines the ASCII value of a character.,returns The ASCII value of the first character of a string; if the string is empty, returns zero.--->
<cfscript>
    WriteOutput(Asc("") & "|"); //returns 0 since ASCII value of empty string is 0
    WriteOutput(Asc("a") & "|"); //returns 97 since ASCII value of "a" is 97
    WriteOutput(Asc("A") & "|"); //returns 65 since ASCIII value of "A" is 65
    WriteOutput(Asc("null") & "|"); //returns 110 since ASCII value of "n" is 110
    WriteOutput(Asc("Null")); //returns 78 since ASCII value of "N" is 78
</cfscript>
<br>
<!--- Chr(number) Converts a numeric value to a UCS-2 character., returns A character with the specified UCS-2 character code.--->
<cfscript>
    x = chr(0500); 
    writeOutput('character: #x#'); 
    x = asc(x); 
    writeOutput('<br>Unicode value: #x#');
</cfscript>
<br>
<!--- Cjustify(string, length)
    Centers a string in a field length.
    returns
    String, center-justified by adding spaces before or after the input parameter. If length is less than the length of the input parameter string, the string is returned unchanged.--->
<cfoutput>
    <cfset OriginalString="ColdFusion"/>
    <B>Original String (quoted):</B> "#OriginalString#"<BR>
    <B>Center-justified String (quoted):</B> "#CJustify("ColdFusion", 20)#"
</cfoutput>
<br>

<!--- Compare(string1, string2) Performs a case sensitive comparison of two strings.
    returns
    -1, if string1 is less than string2
    0, if string1 is equal to string2
    1, if string1 is greater than string2
--->
<cfscript>
    myString1="ColdFusion"
    myString2="Coldfusion"
    writeOutput(compare(myString1,myString2) & "<br/>") // Returns -1 as first string < second string
    myString3="ColdFusion"
    writeOutput(compare(myString1,myString3) & "<br/>") // Returns 0 as both strimgs are equal
    myString4="ColdFusion (2018 release)"
    writeOutput(compare(myString4,myString1)) // Returns 1 as first string > second string
</cfscript>
<br>
<!--- CompareNoCase(string1, string2) Performs a case-insensitive comparison of two strings.
    returns
    A negative number, if string1 is less than string2
    0, if string1 is equal to string2
    A positive number, if string1 is greater than string2
--->
<cfscript>
    myString1="ColdFusion"
    myString2="Coldfusion"
    myString3="ColdFusion (2016 release)"
    myString4="ColdFusion (2018 release)"
    writeOutput(CompareNoCase(myString1,myString2) & "<br/>") // Returns 0
    writeOutput(CompareNoCase(myString3,myString4) & "<br/>") // Returns -1
    writeOutput(CompareNoCase(myString4,myString3) & "<br/>") // Returns 1
</cfscript>
<br>
<!--- Encrypt(string, key, encoding, algorithm, IV_Salt, iterations) Encrypts a string using a specific algorithm and encoding method.
    returns String; can be much longer than the original string.
--->
<cfscript>
    myMessage = "Message to encrypt"
    key = generateSecretKey('AES');
    encryptedMsg = encrypt(myMessage,key,'AES', 'Base64');
    writeOutput(encryptedMsg);
</cfscript>
<br>
<!--- Decrypt(string, key, encoding, algorithm, IV_Salt, iterations) Decrypts a string that is encrypted using a standard encryption technique, including strings encrypted by the Encrypt function.
    returns An unencrypted string.
--->
<cfscript>
    myInfo={};
    myInfo.key = generateSecretKey("AES");
    myInfo.secret = "my secret";
    myInfo.encrypted=encrypt(myInfo.secret, myInfo.key, "AES", "Base64");
    myInfo.decrypted=decrypt(myInfo.encrypted, myInfo.key, "AES", "Base64");
    writeDump(myInfo);
</cfscript>
<br>

<!--- Find(substring, string , start ) Finds the first occurrence of a substring in a string, from a specified start position. The search is case sensitive.
    returns A number; the position of substring in string; or 0, if substring is not in string.
--->
<cfoutput> 
    <cfset stringToSearch = "The quick brown fox jumped over the lazy dog."> 
    #find("the",stringToSearch)#<br> 
    #find("the",stringToSearch,35)#<br> 
    #find("no such substring",stringToSearch)#<br> 
</cfoutput>
<br>

<!--- 
FindNoCase(substring, string , start )
Finds the first occurrence of a substring in a string, from a specified start position. If  substring  is not in  string , returns zero. The search is case-insensitive.
returns
The position of  substring  in  string ; or 0, if  substring  is not in  string .
---->
<cfset stringToSearch = "The quick brown fox jumped over the lazy dog."> 
stringToSearch = <cfoutput>#stringToSearch#</cfoutput><br> 
<p> 
Find Function:<br> 
Find("the",stringToSearch) returns <cfoutput>#find("the",stringToSearch)#</cfoutput><br> 
<p> 
FindNoCase Function:<br> 
FindNoCase("the",stringToSearch) returns <cfoutput>#FindNoCase("the",stringToSearch)#</cfoutput>
<br>
<!--- FindOneOf(set, string , start ) 
    Finds the first occurrence of any one of a set of characters in a string, from a specified start position. The search is case sensitive.
    returns
    The position of the first member of set found in string; or 0, if no member of set is found in string.
--->
<cfscript>
    stringToSearch = "The quick brown fox jumped over the lazy dog."
    writeOutput(findoneof("aeiou",stringToSearch) & "<br/>")
    writeOutput(findoneof("aeiou",stringToSearch,4) & "<br/>")
    writeOutput(findoneof("@%^*()",stringToSearch))
</cfscript>
<br>
<!--- FormatBaseN(number, radix)
    Converts number to a string, in the base specified by radix.
    returns
    String that represents number, in the base radix.
--->
<cfoutput>
    (FormatBaseN(10,2)) is : 
    <cfscript>
        writeOutput(FormatBaseN(10,2)); 
    </cfscript>
    <br>(FormatBaseN(1024,16)) is : 
    <cfscript>
        writeOutput(FormatBaseN(1024,16)); 
    </cfscript>
    
    <br>(FormatBaseN(125,10)) is : 
    <cfscript>
        writeOutput(FormatBaseN(125,10)); 
    </cfscript>
    
    <br>(FormatBaseN(10.75,2)) is : 
    <cfscript>
        writeOutput(FormatBaseN(10.75,2)); 
    </cfscript>
</cfoutput>
<br>
<h3>GetClientVariablesList Example</h3> 
<!--- The following line enables client variables. 
You would normally do this in Application.cfc.---> 
<cfapplication clientmanagement="yes"> 
<p>This example creates two client variables and deletes the User_ID client variable, 
if it exists in the list of client variables returned by GetClientVariablesList().</p> 
<cfset client.somevar = ""> 
<cfset client.User_ID = ""> 
<p>Client variable list: <cfoutput>#GetClientVariablesList()#</cfoutput></p> 
<cfif ListFindNoCase(GetClientVariablesList(), "User_ID") is not 0> 
Delete client.User_ID variable. 
<cfset temp = DeleteClientVariable("User_ID")> 
<p>Was variable "User_ID" Deleted? <cfoutput>#temp#</cfoutput> 
</cfif> 
<p>Amended Client variable list: <cfoutput>#GetClientVariablesList()# 
</cfoutput>

<br>
<!--- LCase(string) Converts the alphabetic characters in a string to lowercase.
    returns A string, converted to lowercase.
--->
<cfscript>
    myString1="THE ROLLING STONES"
    writeOutput(LCase(myString1) & "<br/>") // the rolling stones
    myString2="The Rolling Stones"
    writeOutput(LCase(myString2)) // the rolling stones
</cfscript>
<br>

<!--- Left(string, count) Returns up to the leftmost count characters in a string. --->
<cfscript>
    myString=Left("That's one small step for man, one giant leap for mankind.",25);
    WriteOutput(myString);
</cfscript>
<br>

<!--- Len(string or binary object) 
    Description
    Determines the length of a string or binary object.

    Returns
    Number; length of a string or a binary object.
--->
<cfscript>
    myString="The quick brown fox jumped over the lazy dog.";
    WriteOutput(Len(myString)); // Returns the length of the input string
</cfscript>
<br>

<!--- ListAppend(list, value [, delimiter, includeEmptyFields ]) Concatenates a list or element to a list.
    returns A string. --->
<cfscript>
    myList="John,Paul,George,Ringo";
    myListAppended=ListAppend(myList,"George Martin",","); // Delimiter is comma
    WriteOutput(myListAppended);
 </cfscript>
 <br>
 <!---<cfscript> 
    myList="John"; 
    myListAppended=ListAppend(myList,"George Martin","|");  
    WriteOutput(myListAppended); 
</cfscript>
<br>
<cfscript> 
    mylist="John,Paul" 
    writeOutput(ListAppend(list=mylist,value="Ringo,George,",delimiter=",",includeEmptyFields="true")) 
</cfscript>
<br>
<cfscript> 
    mylist="John,Paul,George" 
    writeOutput(ListAppend(list=mylist,value="Ringo,,",delimiter=",",includeEmptyFields="false")) 
</cfscript>
<br>
<cfscript> 
    mylist="John,Paul" 
    writeOutput(ListAppend(list=mylist,value="Ringo,George,",delimiter=",",includeEmptyFields="false")) 
</cfscript>
<br>
<cfscript> 
    mylist="John,Paul,," 
    writeOutput(mylist.Append("Ringo,George,",",","false")) 
</cfscript>--->

<!--- ListChangeDelims(list, newDelimiter [, delimiters, includeEmptyFields ]) Changes a list delimiter.
    returns
    A copy of the list, with each delimiter character replaced by newDelimiter.
--->
<cfscript>
    myList="a,b,c,d,e";
    myChangeDelims=ListChangeDelims(myList,"|"); //Replace comma in the list with pipe
    WriteOutput(myChangeDelims & "  ");
    myAnotherList="a,b|c|d,e|f";
    myCustomDelims=ListChangeDelims(myAnotherList,"@","|"); //Replace occurrence of "|" with "@"
    WriteOutput(myCustomDelims);
</cfscript>
<br>

<!--- ListContains(list, substring [, delimiters, includeEmptyFields ]) Determines the index of the first list element that contains a specified substring.
    returns Index of the first list element that contains  substring . If not found, returns zero. --->
<cfscript>
        myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
        WriteOutput(ListContains(myList,"Bangkok") & " | "); // Returns 2 since index of Bangkok is 2
        WriteOutput(ListContains(myList,"Singapore")); // Returns 0 since Singapore is not a part of the list
 </cfscript>

 <br>
 <!--- ListFirst(list [, delimiters, includeEmptyFields ])  
    returns The first element of a list. If the list is empty, returns an empty string.
 --->
 <cfscript>
    myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
    myFirst=ListFirst(myList);
    WriteOutput(myFirst); // Returns Tokyo
</cfscript>
<br>
<!--- ListLast(list [, delimiters, includeEmptyFields ]) returns The last element of the list.--->
<cfscript>
    myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
    WriteOutput(ListLast(myList)); //Returns the last element in the list, Shanghai
</cfscript>
<br>

<!--- ListLen() returns Determines the number of elements in a list. Integer; the number of elements in a list.
--->
<cfscript>
    myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
    outputLen=ListLen(myList);
    WriteOutput(outputLen); // Returns 6
</cfscript>
<br>
<!--- ListMap(list, callback [,delimiter, includeEmptyFields]) 
    Iterates over every entry of the list and calls the closure function to work on the item of the list. The returned value will be set at the same index in a new list and the new list will be returned.
    returns list --->
<cfscript>
    myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
    closure=function(item){ 
            return reverse(item); // Reverses each list item
            }
    myMap=ListMap(myList,closure);
    WriteOutput(myMap);
</cfscript>
<br>

<!--- ListPrepend(list, value [, delimiters, includeEmptyFields ]) Inserts an element at the beginning of a list.
    returns A copy of the list, with value inserted at the first position. --->
<cfscript>
    myList="Tokyo,Bangkok,Jakarta,Manila,Bangalore,Shanghai";
    myAppend=ListPrepend(myList,"Singapore");
    WriteOutput(myAppend);
 </cfscript>
 <br>

 <!--- ListReduce(list, callback, initialValue, [delimiter, includeEmptyFields])
    Iterates over each item of the list and calls the closure to work on the item. This function will reduce the list to a single value and will return the value.
 --->
 <cfscript>
    myList="23,54,87,98,11,35,91";
    closure=function(value1,value2){
          return (value1+value2/ListLen(myList)); // Calculates the average of the values in the list
    }
    MyVal=ListReduce(myList,closure,0); // Initial value is 0
    WriteOutput(#myVal#);
</cfscript>
<br>

<!--- ListRest(list [, delimiters, includeEmptyValues ]) Gets a list, without its first element.
    returns A copy of list, without the first element. If list has one element, returns an empty list.--->
<cfscript>
    // case 1
    myList="Delhi,Mumbai,Bangalore,Chennai"
    rest=ListRest(myList)
    writeOutput(rest & "<br/>")
    // case 2- using delimiter
    myList1="Delhi;Mumbai:Bangalore,Chennai"
    rest1=ListRest(myList1,";:,")
    writeOutput(rest1)
</cfscript>
<br>

<!--- ListRemoveDuplicates(list[, delimiter] [, ignoreCase]) Removes duplicate values (if they exist) in a list.--->
<cfscript> 
    myList = "one,two,three,four,five,one,five,three"
    newList = listRemoveDuplicates(myList); 
    //default delimeter is ","
    //newList contains "one,two,three,four,five"
    writeOutput(newList)
</cfscript>
<br>
<cfscript> 
    myList = "one,two,three,four,five,ONE,TWO,THREE"
    newList = listRemoveDuplicates(myList, ",", true); 
    //newList contains "one,two,three,four,five"
    writeOutput(newList)
</cfscript>
<br>

<!--- ListSetAt(list, position, value [, delimiters, includeEmptyValues ])Replaces the contents of a list element.--->
<cfscript>
    // case 1
    myList="Hulk,Superman,Batman,Joker"
    // replace Joker with Aquaman at position 4
    setAt=ListSetAt(myList,4,"Aquaman")
    writeOutput(setAt & "<br/>")
    // case 2: using a delimiter
    myList1="England|Spain|Germany|France"
    // replace Spain with Portugal at position 2
    setAt1=ListSetAt(myList1,2,"Portugal","|")
    writeOutput(setAt1)
</cfscript>