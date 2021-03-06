
<cfinclude template="top.inc.cfm">
<cfset product = createObject('component','components/product')>
<cfset categories_id=''>
<cfset product_name=''>
<cfset filepath=''>
<cfset size=''>
<cfset colour=''>
<cfset price=''>
<cfset description=''>
<cfset msg=''>
<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
	<cfif isNumeric(url.id)>
		<cfset  product_by_id = product.get_product(id='#url.id#')>
		<cfif arrayLen(product_by_id) GT 0>
			<cfset product_name = product_by_id[1].name>
			<cfset categories_id=product_by_id[1].categoryId>
			<cfset filepath=product_by_id[1].filepath>
			<cfset size=product_by_id[1].size>
			<cfset colour=product_by_id[1].colour>
			<cfset price=product_by_id[1].price>
			<cfset description = product_by_id[1].description>
		<cfelse>
			<cflocation url="error1.cfm">
		</cfif>
	<cfelse>
		<cflocation url="error1.cfm">
	</cfif>
	
	
</cfif>
<cfif structKeyExists(form,'submit')>
	<cfset categories_id=form.categories_id>
	<cfset product_name = form.productname>
	<cfset filepath=form.filepath>
	<cfset size=form.size>
	<cfset colour=form.colour>
	<cfset price=form.price>
	<cfset description=form.description>

	<cfset  product_by_name = product.get_product(product_name='#product_name#')>
	<cfif arrayLen(product_by_name) GT 0>
		<cfif (structKeyExists(url,'id') AND url.id NEQ '')>
			<cfif url.id EQ product_by_name [1].id>
			<cfelse>
				<cfset msg  = "product already exist">
			</cfif>
		<cfelse>
			<cfset msg  = "product already exist">
		</cfif>
	</cfif>
	<cfif msg EQ ''>
		<cfif structKeyExists(url,'id') AND url.id NEQ ''>
			<cfset update_product = product.update_product(id='#url.id#',categories_id='#categories_id#',product_name='#product_name#',description='#description#',size='#size#',price='#price#',filepath='#filepath#')>
			<cfset msg = "Product updated successfully">
			
		<cfelse>
			<cfset insert_product = product.update_product(categories_id='#categories_id#',product_name='#product_name#',description='#description#',size='#size#',colour='#colour#',price='#price#',filepath='#filepath#',status = '1')>
			<cfset msg = "Product added successfully">
			
		</cfif>
		
		
	</cfif>
	
</cfif>

<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product</strong><small> Form</small></div>
                        <form method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="categories" class=" form-control-label">Categories</label>
									<select class="form-control" name="categories_id">
										<option>Select Category</option>
										
										<cfquery name="getcategory">
											select id,category_name from categories order by category_name asc;
										</cfquery>
										<cfloop query="getcategory">
											<cfif getcategory.id EQ categories_id>
												<option selected value="<cfoutput>#getcategory.id#</cfoutput>"><cfoutput>#getcategory.category_name#</cfoutput></option>
											<cfelse>
												<option value="<cfoutput>#getcategory.id#</cfoutput>"><cfoutput>#getcategory.category_name#</cfoutput></option>
											</cfif>
											
										</cfloop>
									</select>
								</div>
								<div class="form-group">
									<label for="categories" class=" form-control-label">Product Name</label>
									<input type="text" name="productname" placeholder="Enter product name" class="form-control" required value="<cfoutput>#product_name#</cfoutput>">
								</div>
                                <div class="form-group">
									<label for="filePath" class=" form-control-label">Filepath</label>
									<input type="text" name="filePath" placeholder="Enter product filepath" class="form-control" value="<cfoutput>#filepath#</cfoutput>">
								</div>
                                <div class="form-group">
									<label for="productSize " class=" form-control-label">Size</label>
									<input type="text" name="size" placeholder="Enter product size" class="form-control" value="<cfoutput>#size#</cfoutput>">
								</div>
                                <div class="form-group">
									<label for="productColour " class=" form-control-label">Colour</label>
									<input type="text" name="colour" placeholder="Enter product colour" class="form-control" value="<cfoutput>#colour#</cfoutput>">
								</div>
                                <div class="form-group">
									<label for="productPrice " class=" form-control-label">Price</label>
									<input type="text" name="price" placeholder="Enter product price" class="form-control" value="<cfoutput>#price#</cfoutput>">
								</div>
                                <div class="form-group">
									<label for="productDescription " class=" form-control-label">Description</label>
                                    <textarea name="description" placeholder="Enter product description" class="form-control"><cfoutput>#description#</cfoutput></textarea>
									
								</div>
								<button  name="submit" type="submit" class="btn btn-lg btn-info btn-block">
								<span >Submit</span>
								</button>
								<div class="field_error"><cfoutput>#msg#</cfoutput></div>
							</div>
						</form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<cfinclude template="footer.inc.cfm">