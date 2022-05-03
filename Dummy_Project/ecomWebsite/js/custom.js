/* function to register user with field validations and ajax call to display messages*/
function user_register(){
    jQuery('.field_error').html('');
    var name=jQuery("#name").val();
	var email=jQuery("#email").val();
	var mobile=jQuery("#mobile").val();
	var password=jQuery("#password").val();
    var nameFormat = /^[A-Za-z]*$/;
    var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var phoneFormat = /^\d{10}$/;
	var is_error = '';
	if(name==""){
		jQuery('#name_error').html('Please enter name');
        is_error = 'yes';
	}if(!nameFormat.test(name)){
		jQuery('#name_error').html('Please enter a valid name');
        is_error = 'yes';
	}if(email==""){
		jQuery('#email_error').html('Please enter email');
        is_error = 'yes';
	}if((email!="") && (!emailFormat.test(email))){
		jQuery('#email_error').html('Please enter a valid email');
        is_error = 'yes';
	}if(mobile==""){
		jQuery('#mobile_error').html('Please enter mobile');
        is_error = 'yes';
	}if((mobile!="") && (!phoneFormat.test(mobile))){
		jQuery('#mobile_error').html('Please enter a valid mobile');
        is_error = 'yes';
	}if(password==""){
		jQuery('#password_error').html('Please enter password');
        is_error = 'yes';
	}if((password!="") && (password.length<8 || password.length>14)){
        jQuery('#password_error').html('Password should contain min 8 and max 14 characters');
        is_error = 'yes';
    }
    if(is_error==''){
        jQuery.ajax({
            url:'components/register_submit.cfc?method=register_user',
            type:'post',
            data:'name='+name+'&email='+email+'&mobile='+mobile+'&password='+password,
            success: function (result) {
                console.log(result)
                var data = $.trim(result);
                if(data === 'present'){
                    jQuery('#email_error').html('Email id already present');
                }
                if(data === 'insert'){
                    jQuery('.register_msg p').html('Thank you for registration');
                }
            }
        });
    }

}
/* function for login users */
function user_login(){
    jQuery('.field_error').html('');
	var email=jQuery("#login_email").val();
	var password=jQuery("#login_password").val();
    var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	var is_error = '';
	if(email==""){
		jQuery('#login_email_error').html('Please enter email');
        is_error = 'yes';
	}if((email!="") && (!emailFormat.test(email))){
		jQuery('#email_error').html('Please enter a valid email');
        is_error = 'yes';
	}if(password==""){
		jQuery('#login_password_error').html('Please enter password');
        is_error = 'yes';
	}
    if(is_error==''){
        jQuery.ajax({
            url:'components/register_submit.cfc?method=login_user',
            type:'post',
            data:'email='+email+'&password='+password,
            success: function (result) {
                var data = $.trim(result);
                
                if(data === 'wrong'){
                    
                    jQuery('.login_msg p').html('Please enter valid login details');
                }
                if(data === 'valid'){
                    
                    window.location.href = "index.cfm";
                }
            }
        });
    }

}
/*function to manage cart items */
function manage_cart(pid,type){
    if(type=='update'){
        var qty = jQuery("#"+pid+"qty").val();
    }else{
        var qty=jQuery("#qty").val();
    }
	
    jQuery.ajax({
        url:'components/functions.cfc?method=manage_cart_items',
        type:'post',
        data:'pid='+pid+'&qty='+qty+'&type='+type,
        success: function (result) {
            if(type == 'remove' || type == 'update'){
                window.location.href = window.location.href;
            }
            var str = $.trim(result);
            if(str === 'notloggedIn'){
                jQuery('.login_msg p').html("Please login to add to cart");
            }
            if(str === 'loggedIn'){
                jQuery('.login_msg p').html("Product added to cart");
            }
            if(str === 'itempresent loggedIn'){
                jQuery('.login_msg p').html("Product is in cart");
            }
            
        }
    });

}
/* function for reset password */
function reset_password(){
    jQuery('.field_error').html('');
	var new_password=jQuery("#new_password").val();
	var confirm_password=jQuery("#confirm_password").val();
	var is_error = '';
	if(new_password==""){
		jQuery('#new_password_error').html('Please enter your new password');
        is_error = 'yes';
	}if(confirm_password==""){
		jQuery('#confirm_password_error').html('Please re-enter your new password');
        is_error = 'yes';
	}
    if(is_error==''){
        jQuery.ajax({
            url:'components/register_submit.cfc?method=reset_password',
            type:'post',
            data:'&newpassword='+new_password+'&confirmpassword='+confirm_password,
            success: function (result) {
                var data = $.trim(result);
                if(data === 'invalid'){
                    jQuery('.login_msg p').html('Please re-enter your password');
                }
                if(data === 'valid'){
                    jQuery('.login_msg p').html('Password successfully changed');
                }
            }
        });
    }

    
}
/* function for update password */
function update_password(){
    jQuery('.field_error').html('');
    var email = jQuery("#user_email").val();
	var new_password=jQuery("#user_password").val();
	var confirm_password=jQuery("#confirm_user_password").val();
	var is_error = '';
    if(email==""){
		jQuery('#user_email').html('Please enter your email');
        is_error = 'yes';
	}
	if(new_password==""){
		jQuery('#user_password_error').html('Please enter your new password');
        is_error = 'yes';
	}if(confirm_password==""){
		jQuery('#confirm_user_password_error').html('Please re-enter your new password');
        is_error = 'yes';
	}
    if(is_error==''){
        jQuery.ajax({
            url:'components/register_submit.cfc?method=forget_password',
            type:'post',
            data:'email='+email+'&newpassword='+new_password+'&confirmpassword='+confirm_password,
            success: function (result) {
                var data = $.trim(result);
                if(data === 'passworderror'){
                    jQuery('.login_msg p').html('Please re-enter your password');
                }
                if(data === 'invalid'){
                    
                    jQuery('.login_msg p').html('Please enter valid email');
                }
                if(data === 'insert'){
                    jQuery('.login_msg p').html('Password successfully changed');
                }
            }
        });
    }

    
}
/* function to create drop down for sorting of products */
function sort_product_drop(cat_id){
	var sort_product_id=jQuery('#sort_product_id').val();
    
    window.location.href = "http://www.myassignments.com/Dummy_Project/ecomWebsite/categories.cfm?id="+cat_id+"&sort="+sort_product_id;
	
}
