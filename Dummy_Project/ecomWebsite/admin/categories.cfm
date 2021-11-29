
<cfinclude template="top.inc.cfm">

<cfset categories = createObject('component','components/categories')>
<cfset category_list = categories.get_category()>
<div class="modal fade" id="delete_modal" tabindex="-1" role="dialog" aria-labelledby="delete_modal_Label" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="delete_modal_Label">Modal title</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
		  hi
		</div>
		<div class="modal-footer">
		  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		  <button type="button" class="btn btn-primary">Save changes</button>
		</div>
	  </div>
	</div>
  </div>

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
							   		<td class="id"><cfoutput>#category_list[i].id#</cfoutput></td>
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