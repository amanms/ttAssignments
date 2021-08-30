$(document).ready(function(){
    $('#firstName').text(localStorage.getItem('firstName'))
    $('#middleName').text(localStorage.getItem('middleName'))
    $('#lastName').text(localStorage.getItem('lastName'))
    $('#dateOfBirth').text(localStorage.getItem('dateOfBirth'))
    $('#mobileNumber').text(localStorage.getItem('mobileNumber'))
    $('#email').text(localStorage.getItem('email'))
    $('#country').text(localStorage.getItem('country'));
    $('#gender').text(localStorage.getItem('gender'));
    $('#currentAddress').text(localStorage.getItem('currentAddress'));
    $('#currentState').text(localStorage.getItem('currentState'));
    $('#currentCity').text(localStorage.getItem('currentCity'));
    $('#currentCityZipcode').text(localStorage.getItem('currentCityZipcode'));
    $('#permanentAddress').text(localStorage.getItem('permanentAddress'));
    $('#permanentState').text(localStorage.getItem('permanentState'));
    $('#permanentCity').text(localStorage.getItem('permanentCity'));
    $('#permanentCityZipcode').text(localStorage.getItem('permanentCityZipcode'));
    $('#imagefile').attr('src',localStorage.getItem('recentimage'));




    var x = localStorage.getItem('classLen');
    for(var i=0;i<x;i++){
        html = "";
        html += '<div class="form-input">';
        html += '<label class="mobile-class">Mobile Number:-</label>';
        html += '<span class="mobile-number-value"></span>';
        $('.mobile-number').append(html);
    }
    var row = 0;
    $('.mobile-number-value').each(function(){
        row = row+1;
        $(this).attr('id','mobilenumbervalue'+row).text(localStorage.getItem('mobilenumbervalue'+row));
        
        
    })

});

