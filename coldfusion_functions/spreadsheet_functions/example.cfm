<cfscript>
       /*Get data from table orders*/
       ArtOrders=QueryExecute("SELECT id,name,filepath,description,price FROM products
       ORDER BY id", [] ,{datasource="ecomWebsite"});
       /*Create spreadsheet object*/
       myObj=SpreadSheetNew("Art");
       SpreadSheetAddRow(myObj,"OrderId,Name,Filepath,Description,Price");
       SpreadsheetFormatRow(myObj, {bold=TRUE, alignment="center",color="red"}, 1);
       // Add rows to the spreadsheet
       SpreadsheetAddRows(myObj,ArtOrders);
       dirName=GetDirectoryFromPath(GetCurrentTemplatePath());
       // Add auto filters from rows A1 to F1
       SpreadSheetAddAutoFilter(myObj,"A1:F1");
       SpreadsheetWrite(myObj,"#dirName#ArtOrders.xls",true);
</cfscript>