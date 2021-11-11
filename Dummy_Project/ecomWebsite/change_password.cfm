<cfinclude template="top.cfm">
<section class="htc__contact__area ptb--100 bg__white">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="contact-form-wrap mt--60">
                    <div class="col-xs-12">
                        <div class="contact-title">
                            <h2 class="title__line--6">Change Password</h2>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <form id="login-form" action="#" method="post">
                            <div class="single-contact-form">
                                <div class="contact-box name">
                                    <input type="password" name="new_password" id="new_password" placeholder="Type new password*" style="width:100%">
                                </div>
                                <span class="field_error" id="new_password_error"></span>
                            </div>
                            <div class="single-contact-form">
                                <div class="contact-box name">
                                    <input type="password" name="confirm_password" id="confirm_password" placeholder="Retype new password*" style="width:100%">
                                </div>
                                <span class="field_error" id="confirm_password_error"></span>
                            </div>
                            
                            <div class="contact-btn">
                                <button type="button"  class="fv-btn" onclick="reset_password()">Submit</button>
                            </div>
                        </form>
                        <div class="form-output login_msg">
                            <p class="form-messege field_error"></p>
                        </div>
                    </div>
                </div> 
        
        </div>
<cfinclude template="footer.cfm">