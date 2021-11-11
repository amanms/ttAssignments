<cfquery name="user">
    SELECT * from dbo.Users;
</cfquery>
<cfdump var="#user#"></cfdump>