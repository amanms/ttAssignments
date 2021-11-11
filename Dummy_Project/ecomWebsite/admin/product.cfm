
<cfinclude template="top.inc.cfm">

<cfset product = createObject('component','components/product')>
<cfset product_detail = product.get_product()>

<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Products </h4>
				   <h4 class="box-link"><a href="manage_product.cfm">Add Product</a> </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">#</th>
							   <th>ID</th>
							   <th>Categories</th>
							   <th>Name</th>
							   <th>Image Filepath</th>
							   <th>Price</th>
							   <th>status</th>
							</tr>
						 </thead>
						 <tbody>
							
							<cfloop from="1" to="#arrayLen(product_detail)#" index="i">
								
								<tr>
									<td class="serial"><cfoutput>#i#</cfoutput></td>
							   		<td><cfoutput>#product_detail[i].id#</cfoutput></td>
							   		<td><cfoutput>#product_detail[i].categories#</cfoutput></td>
									<td><cfoutput>#product_detail[i].name#</cfoutput></td>
									<td><cfoutput>#product_detail[i].filepath#</cfoutput></td>
									<td><cfoutput>#product_detail[i].price#</cfoutput></td>
							   		<td>
										<cfoutput><span class='badge badge-edit'><a href='manage_product.cfm?id=#product_detail[i].id#'>Edit</a></span>&nbsp;</cfoutput>
								
										<cfoutput><span class='badge badge-delete'><a href='?type=delete&id=#product_detail[i].id#'>Delete</a></span></cfoutput>
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