
var txtFirstName = txtLastName = txtEmail = txtPassword = txtAddress =  txtCountry = txtState = txtZipcode = false;

function onSubmit(){
    if((txtFirstName==true)&&(txtLastName==true)&&(txtEmail==true)&&(txtPassword==true)&&(txtAddress==true)&&(txtAddress==true)&&
    (txtCountry==true)&&(txtState==true)&&(txtZipcode==true)){
        alert("form submitted ");
    }
    else{
        alert("Try again");
    }
}

// Utility function
function isRequired(value){
    if(value == ""){
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
function validZip(zip){
    const zipFormat = /^[0-9]+$/;
    if(!(zipFormat.test(zip))||(zip.length!=6)){
        return false;
    }
    return true;

}
function validateName(id,name){
    var nameFormat = /^[A-Za-z]*$/;
    var errorId = id;
    var result = false;
    if(!isRequired(name)){
        showError(errorId,"Empty field");
    }
    else if(!nameFormat.test(name)){
        showError(errorId,"Invalid name format");
    }
    else if(!inBetween(name,3,10)){
        showError(errorId,"Name should be inbetween 3 and 10");
    }
    else{
        showSuccess(errorId);
        result = true;
    }
    return result;
}
function isValidName(name){
    var nameFormat = /^[A-Za-z]*$/;
    if(!nameFormat.test(name)){
        return false;
    }
    return true;
}
function showError(id,message){
    var  formField  = id.parentElement;
    // var msg = document.querySelector("small");
    formField.className='form-field error';
    id.innerHTML=message;
}
function showSuccess(id){
    var formField = id.parentElement;
    // var msg = document.querySelector("small");
    formField.className='form-field success';
    id.innerHTML="";
}
//------------------------------------------------------------------------------------------
function validateFirstName(name){
    var firstNameErrorId = document.getElementById("firstNameFormat");
    if(!validateName(firstNameErrorId,name)){
        txtFirstName = false;
    }
    else{
        txtFirstName = true;
    }
}

function validateLastName(name){
    var lastNameErrorId = document.getElementById("lastNameFormat");
    if(!validateName(lastNameErrorId,name)){
        txtLastName = false;
    }
    else{
        txtLastName = true;
    }
}
function validateEmail(email){
    var emailErrorId = document.getElementById("emailFormat");
    var emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!isRequired(email)){
        showError(emailErrorId,"Enter your email");
        txtEmail = false;
    }
    else if(!emailFormat.test(email)){
        showError(emailErrorId,"Invalid email");
        txtEmail = false;
    }
    else{
        showSuccess(emailErrorId);
        txtEmail = true;
    }
}
function validatePassword(passwordInput){
    var passwordErrorId = document.getElementById("passwordFormat");
    var min = 8,max = 12;
    
    if(!isRequired(passwordInput)){
        showError(passwordErrorId,"Empty field");
        txtPassword = false;
        
    }
    else if(!inBetween(passwordInput,min,max)){
        showError(passwordErrorId,"Password must be greater than 8 and smaller than 13");
        txtPassword = false;
    }
    else{
        showSuccess(passwordErrorId);
        txtPassword = true;

    }
}
function validateAddress(address){
    var addressId = document.getElementById("addressFormat");
    
    if(!(isRequired(address))){
        showError(addressId,"Address can not be blank");
        txtAddress = false;
    }
    else if(!(inBetween(address,3,50))){
        showError(addressId,"Address must be greater than 3 smaller than 50");
        txtAddress = false;
    }
    else{
        showSuccess(addressId);
        txtAddress = true;
    }
}
function validateCountry(country){
    var countryFormatId = document.getElementById("countryFormat")
    if(!isRequired(country)){
        showError(countryFormatId,"Empty field")
        txtCountry = false;
    }
    else if(!isValidName(country)){
        showError(countryFormatId,"Invalid entry")
        txtCountry = false;
    }
    else{
        showSuccess(countryFormatId)
        txtCountry = true;
    }
}
function validateState(state){
    var stateFormatId = document.getElementById("stateFormat")
    if(!isRequired(state)){
        showError(stateFormatId,"Empty field")
        txtState = false;
    }
    else if(!isValidName(state)){
        showError(stateFormatId,"Invalid entry")
        txtState = false;
    }
    else{
        showSuccess(stateFormatId)
        txtState = true;
    }
}
function validateZipcode(zipcode){
    var zipcodeFormatId = document.getElementById("zipcodeFormat")
    if(!isRequired(zipcode)){
        showError(zipcodeFormatId,"Empty field")
        txtZipcode = false;
    }
    else if(!validZip(zipcode)){
        showError(zipcodeFormatId,"Invalid entry")
        txtZipcode = false;
    }
    else{
        showSuccess(zipcodeFormatId)
        txtZipcode = true;
    }
}
// function loadCountry(){
//     var xhr = new XMLHttpRequest();
//     var country = document.getElementById('country');
//     var i;
//     xhr.open('GET',"https://www.universal-tutorial.com/api/countries/",true);
//     xhr.setRequestHeader('Authorization',"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJhbnNodXJhajIyMDRAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoibUNQMW9ZUHVSeGIwWHpFeUpvTlB4dGM5eDROUzhlajhJYjVOdHdvd2hpQWwzNUUzbEZxUWJCYzFYUy1hTktMQlZoVSJ9LCJleHAiOjE2MzI4NTM2MjB9.JMnd4yMQC-xizyDDKiO5fVfzTRZcMGP8aBSpvKKqfHg");
//     xhr.setRequestHeader("Accept","application/json");
//     xhr.onload = function(){
//         if(this.status==200){
//             var obj = JSON.parse(this.responseText);
//             var len = obj.length;
//             for(i=0;i<len;i++){
//                 var option = document.createElement('option');
//                 option.value=option.text = obj[i].country_name;
//                 country.add(option);
//             }
//         }
//     }
//     xhr.send();
// }



