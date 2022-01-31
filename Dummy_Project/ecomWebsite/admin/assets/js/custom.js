
jQuery(document).ready(function(){
   
    jQuery('.delete').click(function(e){
        e.preventDefault();
        var el = jQuery(this);
        
        var id = jQuery(this).val();
        
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
                            window.location.href = "categories.cfm";

                        }
                        else {
                            bootbox.alert('Record not deleted.');
                        }
        
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
                            window.location.href = "product.cfm";
                            
                        }
                        else {
                            bootbox.alert('Record not deleted.');
                        }
                    }

                })
            }
        })

    })

});