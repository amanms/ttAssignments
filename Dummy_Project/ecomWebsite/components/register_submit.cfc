<cfcomponent output="false">
    
    <cffunction name="register_user" access="remote" output="true" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="email" type="string" required="true">
        <cfargument name="mobile" type="string" required="true">
        <cfargument name="password" type="string" required="true">
        <cfset var output = ''>
        <cfquery name="user">
            select users.email from users where email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfif user.recordCount GT 0>
            <cfoutput>present</cfoutput>
            
        <cfelse>
            <cfset password_salt = hash(generateSecretKey("AES"),"SHA-512")>
            <cfset password_hash = hash(password&password_salt,"SHA-512")>
            <cfquery name="insert">
                insert into users(name,
                                mobile,
                                email,
                                password,
                                salt)
                values(<cfqueryparam value="#arguments.name#" cfsqltype="varchar">,
                    <cfqueryparam value="#arguments.mobile#" cfsqltype="varchar">,
                    <cfqueryparam value="#arguments.email#" cfsqltype="varchar">,
                    <cfqueryparam value="#password_hash#" cfsqltype="varchar">,
                    <cfqueryparam value="#password_salt#" cfsqltype="varchar">)
            </cfquery>
            <cfoutput>insert</cfoutput>
            
        </cfif>
    </cffunction>

    <cffunction name="login_user" access="remote" output="true" returntype="void">
        <cfargument name="email" type="string" required="true">
        <cfargument name="password" type="string" required="true">

        
        <cfquery name="logincheck" result="result">
            select users.id,users.name,users.role,users.salt,users.password from users 
            where email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar">;
        </cfquery>
        <cfif logincheck.recordCount GT 0>
            <cfset var user_salt = logincheck.salt>
            <cfset var user_password = logincheck.Password>
            <cfset var login_password = hash(arguments.password&user_salt,"SHA-512")>
            <cfif user_password EQ login_password>
                <cflock timeout="20" scope="Session" type="exclusive">
                    <cfif logincheck.role EQ '1'>
                    
                        <cfset session['USER_LOGIN'] = 'admin'>
                    <!---<cfset session['USER_LOGIN'] = 'admin'>--->
                    <cfelse>
                        <cfset session['USER_LOGIN'] = 'yes'>
                    </cfif>
                </cflock>
                
                <cflock timeout="20" scope="Session" type="exclusive">
                    <cfset session['USER_ID'] = logincheck.id>
                    <cfset session['USER_NAME'] = logincheck.name>
                </cflock>
                <cfoutput>valid</cfoutput>
            <cfelse>
                <cfoutput>wrong</cfoutput>
            </cfif>
        <cfelse>
            <cfoutput>wrong</cfoutput>
        </cfif>

        
    </cffunction>

    <cffunction name="forget_password" access="remote" output="true" returntype="void">
        <cfargument name="email" type="string" required="true">
        <cfargument name="newpassword" type="string" required="true">
        <cfargument name="confirmpassword" type="string" required="true">
        
        <cfquery name="logincheck" result="result">
            select users.id,users.email from users where email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">;
        </cfquery>
        <cfif logincheck.recordCount GT 0>
            <cfif arguments.newpassword EQ arguments.confirmpassword>
                <cfset user_salt = hash(generateSecretKey("AES"),"SHA-512")>
                <cfset user_password = hash(arguments.newpassword&user_salt,"SHA-512")>
                <cfquery name="update">
                    update users set salt = '#user_salt#',password = '#user_password#' where  id=#logincheck.id#;
                </cfquery>
                <cfoutput>insert</cfoutput>
            <cfelse>
                <cfoutput>passworderror</cfoutput>
            </cfif>
        <cfelse>
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