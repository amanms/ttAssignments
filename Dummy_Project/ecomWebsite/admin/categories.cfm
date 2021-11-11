
<cfinclude template="top.inc.cfm">

<cfset categories = createObject('component','components/categories')>
<cfset category_list = categories.get_category()>

<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Categories </h4>
				   <h4 class="box-link"><a href="manage_categories.cfm">Add Categories</a> </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">#</th>
							   <th>ID</th>
							   <th>Categories</th>
							   <th>Status</th>
							</tr>
						 </thead>
						 <tbody>
							
							<cfloop from="1" to="#arrayLen(category_list)#" index="i">
								
								<tr>
					
									<td class="serial"><cfoutput>#i#</cfoutput></td>
							   		<td><cfoutput>#category_list[i].id#</cfoutput></td>
							   		<td><cfoutput>#category_list[i].categories#</cfoutput></td>
							   		<td>
										<cfoutput><span class='badge badge-edit'><a href='manage_categories.cfm?id=#category_list[i].id#'>Edit</a></span>&nbsp;</cfoutput>
					
									</td>
								</tr> 

							</cfloop>
						 </tbody>
					  </table>
				   </div>
				</div>
			 </div>
		  </div>
	   </div>
	</div>
</div>

<cfinclude template="footer.inc.cfm">