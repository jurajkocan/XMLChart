
//when enter click on inputs
$("#signup").keypress(function (e) {
    if (e.which == 13) {
        validateEmail();
        validatePassword();
    }    
});

//click function of sign button
$("#submit").bind("click", function () {
    validateEmail();
    validatePassword();
});

//check email adress
function validateEmail() {
    var stringUncorrectEmail = 'uncorrect email adress';

    var stringEmail = $('#emailTextboxID').val();
    var splitedEmail = stringEmail.split("@");

    // check '@' in email adress
    if (splitedEmail.length == 2) {
        //check length splited email
        if (splitedEmail[0].length == 0 || splitedEmail[1].length == 0) {
            alert(stringUncorrectEmail);
        }
        else {
            //todo: call some hiden button click;
        }
    }
    else {
        alert(stringUncorrectEmail);
    }
};

//check password
function validatePassword() {
    var stringUncorrectPassword = 'password are not same'
    var stringShortPassrod = 'min length of password is "3"';

    var passwordID1 = $('#passwordTextboxID1');
    var passwordID2 = $('#passwordTextboxID2');
    if (passwordID1.val().length < 3 || passwordID2.val().length < 3) {        
        passwordID1.val("");
        passwordID2.val("");
        alert(stringShortPassrod);

    }
    else {
        if (passwordID1.val() != passwordID2.val()) {
            passwordID1.val("");
            passwordID2.val("");
            alert(stringUncorrectPassword);
        }
    }    
}