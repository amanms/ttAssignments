
<cfinclude template="top.inc.cfm">

<cfset user = createObject('component','components/users')>
<cfset user_record = user.get_user()>

<div class="content pb-0">
	<div class="orders">
	   <div class="row">
		  <div class="col-xl-12">
			 <div class="card">
				<div class="card-body">
				   <h4 class="box-title">Users </h4>
				</div>
				<div class="card-body--">
				   <div class="table-stats order-table ov-h">
					  <table class="table ">
						 <thead>
							<tr>
							   <th class="serial">#</th>
							   <th>ID</th>
							   <th>Name</th>
							   <th>Email</th>
							   <th>Mobile</th>
							   <th>Date</th>
							   
							</tr>
						 </thead>
						 <tbody>
							<cfloop from="1" to="#arrayLen(user_record)#" index="i">
					
								<tr>
									<td class="serial"><cfoutput>#i#</cfoutput></td>
									<td><cfoutput>#user_record[i].id#</cfoutput></td>
									<td><cfoutput>#user_record[i].name#</cfoutput></td>
									<td><cfoutput>#user_record[i].email#</cfoutput></td>
									<td><cfoutput>#user_record[i].mobile#</cfoutput></td>
									<td><cfoutput>#user_record[i].added_on#</cfoutput></td>
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