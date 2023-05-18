<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vehicle.aspx.cs" Inherits="AutoCar.html.vehicle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link href="../css/vehicle.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    

                    <div class="col-md-6 col-lg-6 col-xl-5 offset-xl-1">

                        <div>
                            <h1 class="fw-bold mb-4" style="color:  #006964">Vehicle Information</h1>
                        </div>
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="carid"
                                name="carid"
                                placeholder="Car ID"
                                class="form-control form-control-lg" />
                            <!-- <label class="form-label" for="form1Example13"
                  >Email address</label
                > -->
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="carname"
                                name="carname"
                                placeholder="Car Name"
                                class="form-control form-control-lg" />
                            <!--    <label class="form-label" for="form1Example23">Password</label> -->
                        </div>
                         <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="model"
                                name="model"
                                placeholder="Model"
                                class="form-control form-control-lg" />
                            <!--    <label class="form-label" for="form1Example23">Password</label> -->
                        </div> <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="speed"
                                name="speed"
                                placeholder="Speed"
                                class="form-control form-control-lg" />
                            <!--    <label class="form-label" for="form1Example23">Password</label> -->
                        </div> <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="capacity"
                                name="capacity"
                                placeholder="Capacity"
                                class="form-control form-control-lg" />
                            <!--    <label class="form-label" for="form1Example23">Password</label> -->
                        </div> <div class="form-outline mb-4">
                            <input
                                type="text"
                                id="color"
                                name="color"
                                placeholder="Color"
                                class="form-control form-control-lg" />
                            <!--    <label class="form-label" for="form1Example23">Password</label> -->
                        </div>
                        <div class="d-flex  mb-4">
                            <!-- Checkbox -->
                            <div class="form-check">
                               <label
                                    class="form-check-label"
                                    for="form1Example3"
                                    style="color: black">
                                    Is auto
                                </label>
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value=""
                                    id="form1Example3"
                                    checked />
                            </div>
                        </div>

                        <!-- Submit button -->
                      

                        <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-lg btn-block"
                            style="background-color: #006964; margin-left: 130px; width: 50%;color:#f2dd80" />

                        <!-- <div class="divider d-flex align-items-center my-4">
                  <p class="text-center fw-bold mx-3 mb-0 text-muted" style="color: aliceblue;">OR</p>
                </div> -->

                        <!-- <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998" href="#!"
                  role="button">
                  <i class="fab fa-facebook-f me-2"></i>Continue with Facebook
                </a>
                <a class="btn btn-primary btn-lg btn-block" style="background-color: #b4152d" href="#!"
                  role="button">
                  <i class="fab fa-google me-2 "></i>Continue with Google</a> -->

                    </div>
                    <div class="col-md-6 col-lg-6 col-xl-6">
                        <img src="../images/car.png" class="img-fluid" alt="Phone image" />
                    </div>
                </div>
            </div>
        </section>
        s
    </form>
</body>
</html>
