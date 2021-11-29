/*function check_category(){
    jQuery('.field_error').html('');
	var category_name = jQuery("#categories").val();
	var is_error = '';
	if(category_name==""){
		jQuery('#categories_error').html('Please enter category name');
        is_error = 'yes';
    }
    if(is_error==''){
        jQuery.ajax({
            url:'components/categories.cfc?method=on_submit_category',
            type:'post',
            data:'category_name='+category_name,
            success: function (result) {
                var data = result;
                console.log(data)
                if(data === "invalid"){
                    console.log(100)
                    jQuery('#categories_error').html('category already exists');

                }
                if(data == "valid"){
                    console.log(10)
                    jQuery('.login_msg p').html("category added successfully");
                    
                    // window.location.href = "manage_categories.cfm";
                }
            }
        });
    }

}*/
function check_delete(){
    return confirm('Are you sure you want to delete this record');
}
