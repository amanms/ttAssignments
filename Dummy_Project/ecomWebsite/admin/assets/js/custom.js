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
jQuery(document).ready(function(){
   
    jQuery('.delete').click(function(e){
        e.preventDefault();
        var el = jQuery(this);
        console.log(el);
        var id = jQuery(this).val();
        console.log(id);
        bootbox.confirm("Do you really want to delete record?", function (result){
            if (result){
                jQuery.ajax({
                    url:'components/delete_record.cfc?method=delete_category',
                    type:'post',
                    data:'id='+id,
                    success:function(response){
                        var data = jQuery.trim(response);
                        if(data === 'ok'){
                            jQuery(el).closest('tr').css('background', 'tomato');
                                        jQuery(el).closest('tr').fadeOut(800, function () {
                                            jQuery(this).remove();
                                        });
                        }
                        else {
                            bootbox.alert('Record not deleted.');
                        }
                        console.log(response);
                    }

                })
            }
        })

    })

    jQuery('.delete-product').click(function(e){
        e.preventDefault();
        var el = jQuery(this);
        console.log(el);
        var id = jQuery(this).val();
        console.log(id);
        bootbox.confirm("Do you really want to delete record?", function (result){
            if (result){
                jQuery.ajax({
                    url:'components/delete_record.cfc?method=delete_product',
                    type:'post',
                    data:'id='+id,
                    success:function(response){
                        var data = jQuery.trim(response);
                        if(data === 'ok'){
                            jQuery(el).closest('tr').css('background', 'tomato');
                                        jQuery(el).closest('tr').fadeOut(800, function () {
                                            jQuery(this).remove();
                                        });
                        }
                        else {
                            bootbox.alert('Record not deleted.');
                        }
                        console.log(response);
                    }

                })
            }
        })

    })

});
/*function check_delete(){
    document.getElementById("delete").addEventListener("click", function(event){
        event.preventDefault();
        bootbox.alert("hlw");
      });
    
}*/