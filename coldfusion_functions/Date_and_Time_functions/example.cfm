<!--- CreateDate(year, month, day) Creates a date/time object., returns A date/time value. --->
<cfscript>
    year = 2018;
    month = 11;
    day = 02;
    myDate=CreateDate(year,month,day)
    writeOutput("The date is: " & myDate);
</cfscript>
<br>

<!--- CreateDateTime(year, month, day, hour, minute, second) Creates a date/time object. ,  returns A date/time value.--->
<cfscript>
    // Create date time object and display it
    WriteOutput(CreateDateTime(2016,2,16,16,45,34) & " | "); // Create object for specified time
    WriteOutput(now()); // Create object for now()
</cfscript>
<br>

<!--- CreateODBCDate(date) Creates an ODBC date object. ,  returns A date object, in normalized ODBC(dd/mm/yyyy) date format.--->
<cfscript>
    year = 2018;
    month = 11;
    day = 02;
    hour = 1;
    minute= 09;
    second= 46;
    myDate=CreateDateTime(year,month,day,hour,minute,second)
    format=CreateODBCDate(myDate)
    format_now = createODBCDate(now())
    writeOutput("Date format is : " & format & " | ");
    writeOutput("Date format is : " & format_now);
</cfscript>
<br>
<!--- CreateODBCTime(date) Creates an ODBC time object. returns A time object, in ODBC timestamp format.--->
<cfscript>
    year = 2018;
    month = 11;
    day = 02;
    hour = 1;
    minute= 09;
    second= 46;
    myDate=CreateDateTime(year,month,day,hour,minute,second)
    format=CreateODBCTime(myDate)
    writeOutput("Time format is : " & format)
</cfscript>

<br>
<!--- CreateTime(hour,minute, second) Creates a time variable. returns A time variable --->
<cfscript>
    hour = 1;
    minute= 09;
    second= 46;
    myTime=CreateTime(hour,minute,second)
    writeOutput("Time is : " & myTime)
</cfscript>
<br>

<!--- CreateTimeSpan(days, hours, minutes, seconds) Creates a date-time object (Java Double). You can add or subtract it from other date-time objects and use it with the cachedWithin attribute of cfquery.
    A date-time object (Java Double). --->

<cfscript>
    hours = 10;
    minutes= 09;
    seconds= 46;
    days = 12;
    myTime=CreateTimeSpan(days,hours,minutes,seconds)
    writeOutput("Time is : " & myTime)
</cfscript>
<br>

<!--- DateAdd(datepart, number, date) Adds units of time to a date. returns A date/time object. --->
<cfscript>
    date="{ts '2433-09-01 23:59:59'}";
 writeOutput("#date#");
    diff=30;
    posdateresult=DateAdd("s",diff,date);
 writeOutput("#posdateresult#");
</cfscript>
<br>

<!--- DateCompare(date1, date2 [, datePart]) Performs a full date/time comparison of two dates.
    returns -1, if date1 is earlier than date2 ; 0, if date1 is equal to date2; 1, if date1 is later than date2--->
<cfscript>
    Date1 = "{ts '2018-11-15 12:13:50'}";
    Date2 = "{ts '2018-10-15 11:13:50'}";
    Date3 = "{ts '2018-11-15 12:13:50'}";
    Date4 = "{ts '2019-11-15 12:13:50'}";
    Compare= DateCompare(Date1,Date2)
    Compare1= DateCompare(Date1,Date3)
    Compare2= DateCompare(Date1,Date4)
    writeOutput("date comparison is : " & Compare & "<br/>")
    writeOutput("date comparison is : " & Compare1 & "<br/>")
    writeOutput("date comparison is : " & Compare2 & "<br/>")
</cfscript>
<br>

<!--- DateConvert(conversionType, date) Converts local time to Coordinated Universal Time (UTC), or UTC to local time. 
    UTC- or local-formatted time object.--->
<cfscript>
    // convert local date-time to UTC
    utc_datetime = DateConvert('local2Utc', now());
    writeOutput(utc_datetime & "<br/>")
    local_datetime=DateConvert('utc2Local',now())
    writeOutput(local_datetime)
</cfscript>
<br>

<!--- 

