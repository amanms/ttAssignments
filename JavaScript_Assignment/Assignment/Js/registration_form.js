var fname = document.getElementById("fname");
var mname = document.getElementById("mname");
var lname = document.getElementById("lname");
var dob = document.getElementById("dob");
var email = document.getElementById("email");
var password = document.getElementById("password");
var cnfPassword = document.getElementById("cnfpassword");
var phone_1 = document.getElementById("phone1");
var phone_2 = document.getElementById("phone2");
var address_1  = document.getElementById("address_1");
var address_2 = document.getElementById("address_2");
var  city = document.getElementById("city");
var state = document.getElementById("state");
var zipcode = document.getElementById("zipcode");

myform.addEventListener('submit',(event)=>{
    event.preventDefault();
    validate();
})


function validate(){

    if(validateName(fname)&& validateName(mname) && validateName(lname) && validateDob(dob)&&
    validateEmail(email) && validatePassword(password) && checkPassword(cnfPassword) && validateGender() &&
    validatePhone(phone_1)&& validatePhone(phone_2) && validateAddress(address_1) && validateAddress(address_2)&&
    validateCity(city)  && validZip(zipcode)  && validateSelectTag(state)&&
    validateCaptcha()){
        return true;
    }
    return false;
}
//utility function to print error message
function printError(id,message){
    document.getElementById(id).innerHTML = message;
}
// utility  function to check empty values
function required(value){
    if(value==""){
        return false;
    }
    return true;
}
//utility function to check valid name
function validName(value){
    var nameFormat = /^[A-Za-z]*$/;
    if(!nameFormat.test(value)){
        return false;
    }
    return true;

}
//utility function to check length of given values
function inBetween(value,min,max){
    if(value<min || value>max){
        return false;
    }
    return true;

}
//utility function to check valid city value
function isValidCity(city){
    const cityFormat = /^[A-Za-z ]+$/;
    const cityLen = city.length;
    const min=3,max=20;
    if(!(cityFormat.test(city))||(!(inBetween(cityLen,min,max)))){
        return false;
    }
    return true;

}
//utility function to check valid mobile number
function isValidPhone(phone){
    const phoneFormat = /^\d{10}$/;
    if(!phoneFormat.test(phone)){
        return false;
    }
    return true;
}
//utility function to check valid zipcode
function validZip(zip){
    const zipFormat = /^[0-9]+$/;
    if(!(zipFormat.test(zip))||(zip.length!=6)){
        return false;
    }
    return true;

}
//utility function to check valid email
function validEmail(email){
    const emailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    return emailFormat.test(email);
}
//utility function to add error message
function showError(id,message){
    var  formField  = id.parentElement;
    var msg = formField.querySelector('small');
    formField.className='form-field error';
    msg.innerHTML=message;
}
//utility function to add success 
function showSuccess(id){
    var formField = id.parentElement;
    var msg = formField.querySelector('small');
    formField.className='form-field success';
    msg.innerHTML="";
}
//utility function to generate randon captcha values
function randomCaptcha(){
    var element = document.getElementById('captcha')
    var symbol = ['+','-','*','/']
    var len = symbol.length;
    var digit1 = Math.floor((Math.random() * 50) + 10);
    var digit2 = Math.floor((Math.random() * 10) + 1);
    document.getElementById("digit1").value = digit1;
    document.getElementById("digit2").value = digit2;
    var parameter = symbol[Math.floor(Math.random()*len)];
    document.getElementById("symbol").innerHTML = parameter;
    element.classList.remove('error');
    element.classList.remove('success');

}
//function to validate name
function validateName(id){
    var result = false;
    const name = id.value;
    const min=3,max=25;
    var len = name.length;
    if(!required(name)){
        showError(id,'input is blank');
    }
    
    else if(!validName(name)){
        showError(id,'Inavlid name format');
    }
    else if(!inBetween(len,min,max)){
        showError(id,'Username must be between '+min+' and '+ max+' characters.')
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}

//function to validate date of birth
function validateDob(id){
    let result = false;
    var dob = id.value;
    var dtCurrent = new Date();
    var parts = dob.split("-");
    if(!required(dob)){
        showError(id,'input is empty')
    }
    else if((dtCurrent.getFullYear()-parts[0])<18){
        showError(id,'Not eligible');
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;

}
//function to validate email
function validateEmail(id){
    var result = false;
    var email = id.value;
    if(!required(email)){
        showError(id,'Email can not be blank');
    }
    else if(!validEmail(email)){
        showError(id,'Email is  invalid');
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;

}
//function to validate password
function validatePassword(id){
    var result = false;
    var pass = id.value;
    var passLenght = pass.length;
    var min=8,max=13;
    if(!required(pass)){
        showError(id,'Password can not be  blank');
    }
    else if(!inBetween(passLenght,min,max)){
        showError(id,'Password must be between '+min+' and '+ max+' characters.')
    }
    else{
        showSuccess(id)
        result = true;
    }
    return result;
}
//function to match password and confrim password
function checkPassword(id){
    var result = false;
    var cnfPassword = id.value;
    var pass = password.value;
    if(!required(cnfPassword)){
        showError(id,'Re-Enter your password');
    }
    else if(pass!=cnfPassword){
        showError(id,'Password does not match');
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}
//function to validate zipcode
function validateZip(id){
    var result = false;
    var zip = id.value;
    var len = zip.length;
    
    if(!required(zip)){
        showError(id,"Enter your Zipcode");
    }
    else if(!validZip(zip)){
        showError(id,"Invalid input");
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}
//function to validate mobile number
function validatePhone(id){
    var result = false;
    var phoneNum = id.value;
    var phLen = phoneNum.length;
    if(!(required(phoneNum))){
        showError(id,"Phone number can not be blank");
    }
    else if(!(isValidPhone(phoneNum,phLen))){
        showError(id,"Invalid input");
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}
//function to validate address details
function validateAddress(id){
    var result = false;
    var address = id.value;
    var lenAddress = address.length;
    if(!(required(address))){
        showSuccess(id,"Address can not be blank");
    }
    else if(!(inBetween(lenAddress,3,20))){
        showError(id,"Invalid Address");
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}
//function to validate city name
function validateCity(id){
    var result = false;
    var city = id.value;
    var cityLen = city.length;
    var min=4,max=15
    if(!(required(city))){
        showError(id,"City name can not be empty");

    }
    else if(!(isValidCity(city))){
        showError(id,"Invalid city name");
    }
    else{
        showSuccess(id);
        result = true;
    }
    return result;
}
//function to calculate captcha result 
function calculateCaptcha(){
    var result;
    var firstDigit = parseInt(document.getElementById('digit1').value);
    var secondDigit = parseInt(document.getElementById('digit2').value);
    var operator = document.getElementById('symbol').innerHTML;
    
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
//function to validate captcha
function validateCaptcha(){
    var result = false;
    var ans = answer.value;
    var res = calculateCaptcha();
    var element = document.getElementById("captcha");
    if(!(required(ans))){
        element.classList.add('error');
        printError('captchaerror',"captcha can not be  blank");
       
    }
    else if(ans!=res){
        element.classList.add('error');
        printError('captchaerror','wrong input try again')
    }
    else{
        element.classList.add('success');
        printError('captchaerror',"");
        result=true;
    }
    return result;
    
    
}
//function to validate gender
function validateGender(){
    var result = false;
    var Gender = document.myform.Gender.value;
    var element = document.getElementById('Gender');
    if(!required(Gender)){
        element.classList.add("error");
        printError('genderError','select your gender');
    }
    else{
        element.classList.add("success");
        printError('genderError',"");
        result = true;
    }
    return result;
}
//function to validate select tags i.e country,state
function validateSelectTag(id){
    var result = false;
    var inputValue = id.value;
    if(!(required(inputValue))){
        showError(id,'invalid input');
    }
    else{
        showSuccess(id);
        result = true;

    }
    return result;
}
//function to populate state and country name by ajax call
function loadCountry(){
    var xhr = new XMLHttpRequest();
    var state = document.getElementById('state');
    var country = document.getElementById('country');
    //console.log(xhr);
    var i;
    xhr.open('GET','../Json/country.json',true);
    xhr.onload = function(){
        if(this.status==200){
            var obj = JSON.parse(this.responseText);
            var len = obj.country.length;
            var statelen = obj.states.length;
            //console.log(len);
            for(i=0;i<len;i++){
                var option = document.createElement('option');
                option.value=option.text = obj.country[i].name;
                country.add(option);
            }
            for(i=0;i<statelen;i++){
                var option = document.createElement('option');
                option.value=option.text = obj.states[i].name;
                state.add(option);
            }

        }
        else{
            console.log('error');
        }
    }
    xhr.send();
}



