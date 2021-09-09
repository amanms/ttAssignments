$(document).ready(function(){
    

    var txtFirstName=txtMiddleName=txtLastName=dateOfBirth=txtEmail=txtPassword=txtConfirmPassword=gender=txtMobileNumber=selectCountry=
    txtCurrentAddress=txtPermanentAddress=selectCurrentState=selectPermanentState=selectCurrentCity=selectPermanentCity=txtCurrentCityZipcode=txtPermanentCityZipcode=txtCaptcha=true;
    
  

    //dynamically dependent country state cities values----------------------------
    var x=$.ajax({
        url: "https://www.universal-tutorial.com/api/countries/",
        type: 'GET',
        // Fetch the stored token from localStorage and set in the header
        headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhbnNodXJhajIyMDRAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibUNQMW9ZUHVSeGIwWHpFeUpvTlB4dGM5eDROUzhlajhJYjVOdHdvd2hpQWwzNUUzbEZxUWJCYzFYUy1hTktMQlZoVSJ9LCJleHAiOjE2MzAzMzUxODJ9._2DUWMucs84U5iU-fs-GzVWe1dgwihlFvyafZd38fF4"},
        Accept:"application/json",
        success:function(countryData){
            var countryDataLen = countryData.length;
            var i;
            for(i=0;i<countryDataLen;i++){
                optionText = countryData[i].country_name;
                optionValue = countryData[i].country_short_name;
                $('#selectCountry').append($('<option>').val(optionValue).text(optionText));
            }

        }
      });
    $('#selectCountry').change(function() {
        var countryName = $('#selectCountry option:selected').text();
        $.ajax({
            url:"https://www.universal-tutorial.com/api/states/"+countryName,
            headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhbnNodXJhajIyMDRAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibUNQMW9ZUHVSeGIwWHpFeUpvTlB4dGM5eDROUzhlajhJYjVOdHdvd2hpQWwzNUUzbEZxUWJCYzFYUy1hTktMQlZoVSJ9LCJleHAiOjE2MzAzMzUxODJ9._2DUWMucs84U5iU-fs-GzVWe1dgwihlFvyafZd38fF4"},
            Accept:"application/json",
            success:function(stateData){
                $('#selectCurrentState').find('option').not(':first').remove();
                $('#selectPermanentState').find('option').not(':first').remove();
                var stateDataLen = stateData.length;
                var i;
                for(i=0;i<stateDataLen;i++){
                    optionText = stateData[i].state_name;
                    $('#selectCurrentState').append($('<option>').text(optionText));
                    $('#selectPermanentState').append($('<option>').text(optionText));
                }

                
            }
        });
        
    });
    $('#selectCurrentState').change(function() {
        var currentStateName = $('#selectCurrentState option:selected').text();
        $.ajax({
            url:"https://www.universal-tutorial.com/api/cities/"+currentStateName,
            headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhbnNodXJhajIyMDRAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibUNQMW9ZUHVSeGIwWHpFeUpvTlB4dGM5eDROUzhlajhJYjVOdHdvd2hpQWwzNUUzbEZxUWJCYzFYUy1hTktMQlZoVSJ9LCJleHAiOjE2MzAzMzUxODJ9._2DUWMucs84U5iU-fs-GzVWe1dgwihlFvyafZd38fF4"},
            Accept:"application/json",
            success:function(currentCityData){
                $('#selectCurrentCity').find('option').not(':first').remove();
                var currentCityDataLen = currentCityData.length;
                var i;
                for(i=0;i<currentCityDataLen;i++){
                    optionText = currentCityData[i].city_name;
                    $('#selectCurrentCity').append($('<option>').text(optionText));
                }

                
            }
        });
        
    });
    $('#selectPermanentState').change(function() {
        var permanentStateName = $('#selectPermanentState option:selected').text();
        $.ajax({
            url:"https://www.universal-tutorial.com/api/cities/"+permanentStateName,
            headers: {"Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhbnNodXJhajIyMDRAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibUNQMW9ZUHVSeGIwWHpFeUpvTlB4dGM5eDROUzhlajhJYjVOdHdvd2hpQWwzNUUzbEZxUWJCYzFYUy1hTktMQlZoVSJ9LCJleHAiOjE2MzAzMzUxODJ9._2DUWMucs84U5iU-fs-GzVWe1dgwihlFvyafZd38fF4"},
            Accept:"application/json",
            success:function(permanentCityData){
                $('#selectPermanentCity').find('option').not(':first').remove();
                var permanentCityDataLen = permanentCityData.length;
                var i;
                for(i=0;i<permanentCityDataLen;i++){
                    optionText = permanentCityData[i].city_name;
                    $('#selectPermanentCity').append($('<option>').text(optionText));
                }

                
            }
        });
        
    });
    // --------------------------------------------------------------------------------------------------
    $('#firstName').change(function(){
        firstNameCheck()
  
    });
    $('#middleName').change(function(){
        middleNameCheck()
    })
    $('#lastName').change(function(){
        lastNameCheck();
        
    })
    $('#dob').change(function(){
        validateDob();
    })
    $('#email').change(function(){
        validateEmail();
    })
    $('#password').change(function(){
        validatePassword();
    })
    $('#confirmPassword').change(function(){
        validateConfirmPassword();
    })
    $('#Gender').change(function(){
        validateGender();
    })
    $('#mobile').change(function(){
        validatePhone();
    })
    $('#selectCountry').change(function(){
        validateCountry();
    })
    
    $('#mycheck').change(function(){
        fillAddress();
    })
    $('#currentAddress').change(function(){
        validateCurrentAddress();
    })
    
    $('#selectCurrentState').change(function(){
        validateCurrentState();
    })
    $('#selectCurrentCity').change(function(){
        validateCurrentCity();
    })
    $('#currentCityZipcode').change(function(){
        validateCurrentCityZipcode();
    })
    $('#permanentAddress').change(function(){
        validatePermanentAddress();
    })
    $('#selectPermanentState').change(function(){
        validatePermanentState();
    })
    $('#selectPermanentCity').change(function(){
        validatePermanentCity();
    })
    $('#permanentCityZipcode').change(function(){
        validatePermanentCityZipcode();
    })
    $('.form').submit(function(){
        firstNameCheck();
        middleNameCheck();
        lastNameCheck();
        validateDob();
        validateEmail();
        validatePassword();
        validateConfirmPassword();
        validateGender();
        validateCaptcha();
        validatePhone();
        validateCountry();
        validateCurrentAddress();
        validateCurrentState();
        validateCurrentCity();
        validateCurrentCityZipcode();
        validatePermanentAddress();
        validatePermanentState();
        validatePermanentCity();
        validatePermanentCityZipcode();

        if((txtFirstName==true)&&(txtMiddleName==true)&&(txtLastName==true)&&(dateOfBirth==true)&&(txtEmail==true)&&
        (txtPassword==true) && (txtConfirmPassword==true) && (gender==true) && (txtMobileNumber==true)&&(selectCountry==true)&&
        (txtCurrentAddress==true)&&(txtPermanentAddress==true)&&(selectCurrentState==true)&&(selectPermanentState==true)&&
        (selectCurrentCity==true)&&(selectPermanentCity==true)&&(txtCurrentCityZipcode==true)&&(txtPermanentCityZipcode==true)&&(txtCaptcha==true)){     
            alert('form submitted successfully');
            return true;

        }
        else{
            console.log('error');
            return false;
        }
        
        
    });
    

    


});
// $('#myform').submit(function(e){
//     e.preventDefault();
//     validate();
// }

// ---------------------------------------------------------------------------------------
// declaring utility functions

function showError(id,message){
    if($(id).parent().hasClass('success'))
        {
            $(id).parent().removeClass('success');
        }
        $(id).parent().addClass('error');
        $(id).text(message);

}
function printError(id,message){
    $(id).text(message);
}
function showSuccess(id){
    if($(id).parent().hasClass('error'))
        {
            $(id).parent().removeClass('error');
        }
        $(id).text("");
        $(id).parent().addClass('success');

}

function required(value){
    if(value==""){
        return false;
    }
    return true;
}
function validName(value){
    var nameFormat = /^[A-Za-z]*$/;
    if(!nameFormat.test(value)){
        return false;
    }
    return true;

}
function inBetween(value,min,max){
    var nameLen = value.length;
    if(nameLen<min || nameLen>max){
        return false;
    }
    return true;

}
function validEmail(email){
    var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    return emailFormat.test(email);
}
function isValidPhone(phone){
    const phoneFormat = /^\d{10}$/;
    var len = phone.length;
    if((!phoneFormat.test(phone)) || (len!=10)){
        return false;
    }
    return true;
}
function validZip(zip){
    const zipFormat = /^[0-9]+$/;
    if(!(zipFormat.test(zip))||(zip.length!=6)){
        return false;
    }
    return true;

}
function randomCaptcha(){
    var symbol = ['+','-','*','/']
    var len = symbol.length;
    var digit1 = Math.floor((Math.random() * 50) + 10);
    var digit2 = Math.floor((Math.random() * 10) + 1);
    $("#digit1").val(digit1);
    $("#digit2").val(digit2);
    var parameter = symbol[Math.floor(Math.random()*len)];
    $("#symbol").text(parameter);

}
function calculateCaptcha(){
    let result;
    let firstDigit = parseInt($('#digit1').val());
    let secondDigit = parseInt($('#digit2').val());
    let operator = $('#symbol').text();
    
    if(operator=="+"){
        result = firstDigit+secondDigit;
    }
    else if(operator=="-"){
        result = firstDigit-secondDigit;
    }
    else if(operator=="*"){
        result = firstDigit*secondDigit;
    }
    else{
        result = Math.floor(firstDigit/secondDigit);
    }
    return result;

}
// ------------------------------------------------------------------------------------

// function to  validate first name
function firstNameCheck(){
    var result = false;
    var min = 3,max = 25;
    var firstName = $("#firstName").val();
    if(!(required(firstName))){
        showError('#firstNameError','empty field')
        txtFirstName = false; 

    }
    else if(!(validName(firstName))){
        showError('#firstNameError','Invalid name format');
        txtFirstName = false;
    }
    else if(!(inBetween(firstName,min,max))){
        showError('#firstNameError',"must be  greter than 3 and smaller than 25");
        txtFirstName = false;
    }
    else{
        txtFirstName = true;
        showSuccess('#firstNameError');
        result = true;
        
    }
    return result;

}
// ---------------------------------------------------------------------------------------------
// function to validate middle name
function middleNameCheck(){
    result = false;
    var min = 3,max = 25;
    var middleName = $("#middleName").val();
    if(!(required(middleName))){
        showError("#middleNameError","Empty field");
        txtMiddleName = false;
    }
    else if(!(validName(middleName))){
        showError("#middleNameError","Invalid name");
        txtMiddleName = false;
    }
    else if(!(inBetween(middleName,min,max))){
        
        showError("#middleNameError","must be  greter than 3 and smaller than 25");
        txtMiddleName = false;
    }
    else{
        txtMiddleName = true;
        showSuccess("#middleNameError");
        result = true;
    }
    return result;

}
// ------------------------------------------------------------------------------------------
// function to validate last name
function lastNameCheck(){
    var result = false;
    var min = 3,max = 25;
    var lastName = $("#lastName").val();
    if(!(required(lastName))){
        showError("#lastNameError","Empty field");
        txtLastName = false;
    }
    else if(!(validName(lastName))){
        showError("#lastNameError","Invalid name");
        txtLastName = false;
    }
    else if(!(inBetween(lastName,min,max))){
        showError("#lastNameError","must be  greter than 3 and smaller than 25");
        txtLastName = false;
    }
    else{
        txtLastName = true;
        showSuccess("#lastNameError");
        result = true;
    }
    return result;

}

//  function to validate  date of birth
function validateDob(){
    var result = false;
    var dob = $('#dob').val();
    var dtCurrent = new Date();
    var parts = dob.split("-");
    if(!required(dob)){
        showError("#dobError","Empty field");
        dateOfBirth = false;
    }
    else if((dtCurrent.getFullYear()-parts[0])<18){
        showError("#dobError","Not eligible");
        dateOfBirth = false;
    }
    else{
        dateOfBirth = true;
        showSuccess("#dobError");
        result = true;
    }
    return result;
}
// function to validate email
function validateEmail(){
    var result = false;
    var email = $('#email').val();
    if(!required(email)){
        showError("#emailError","Empty field");
        txtEmail = false;
    }
    else if(!(validEmail(email))){
        showError("#emailError","Invalid email");
        txtEmail = false;
    }
    else{
        txtEmail = true;
        showSuccess("#emailError");
        result = true;
    }
    return result;


}
// function to validate  password

function validatePassword(){
    var result  = false;
    var password = $('#password').val();
    var passLength = password.length;
    var min = 8,max = 12;
    
    if(!required(password)){
        showError("#passwordError","Empty field");
        txtPassword = false;
        
    }
    else if(!inBetween(password,min,max)){
        showError("#passwordError","Password must be greater than 8 and smaller than 13");
        txtPassword = false;
    }
    else{
        txtPassword = true;
        showSuccess("#passwordError");
        result = true;

    }
    return result;
    
}
// function to validate confirm password
function validateConfirmPassword(){
    var result = false;
    var confirmPassword = $('#confirmPassword').val();
    var password = $('#password').val();
    if(!required(confirmPassword)){
        showError("#confirmPasswordError","Empty field");
        txtConfirmPassword = false;
        
    }
    else if(password!=confirmPassword){
        showError("#confirmPasswordError","Password mismatch");
        txtConfirmPassword = false;   
    }
    else{
        txtConfirmPassword = true;
        showSuccess("#confirmPasswordError");
        result = true;
        
    }
    return result;
}
// function to validate gender
function validateGender(){
    var result = false;
    var Gender = $('input[name="radioButton"]:checked').val();
    if(Gender){
        if($('#Gender').hasClass('error')){
            $('#Gender').removeClass('error');
        }
        $('#Gender').addClass('success');
        $('#genderError').text("");
        result = true;
        gender = true;
        
    }

    else{
        if($('#Gender').hasClass('success')){
            $('#Gender').removeClass('success');
        }
        $('#Gender').addClass('error');
        $('#genderError').text("select your gender");
        gender=false;
        
    }
    
    return result;
}

function validatePhone(){
    var  result = false;
    var phoneNumber = $('#mobile').val();
    if(!required(phoneNumber)){
        showError("#phoneError","Empty field");
        txtMobileNumber = false;
    }
    else if(!isValidPhone(phoneNumber)){
        showError("#phoneError","Invalid Entry");
        txtMobileNumber = false;
    }
    else{
        txtMobileNumber = true;
        showSuccess("#phoneError");
        result = true;
        

    }
    return result;
}
function validateCountry(){
    var result = false;
    var countryName = $('#selectCountry').val();
    if(!required(countryName)){
        showError('#countryError','select your country');
        selectCountry = false;
    }
    else{
        selectCountry = true;
        showSuccess('#countryError');
        result = true;
    }
    return result;
}

function validateCurrentAddress(){
    var result = false;
    var currentAddress = $('#currentAddress').val();
    
    if(!(required(currentAddress))){
        showError('#currentAddressError',"Address can not be blank");
        txtCurrentAddress = false;
    }
    else if(!(inBetween(currentAddress,3,50))){
        showError('#currentAddressError',"Address must be greater than 3 smaller than 50");
        txtCurrentAddress = false;
    }
    else{
        txtCurrentAddress = true;
        showSuccess('#currentAddressError');
        result = true;

    }
    return result;
}
function validateCurrentState(){
    var result = false;
    var currentState = $('#selectCurrentState').val();
    if(!required(currentState)){
        showError("#currentStateError",'select your state');
        selectCurrentState = false;
    }
    else{
        selectCurrentState = true;
        showSuccess('#currentStateError');
        result = true;
    }
    return result;
}
function validateCurrentCity(){
    var result = false;
    var currentCity = $('#selectCurrentCity').val();
    if(!required(currentCity)){
        showError('#currentCityError','select your city');
        selectCurrentCity = false;
    }
    else{
        selectCurrentCity = true;
        showSuccess('#currentCityError');
        result = true;
    }
    return result;
}
function validateCurrentCityZipcode(){
    var result = false;
    var currentCityZipcode = $('#currentCityZipcode').val();
    if(!required(currentCityZipcode)){
        showError('#currentCityZipcodeError','Empty field');
        txtCurrentCityZipcode = false;
    }
    else if(!validZip(currentCityZipcode)){
        showError('#currentCityZipcodeError','Invalid field');
        txtCurrentCityZipcode = false;
    }
    else{
        txtCurrentCityZipcode = true;
        showSuccess('#currentCityZipcodeError');
        result = true;
    }
    return result;

}
function validatePermanentAddress(){
    var result = false;
    var permanentAddress = $('#permanentAddress').val();
    
    if(!(required(permanentAddress))){
        showError('#permanentAddressError',"Address can not be blank");
        txtPermanentAddress = false;
    }
    else if(!(inBetween(permanentAddress,3,50))){
        showError('#permanentAddressError',"Address must be greater than 3 smaller than 50");
        txtPermanentAddress = false;
    }
    else{
        txtPermanentAddress = true;
        showSuccess('#permanentAddressError');
        result=false;
    }
    return result;
}
function validatePermanentState(){
    var result = false;
    var permanentState = $('#selectPermanentState').val();
    if(!required(permanentState)){
        showError("#permanentStateError",'select your state');
        selectPermanentState = false;
    }
    else{
        selectPermanentState = true;
        showSuccess('#permanentStateError');
        result = true;
    }
}
function validatePermanentCity(){
    var result = false;
    var permanentCity = $('#selectPermanentCity').val();
    if(!required(permanentCity)){
        showError('#permanentCityError','select your city');
        selectPermanentCity = false;
    }
    else{
        selectPermanentCity = true;
        showSuccess('#permanentCityError');
        result=true;
    }
}
function validatePermanentCityZipcode(){
    var result = false;
    var permanentCityZipcode = $('#permanentCityZipcode').val();
    if(!required(permanentCityZipcode)){
        showError('#permanentCityZipcodeError','Empty field');
        txtPermanentCityZipcode = false;
    }
    else if(!validZip(permanentCityZipcode)){
        showError('#permanentCityZipcodeError','Invalid field');
        txtPermanentCityZipcode = false;
    }
    else{
        txtPermanentCityZipcode = true;
        showSuccess('#permanentCityZipcodeError');
        result = true;
    }

}
function validateCaptcha(){
    var result = false;
    var ans = $('#answer').val();
    var res = calculateCaptcha();
    var element = $("#captcha");
    if(!(required(ans))){
        if($('#captcha').hasClass('success'))
        {
            $('#captcha').removeClass('success');
        }
        $('#captcha').addClass('error');
        $("#captchaError").text("Empty input");
        txtCaptcha = false;
       
    }
    else if(ans!=res){
        if($('#captcha').hasClass('success'))
        {
            $('#captcha').removeClass('success');
        }
        $('#captcha').addClass('error');
        $("#captchaError").text("wrong input try again");
        txtCaptcha = false;
        
    }
    else{
        txtCaptcha = true;
        if($('#captcha').hasClass('error'))
        {
            $('#captcha').removeClass('error');
        }
        $("#captchaError").text("");
        $('#captcha').addClass('success');
    }
    result = true;
    
    
}







