

<cfinclude template="top.inc.cfm">
<cfinclude template="functions.inc.cfm">
<cfset categories = createObject('component','components/categories')>
<cfset category_name=''>

<cfset msg=''>
<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
	<cfset  category_list_by_id = categories.get_category(id='#url.id#')>
	<cfif arrayLen(category_list_by_id) GT 0>
		<cfset category_name = category_list_by_id[1].categories>
	<cfelse>
		<cflocation url="categories.cfm">
	</cfif>
	
</cfif>

<cfif structKeyExists(form,'submit')>
	<cfset category = Replace(form.categories, " ", "", "ALL")/>>
	<cfset  category_list_by_name = categories.get_category(category='#category#')>
	<cfif arrayLen(category_list_by_name) GT 0>
		<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
			<cfif url.id EQ category_list_by_name [1].id>
			<cfelse>
				<cfset msg  = "categories already exist">
			</cfif>
		<cfelse>
			<cfset msg  = "categories already exist">
		</cfif>
	</cfif>
	<cfif msg EQ ''>
		<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
			<cfset  update_category = categories.edit_category(id='#url.id#',category='#category#')>
		<cfelse>
			<cfset  insert_category = categories.edit_category(category='#category#')>
		</cfif>
		
		<cflocation url="categories.cfm">
	</cfif>
	
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
									<input type="text" name="categories" placeholder="Enter categories name" class="form-control" required value="<cfoutput>#category_name#</cfoutput>" >
								</div>
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