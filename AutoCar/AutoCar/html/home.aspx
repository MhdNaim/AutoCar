<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="AutoCar.html.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css" />
    <link href="../css/index.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg sticky-top">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img class="logo" src="../images/logo.png" alt="" /></a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#main"
                    aria-controls="main"
                    aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="main">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" aria-current="page" href="#order">Order Now</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" aria-current="page" href="#aboutus">About us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" href="#pricing">Pricing</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" href="#team">Our Team</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" href="#join">Join Us</a>
                        </li>

                        <li class="nav-item">
                            <asp:Button ID="register_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Sign Up" OnClick="register_button_click" />
                        </li>

                        <li class="nav-item">
                            <asp:Button ID="login_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Sign In" OnClick="login_button_click" />
                        </li>

                        <li class="nav-item">
                            <asp:Button ID="logout_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Logout" OnClick="logout_button_click" />
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="w-section section" id="order" style="background-image: url(../images/app-bg-2.jpg); padding-top: 120px; background-position: 50% 50%; background-size: cover; padding-bottom: 120px; background-repeat: no-repeat; height: 100vh">
            <div class="content" style="position: absolute; left: 0; top: 50%; right: 0; display: block; margin-right: auto; margin-left: auto; text-align: center">
                <p style="max-width: 700px; font-size: 30px; line-height: 30px; margin-bottom: 20px; margin-left: 200px; font-weight: bolder; color: gray">
                    <span style="color: #ec8924">AutoCar</span> uses your phone's GPS to detect your location and connect you with the nearest available<span style="color: #ec8924">AutoCar</span>  driver. Just kick back, relax, and we will be there before you know it.
                </p>
                <asp:Button ID="Button1" runat="server" Style="margin-left: 480px" Text="Order Now" class="button" OnClick="order_button_click" />

            </div>
        </div>
        <section
            id="heropage"
            class="text-light text-center text-md-start py-5"
            style="background-color: #e9eed6">
            <div class="container">

                <div class="d-sm-flex align-items-center" id="aboutus" style="height: 100vh">
                    <!-- div>h1+img -->
                    <div class="py-5 col-md-6 mt-5" style="height: 68vh">
                        <h1 style="color: #062e33; margin-top: 100px">About Us</h1>
                        <h2 style="color: #ec9555">We reimagine the way the world moves for the better
                        </h2>
                        <p style="color: #1d7977; font-size: 20px">
                            Movement is what we power. It’s our lifeblood. It runs through our
              veins. It’s what gets us out of bed each morning. It pushes us to
              constantly reimagine how we can move better. For you. For all the
              places you want to go. For all the things you want to get. For all
              the ways you want to earn. Across the entire world. In real time.
              At the incredible speed of now.
                        </p>

                    </div>

                    <img
                        class="d-none d-sm-block img-fluid w-50 ms-5 mb-0"
                        src="../images/cherrydeck-rMILC1PIwM0-unsplash.jpg"
                        alt="" />
                   
                </div>
                </div>
              
        </section>
        <div class="w-section section" id="pricing" style="background-image: url(../images/app-bg-3.jpg); padding-top: 120px; background-position: 50% 50%; background-size: cover; padding-bottom: 120px; background-repeat: no-repeat; height: 100vh">
            <div class="content" style="justify-items: center; left:0; top: 50%; right: 0; display: block; margin-right: auto; margin-left: auto; text-align: center">
                <h1 style="color:#fff5d4; margin-top:150px"
                    class="ms-10 mb-0">Reliable Pricing.<br /> Accountable Service.</h1>
                <div style="margin-top:40px; margin-left: 22%">
                    <p style="max-width: 700px; font-size: 24px; line-height: 30px; margin-bottom: 20px; margin-left: 200px; font-weight: bolder; color: #fff5d4; font-family: 'Muller Medium',sans-serif">
                        We respect your privacy, so we built our app to work without having your credit card on file so you can pay your driver your way, not ours, with cash or a credit card. With YellowCabCo., you can always rely on a consistent fare, with no surge pricing, during peak transportation events while letting you give immediate feedback on how our drivers are doing out in the field.               
                    </p>
                </div>
            </div>
        </div>




        <section class="vh-35" style="background-color: #062e33; height: 100vh">
            <div class="container py-5">

                <div class="row  align-items-center h-80">
                    <h1 style="color: #e9eed6; margin-bottom: 50px;margin-top:60px"  id="team">Our Team</h1>
                    <!--card one -->
                    <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px;background-color:#e1efc7">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/anas.jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Anas</h4>
                                <p class="text-muted mb-4">
                                    Markiting Manager
                                </p>
                                <div class="mb-4 pb-2">
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-facebook-f fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-twitter fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-linkedin" aria-hidden="true"></i>
                                    </button>
                                </div>

                                <div class="d-flex justify-content-between text-center mt-5 mb-2">
                                    <div>
                                        <p class="mb-2 h5">71</p>
                                        <p class="text-muted mb-0">Project</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">4 Years</p>
                                        <p class="text-muted mb-0">Experince</p>
                                    </div>
                                    <!--   <div>
                                        <p class="mb-2 h5">4751</p>
                                        <p class="text-muted mb-0">Total Transactions</p>
                                    </div>-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--card two -->
                    <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px;background-color:#e1efc7">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/photo_2022-06-21_18-12-00 (2).jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Islam Alabd</h4>
                                <p class="text-muted mb-4">
                                   Front-end Developer 
                                </p>
                                <div class="mb-4 pb-2">
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-facebook-f fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-twitter fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-linkedin" aria-hidden="true"></i>
                                    </button>
                                </div>

                                <div class="d-flex justify-content-between text-center mt-5 mb-2">
                                    <div>
                                        <p class="mb-2 h5">20</p>
                                        <p class="text-muted mb-0">Project</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">3 Years</p>
                                        <p class="text-muted mb-0">Experince</p>
                                    </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--card three -->
                   <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px;background-color:#e1efc7">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/naim.jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Naim Ayroud</h4>
                                <p class="text-muted mb-4">
                                   Back-end Developer 
                                </p>
                                <div class="mb-4 pb-2">
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-facebook-f fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-twitter fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-linkedin" aria-hidden="true"></i>
                                    </button>
                                </div>

                                <div class="d-flex justify-content-between text-center mt-5 mb-2">
                                    <div>
                                        <p class="mb-2 h5">15</p>
                                        <p class="text-muted mb-0">Project</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">5 Years</p>
                                        <p class="text-muted mb-0">Experince</p>
                                    </div>                                 
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- card four -->
                    <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px;background-color:#e1efc7">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="#"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Ammar </h4>
                                <p class="text-muted mb-4">
                                  HR Manager 
                                </p>
                                <div class="mb-4 pb-2">
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-facebook-f fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-twitter fa-lg"></i>
                                    </button>
                                    <button type="button" class="btn btn-floating" style="background-color: #062e33; color: #ec9555">
                                        <i class="fab fa-linkedin" aria-hidden="true"></i>
                                    </button>
                                </div>

                                <div class="d-flex justify-content-between text-center mt-5 mb-2">
                                    <div>
                                        <p class="mb-2 h5">5 </p>
                                        <p class="text-muted mb-0">Award</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">6 Years</p>
                                        <p class="text-muted mb-0">Experince</p>
                                    </div>                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="hero"
            class="text-light text-center text-md-start py-5"
            style="background-color: #e9eed6;height:100vh">
            <div class="container" id="join">
                <div class="d-sm-flex align-items-center">
                    <!-- div>h1+img -->
                    <div class="py-5 col-md-6 mt-5">
                        <h1 style="color: #062e33; margin-top: 80px"
                            class="ms-10 mb-0">Join a fleet in Damascus to drive with AutoCar </h1>

                        <p style="color: #1d7977; font-size: 20px">
                            Looking for driving jobs in Damascus?
                        Become an employed driver with a fleet car company that partners with AutoCar. 
                        Start driving for them using AutoCar’s Driver website.
                        </p>

                    </div>
                    <img
                        class="d-none d-sm-block img-fluid w-50 h-70 mx-3 mb-0"
                        src="../images/join_us-removebg-preview.png"
                        alt="" />
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="text-center text-lg-start text-muted" style="background-color: #062e33">
            <!-- Section: Social media -->
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom" style="background-color: #062e33">
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="" style="color: #f2dd80; background-color: #062e33">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">AutoCar
                            </h6>
                            <p>
                                Read about our team’s commitment to provide everyone on our global platform with the technology that can help them move ahead.
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Products
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Ride</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Drive</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Deliver</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Global citizenship

                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Safety</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Diversity and Inclusion</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Sustainability</a>
                            </p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p>Damascus, DM 10012, DT</p>
                            <p>
                                aoutcar@gmail.com
                            </p>
                            <p>+ 963 234 567 88</p>
                            <p>+ 963 234 567 89</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="color: #f2dd80">
                © 2023 Copyright:
    <a class="text-reset fw-bold" href="#">AutoCar.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </form>
</body>
</html>
