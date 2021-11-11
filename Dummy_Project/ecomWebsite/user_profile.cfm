<cfinclude template="top.cfm">
<div class="wishlist-area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="wishlist-content">
                    <form action="#">
                        <div class="wishlist-table table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        
                                        <th class="product-name">Name</th>
                                        <th class="product-name">Email</th>
                                        <th class="product-name">Mobile</th>
                                        
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfset uid = #session['USER_ID']#>
                                    <cfquery name="user">
                                        select * from users where id = #uid#
                                    </cfquery>
                                    
                                        
                                        <tr>
                                            <td class="product-name"><cfoutput>#user.name#</cfoutput><br/><br/>
                                                <a href="edit_name.cfm?id=<cfoutput>#uid#</cfoutput>">Edit</a>

                                            </td>
                                            <th class="product-name"><cfoutput>#user.email#</cfoutput><br/><br/>
                                                <strong><a href="edit_email.cfm?id=<cfoutput>#uid#</cfoutput>">Edit</a></strong>
                                                
                                            </th>  
                                            <th class="product-name"><cfoutput>#user.mobile#</cfoutput><br/><br/>
                                                <strong><a href="edit_mobile.cfm?id=<cfoutput>#uid#</cfoutput>">Edit</a></strong>
                                                
                                            </th>
                                        </tr>
                                </tbody>
                            </table>
                        </div>  
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<cfinclude template="footer.cfm">
