

<cfinclude template="top.inc.cfm">
<cfinclude template="functions.inc.cfm">
<cfset categories = createObject('component','components/categories')>
<cfset category_name=''>

<cfset msg=''>
<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
	<cfif isNumeric(url.id)>
		<cfset  category_list_by_id = categories.get_category(id='#url.id#')>
		<cfif arrayLen(category_list_by_id) GT 0>
			<cfset category_name = category_list_by_id[1].category_name>
		<cfelse>
			<cflocation url="error1.cfm">
		</cfif>
	<cfelse>
		<cflocation url="error1.cfm">
	</cfif>
	
	
</cfif>

<cfif structKeyExists(form,'submit')>
	<cfset category = Replace(form.categories, " ", "", "ALL")/>
	<cfset msg = categories.on_submit_category(category_name='#category#')>
	
</cfif>

<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Categories</strong><small> Form</small></div>
                        <cfform method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="categories" class=" form-control-label">Categories</label>
									<input type="text" name="categories" id = "categories" placeholder="Enter categories name" class="form-control" required value="<cfoutput>#category_name#</cfoutput>" >
								</div>
								<span class="field_error" id="categories_error"></span>
							   <button  name="submit" type="submit" class="btn btn-lg btn-info btn-block">
							   <span id="payment-button-amount">Submit</span>
							   </button>
							   <div class="field_error"><cfoutput>#msg#</cfoutput></div>
							</div>
						</cfform>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<cfinclude template="footer.inc.cfm">