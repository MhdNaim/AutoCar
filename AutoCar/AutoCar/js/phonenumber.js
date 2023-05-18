// Initialize Firebase
var config = {
    apiKey: "AIzaSyAnhSBRNHwlLnbz51mFpwxc70CzEeNVHS8",
    authDomain: "phonenumberverefiy.firebaseapp.com",
    projectId: "phonenumberverefiy",
    storageBucket: "phonenumberverefiy.appspot.com",
    messagingSenderId: "715131411802",
    appId: "1:715131411802:web:658a76ac6ea6711f07e763",
    measurementId: "G-N16P8RZ789"
};
firebase.initializeApp(config);

// Get references to DOM elements
var phoneNumber = document.getElementById('phonenumber');
var sendCodeButton = document.getElementById('send_code_btn');
var verificationCode = document.getElementById('otp');
var verifyCodeButton = document.getElementById('verfiy_code_btn');
var phoneNumberSection = document.getElementById('phonenumber_section');
var otpSection = document.getElementById('otp_section');
var message = document.getElementById('message');
var registerButton = document.getElementById("<%= register_btn.ClientID %>");

// Disable send code button initially
sendCodeButton.disabled = true;
registerButton.style.display = "none"; // To hide the button
otpSection.style.display = "none"; // To hide the button

// Listen for changes in phone number input field
phoneNumber.addEventListener('input', function () {
    var phoneNumberRegex = /^\+[1-9]\d{1,14}$/;
    if (phoneNumberRegex.test(phoneNumber.value)) {
        sendCodeButton.disabled = false;
    } else {
        sendCodeButton.disabled = true;
    }
});

// Send verification code to user's phone
sendCodeButton.addEventListener('click', function () {
    var phoneNumberValue = phoneNumber.value;

    phoneNumberSection.style.display = 'none';
    otpSection.style.display = "block"
    var appVerifier = new firebase.auth.RecaptchaVerifier('send_code_btn', {
        'size': 'invisible'
    });

    firebase.auth().signInWithPhoneNumber(phoneNumberValue, appVerifier)
        .then(function (confirmationResult) {
            // SMS sent
            var verificationId = confirmationResult.verificationId;
            message.innerHTML = 'Verification code sent to ' + phoneNumberValue;
            verifyCodeButton.addEventListener('click', function () {
                var verificationCodeValue = verificationCode.value;
                confirmationResult.confirm(verificationCodeValue)
                    .then(function (result) {
                        // User signed in successfully
                        var user = result.user;
                        otpSection.style.display = 'none';
                        registerButton.style.display = "block";
                        message.innerHTML = 'Phone Number Is Verified successfully';
                    })
                    .catch(function (error) {
                        // User couldn't sign in
                        message.innerHTML = 'Error verifying phone number: ';
                    });
            });
        })
        .catch(function (error) {
            // SMS not sent
            message.innerHTML = 'Error sending verification code: ' + error.message;
        });
});