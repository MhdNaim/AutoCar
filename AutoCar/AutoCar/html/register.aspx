<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="AutoCar.html.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap core CSS -->
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../bootstrap/css/fontawesome.css" />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="../css/login.css" />
    <title>Register</title>
  </head>
  <body>
      <form id="form1" runat="server">
        <div>
    <section class="vh-100">
      <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
          <div class="col-md-6 col-lg-6 col-xl-5 offset-xl-1">
         
              <div>
                <h1 class="fw-bold mb-4" style="color: #f2dd80">Register</h1>
              </div>
              <!-- First Name input -->
              <div class="form-floating mb-4" style="margin-bottom: 5px;">
                <input
                  type="text"
                  id="form1Example1"
                    name="firstname"
                  placeholder="First Name"
                  class="form-control form-control-lg"
                  style="margin-top: 5px"
                />
                <label class="form-label" for="form1Example13"
                  >First Name</label
                >
              </div>
              <!-- Last Name input -->
              <div class="form-floating mb-4" style="margin-top: 5px">
                <input
                  type="text"
                  id="form1Example12"
                    name="lastname"
                  placeholder="Last Name"
                  class="form-control form-control-lg"
                />
                <label class="form-label" for="form1Example13">Last Name</label>
              </div>
                <!----- Birth of date ----->

                <div  class="input-group form-floating mb-3"> 
       <span class="input-group-text" id="dof">Date Of Birth</span>
  <input type="date" class="form-control jDatepicker" name="birthdate" style="vertical-align:central;font-size:18px" placeholder="mm-dd-yyyy"/>
  </div>


                <!--- Gender ---->


                <div class="btn-group mb-3">

     <span class="input-group-text" >Gender</span>

  <input type="radio" class="btn-check" value="male" name="gender" id="option1" autocomplete="off" checked />
  <label class="btn" for="option1" style=" color:#f2dd80">Male</label>

  <input type="radio" value="female" class="btn-check" name="gender" id="option2" autocomplete="off" />
  <label class="btn" for="option2" style=" color:#f2dd80">Female</label>
</div>


              <!-- Email input -->
              <div class="form-floating mb-4">
                <input
                  type="email"
                  id="form1Example13"
                    name="email"
                  placeholder="Email"
                  class="form-control form-control-lg"
                />
                <label class="form-label" for="form1Example13"
                  >Email address</label
                >
              </div>

              <!-- Password input -->
              <div class="form-floating mb-4">
                <input
                  type="password"
                  id="form1Example23"
                    name="password"
                  placeholder="password"
                  class="form-control form-control-lg"
                />
                <label class="form-label" for="form1Example23">Password</label>
              </div>
              <div class="form-floating mb-4">
                <input
                  type="password"
                    name="confirmpassword"
                  id="floatingInput"
                  placeholder="Confirm Password"
                  class="form-control form-control-lg"
                />
                <label class="form-label" for="form1Example23">Confirm Password</label>
              </div>

                <!-------phone number and Button---->
                <div id="phonenumber_section">
                <!---- PhoneNumber ------->

                 <div class="form-floating mb-4" style="margin-top: 5px">
                <input
                  type="text"
                  id="phonenumber"
                    name="phonenumber"
                  placeholder="PhoneNumber"
                  class="form-control form-control-lg"
                />
                <label class="form-label" for="form1Example13">PhoneNumber</label>
              </div>
                  <!---- Verfiy code ------->

               
                
                 <!-- Send OTP button -->
              <button
                  type="button"
                class="btn btn-lg btn-block"
                  id="send_code_btn"
                style="background-color: #f2dd80; margin-left: 1px; width: 50%"
                 
              >
                send SMS
              </button>

                    </div>

                <!---- otp with button--->
                <div id="otp_section">
                  <div class="form-floating mb-4" style="margin-top: 5px">
                <input
                  type="text"
                  id="otp"
                    name="otp"
                  placeholder="Verification Code"
                  class="form-control form-control-lg"
                />
                      <label class="form-label" for="form1Example13">Verification Code</label>
              </div>

                 <!-- Verfiy OTP button -->
              <button
                  type="button"
                class="btn btn-lg btn-block"
                  id="verfiy_code_btn"
                style="background-color: #f2dd80; margin-left: 1px; width: 50%"
              >
                  Verfiy
                
              </button>
           </div>

             
         <asp:Button  ID="register_btn" runat="server" OnClick="registrationForm_ServerClick" CssClass="btn btn-lg btn-block register_btn"  Text="Register"  Enabled="true"/>
                 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            
             
              <br />
              <label id="message" class="text-white"></label>

          </div>
          <div class="col-md-6 col-lg-6 col-xl-6">
            <img src="../images/login.svg" class="img-fluid" alt="Logo image" />
          </div>
        </div>
      </div>
    </section>
   </div>
  </form>
       <script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.6.5/firebase-auth.js"></script>
      <script>
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
          registerButton.style.display = "none"; //  hide register button
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

    var appVerifier = new firebase.auth.RecaptchaVerifier('send_code_btn', {
        'size': 'invisible'
    });

    firebase.auth().signInWithPhoneNumber(phoneNumberValue, appVerifier)
        .then(function (confirmationResult) {
            phoneNumberSection.style.display = 'none';
            otpSection.style.display = "block"
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
      </script>
 </body>
</html>

