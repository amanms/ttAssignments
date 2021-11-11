<cfcomponent output="false">
    <!---<cfset name =#form.name#>
    <cfset email = #form.email#>
    <cfset mobile = #form.mobile#>
    <cfset password = #form.password#>
    <cfquery name="user">
        select users.email from users where email ='#email#';
    </cfquery>
    <cfif user.recordCount GT 0>
        <cfdump var="present"/>
    <cfelse>
        <cfset password_salt = hash(generateSecretKey("AES"),"SHA-512")>
        <cfset password_hash = hash(#password#&#password_salt#,"SHA-512")>
        <cfquery name="insert">
            insert into dbo.users(name,mobile,email,password,salt)
            values('#name#','#mobile#','#email#','#password_hash#','#password_salt#')
        </cfquery>
        <cfdump var="#insert#"/>
    </cfif>--->
    <cffunction name="register_user" access="remote" output="true" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="mobile" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfquery name="user">
            select users.email from users where email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar">
        </cfquery>
        <cfif user.recordCount GT 0>
            <cfoutput>present</cfoutput>
        <cfelse>
            <cfset password_salt = hash(generateSecretKey("AES"),"SHA-512")>
            <cfset password_hash = hash(#password#&#password_salt#,"SHA-512")>
            <cfquery name="insert">
                insert into users(name,mobile,email,password,salt)
                values(<cfqueryparam value="#arguments.name#" cfsqltype="varchar">,<cfqueryparam value="#arguments.mobile#" cfsqltype="varchar">,
                <cfqueryparam value="#arguments.email#" cfsqltype="varchar">,<cfqueryparam value="#password_hash#" cfsqltype="varchar">,<cfqueryparam value="#password_salt#" cfsqltype="varchar">)
            </cfquery>
            <cfoutput>insert</cfoutput>
        </cfif>
    </cffunction>

    <cffunction name="login_user" access="remote" output="true" returntype="void">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        <cfquery name="user">
            select users.salt from users where email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar">
        </cfquery>
        <cfset user_salt = user.salt>
        <cfset login_password = hash(password&user_salt,"SHA-512")>
        <cfquery name="logincheck" result="result">
            select users.id,users.name,users.role from users where email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar"> and password = <cfqueryparam value="#login_password#" cfsqltype="varchar">;
        </cfquery>
        <cfif logincheck.recordCount GT 0>
            <cfif logincheck.role EQ '1'>
                <cflock timeout="20" scope="Session" type="exclusive">
                    <cfset session['USER_LOGIN'] = 'admin'>
                </cflock>
                <!---<cfset session['USER_LOGIN'] = 'admin'>--->
            <cfelse>
                <cflock timeout="20" scope="Session" type="exclusive">
                    <cfset session['USER_LOGIN'] = 'yes'>
                </cflock>
                
            </cfif>
            <cflock timeout="20" scope="Session" type="exclusive">
                <cfset session['USER_ID'] = logincheck.id>
                <cfset session['USER_NAME'] = logincheck.name>
            </cflock>
            
            <cfoutput>valid</cfoutput>
        <cfelse>
            <cfoutput>wrong</cfoutput>
        </cfif>
        
    </cffunction>

    <cffunction name="forget_password" access="remote" output="true" returntype="void">
        <cfargument name="email" type="string" required="true">
        <cfargument name="newpassword" type="string" required="true">
        <cfargument name="confirmpassword" type="string" required="true">
        <cfquery name="user">
            select users.email,users.id from users;
        </cfquery>
        <cfset num = 0>
        <cfloop from="1" to="#user.recordCount#" index="i">
            <cfset row = queryGetRow(user,i)>
            <cfif email EQ row.email>
                <cfset num = 1>
                <cfif arguments.newpassword EQ arguments.confirmpassword>
                    <cfset user_salt = hash(generateSecretKey("AES"),"SHA-512")>
                    <cfset user_password = hash(arguments.newpassword&user_salt,"SHA-512")>
                    <cfquery name="update">
                        update users set salt = '#user_salt#',password = '#user_password#' where id=#row.id#;
                    </cfquery>
                    <cfoutput>insert</cfoutput>
                <cfelse>
                    <cfoutput>passworderror</cfoutput>
                </cfif>   
            </cfif>
        </cfloop>
        <cfif num NEQ 1>
            <cfoutput>invalid</cfoutput>
        </cfif>

    </cffunction>

    <cffunction name="reset_password" access="remote" output="true" returntype="void">
        <cfargument name="newpassword" type="string" required="true">
        <cfargument name="confirmpassword" type="string" required="true">
        <cfif arguments.newpassword EQ arguments.confirmpassword>
            <cfset new_salt = hash(generateSecretKey("AES"),"SHA-512")>
            <cfset new_password = hash(arguments.newpassword&new_salt,"SHA-512")>
            <cfquery name="update">
                update users set salt = '#new_salt#',password = '#new_password#' where id=#session['USER_ID']#;
            </cfquery>
            <cfoutput>valid</cfoutput>
        <cfelse>
            <cfoutput>invalid</cfoutput>
        </cfif> 
    </cffunction>
</cfcomponent>