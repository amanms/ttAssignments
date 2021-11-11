<cfinclude template="top.cfm">
<cfset uid = #session['USER_ID']#>
<cfquery name="user">
    select * from users where id=#uid#
</cfquery>
<cfset email = "#user.email#"/>

<cfif structKeyExists(form,'submit')>
    <cfset user_email = #form.email#>
    
    <cfif (structKeyExists(url,'id') AND #url.id# NEQ '')>
        <cfset id="#url.id#"/>
        <cfquery name="updateemail">
            update dbo.users set email = '#user_email#' where id =#id#;
        </cfquery>
        <cflocation url="user_profile.cfm">
    </cfif>
    
</cfif>

<section class="htc__contact__area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="contact-form-wrap mt--60">
                    <div class="col-xs-12">
                        <div class="contact-title">
                            <h2 class="title__line--6">Change Name</h2>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <form method="POST">
                            <div class="single-contact-form">
                                <div class="contact-box name">
                                    <input type="text" name="email" id="email" placeholder="Enter your Email*" style="width:100%" required value="<cfoutput>#email#</cfoutput>">
                                </div>
                            </div>
                            <div class="contact-btn">
                                <button type="submit" name="submit"  class="fv-btn" >Submit</button>
                            </div>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<cfinclude template="footer.cfm">
