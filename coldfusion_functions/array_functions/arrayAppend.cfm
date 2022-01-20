<!--- array append function --->

<cfscript>
    myArray=[1,2,3,4,5];
    ArrayAppend(myArray,6,"true");
    writeoutput(serializeJSON(myArray)); //adds the value 6 to myArray
</cfscript>

<cfscript>
    myArray=[1,2,3,4,5];
    arrayAppend(myArray,[6,7],'false'); // merge=false
    writeDump(myArray);// adds the complete array as a single element
</cfscript>
<cfscript>
    myArray=[1,2,3,4,5];
    arrayAppend(myArray,[6,7],'true'); // merge = true
    writeDump(myArray); // adds the individual element one by one of the new array
</cfscript>