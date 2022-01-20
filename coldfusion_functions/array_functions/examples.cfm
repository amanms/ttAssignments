<!--- array clear function , returns an empty array --->
<cfscript>
    myArray=[1,2,3,4,5];
    WriteOutput(ArrayClear(myArray)); // Clears the array and returns True
    WriteDump(myArray); // Returns an empty array
</cfscript>

<!--- arrayContain function return true if an element to be search is present in array , case sensitive--->
<cfscript>
    myArray = [1,2,3,4,5,"car"];
    writeOutput(arrayContains(myArray,2)); //return true
    writeOutput(arrayContains(myArray,6)); // return false
    writeOutput(arrayContains(myArray,"car")); // return false

</cfscript>

<!--- arrayContainsNoCase , return true if element is present in array , case insensitive --->

<cfscript>
    myArray = ["car","toy"];
    writeOutput(arrayContainsNoCase(myArray,"Car")); //return true
    writeOutput(arrayContainsNoCase(myArray,"train")); // return false

</cfscript>
<br>

<!--- arraydelete function , delete the element and returns the updated array --->
<cfscript>
    myArray = ['a','b','c','d',1,2];
    writeOutput("Input array is:");
    writeDump(myArray)
    writeOutput("Updated array is:");
    arrayDelete(myArray,2);
    writeDump(myArray)
</cfscript>
<br>

<!--- arrayDeleteAt function , delete the element at particular index --->
<cfscript>
    myArray = ['a','b','c','d',1,2];
    writeOutput("Input array is:");
    writeDump(myArray)
    writeOutput("Updated array is:");
    arrayDeleteAt(myArray,2);
    writeDump(myArray)
</cfscript> 18004190072 3171 44

<br>

<!---arrayDeleteNoCase function , case insensitive , deletes the first occurance of element --->
<cfscript>
    myArray = ['car','b','c','d',1,2,'CAR'];
    writeOutput("Input array is:");
    writeDump(myArray)
    writeOutput("Updated array is:");
    arrayDeleteNoCase(myArray,'CAR');// deletes the 1st occurance of car
    writeDump(myArray)
</cfscript>

<br>

<!--- arrayEach function ,  loops over an array --->
<cfscript>
    myCities=["London","New York","Paris","Tokyo","Barcelona"];
    // Create a function that takes city as an argument  and prints the name of the cities as output
    // with delimiter as space
    ArrayEach(myCities,function(city){
          WriteOutput(city & "  ");
          }
    );
</cfscript>
<br>
<cf_socialplugin type = "like"
url = ""
layout = "box_count"
showfaces = "false"
verb = "like"
colorscheme = "light"
style = "height:200"
width = "400"
>