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
                            <a class="nav-link p-lg-3" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" aria-current="page" href="#">About us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link p-lg-3" href="#">Our Team</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link p-lg-3" href="#">Safety</a>
                        </li>
                        <li class="nav-item">
                            <asp:Button ID="register_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Join us" OnClick="register_button_click" />
                        </li>
                        
                        <li class="nav-item">
                            <asp:Button ID="login_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Join in" OnClick="login_button_click" />
                        </li>

                        <li class="nav-item">
                            <asp:Button ID="logout_button" runat="server" CssClass=" btn nav-link p-lg-3" Text="Logout" OnClick="logout_button_click" />
                        </li>
                    </ul>
                    <!-- <a class="nav_button btn rounded-pill main-btn" href="#"
            ><button class="nav_button" type="submit">
              Sign in
            </button></a
          > -->
                    <!-- <button class="btn btn-outline-success" type="submit">Sign in</button> -->
                </div>
            </div>
        </nav>
        <section
            id="hero"
            class="text-light text-center text-md-start py-5"
            style="background-color: #e9eed6">
            <div class="container">
                <div class="d-sm-flex align-items-center" style="height: 100vh">
                    <!-- div>h1+img -->
                    <div class="py-5 col-md-6 mt-5" style="height: 68vh">
                        <h1 style="color: #062e33">About Us</h1>
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
                        <asp:Button ID="order_button" runat="server" Text="Order Now" class="button" OnClick="order_button_click" />

                    </div>

                    <img
                        class="d-none d-sm-block img-fluid w-50 ms-5 mb-0"
                        src="../images/cherrydeck-rMILC1PIwM0-unsplash.jpg"
                        alt="" />
                    <!-- <div class="col-md-4 col-lg-5 ms-5 mb-5">
                    <img src="cherrydeck-rMILC1PIwM0-unsplash.jpg"
                      class="img-fluid" alt="Phone image">
                  </div> -->
                </div>
                <div class="d-sm-flex align-items-center" style="height: 100vh">
                    <!-- div>h1+img -->
                    <img
                        class="d-none d-sm-block img-fluid w-50 ms-10 mb-0"
                        src="../images/safety_-removebg-preview.png"
                        alt="" />
                    <div class="py-5 col-md-6 mt-5" style="height: 75vh">
                        <h1 style="color: #062e33"
                            class="ms-10 mb-0">Your safety drives us </h1>

                        <p style="color: #1d7977; font-size: 20px">
                            Whether you’re in the back seat or behind the wheel,
                            your safety is essential. We are committed to doing our part, 
                            and technology is at the heart of our approach.
                            We partner with safety advocates and develop new technologies
                            and systems to help improve safety and help make it easier for everyone to get around.
                        </p>
                         
                    </div>


                    <!-- <div class="col-md-4 col-lg-5 ms-5 mb-5">
                    <img src="cherrydeck-rMILC1PIwM0-unsplash.jpg"
                      class="img-fluid" alt="Phone image">
                  </div> -->
                </div>
            </div>
        </section>

        

        <section class="vh-100" style="background-color: #e9eed6; height: 100vh">
            <div class="container py-5 h-100">
                <div class="row  align-items-center h-100">
                    <!--card one -->
                    <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/anas.jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Anas</h4>
                                <p class="text-muted mb-4">
                                    Programmer 
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
                                        <p class="mb-2 h5">8471</p>
                                        <p class="text-muted mb-0">Wallets Balance</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">8512</p>
                                        <p class="text-muted mb-0">Income amounts</p>
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
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/photo_2022-06-21_18-12-00 (2).jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Islam Alabd</h4>
                                <p class="text-muted mb-4">
                                    Programmer 
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
                                        <p class="mb-2 h5">8471</p>
                                        <p class="text-muted mb-0">Wallets Balance</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">8512</p>
                                        <p class="text-muted mb-0">Income amounts</p>
                                    </div>
                                    <!--  <div>
                                        <p class="mb-2 h5">4751</p>
                                        <p class="text-muted mb-0">Total Transactions</p>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--card three -->
                    <div class="col-md-3 col-xl-3 d-flex">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="../images/naim.jpg"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Naim </h4>
                                <p class="text-muted mb-4">
                                    Programmer 
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
                                        <p class="mb-2 h5">8471</p>
                                        <p class="text-muted mb-0">Wallets Balance</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">8512</p>
                                        <p class="text-muted mb-0">Income amounts</p>
                                    </div>
                                    <!--  <div>
                                        <p class="mb-2 h5">4751</p>
                                        <p class="text-muted mb-0">Total Transactions</p>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- card four -->
                    <div class="col-md-3 col-xl-3">
                        <div class="card" style="border-radius: 15px">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="#"
                                        class="rounded-circle img-fluid" style="width: 100px; height: 90px" />
                                </div>
                                <h4 class="mb-2">Ammar </h4>
                                <p class="text-muted mb-4">
                                    Programmer 
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
                                        <p class="mb-2 h5">8471</p>
                                        <p class="text-muted mb-0">Wallets Balance</p>
                                    </div>
                                    <div class="px-3">
                                        <p class="mb-2 h5">8512</p>
                                        <p class="text-muted mb-0">Income amounts</p>
                                    </div>
                                    <!--  <div>
                                        <p class="mb-2 h5">4751</p>
                                        <p class="text-muted mb-0">Total Transactions</p>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <section id="hero"
            class="text-light text-center text-md-start py-5"
            style="background-color: #e9eed6">
             <div class="container">
            <div class="d-sm-flex align-items-center" style="height: 100vh">
                <!-- div>h1+img -->
                <div class="py-5 col-md-6 mt-5" style="height: 75vh">
                    <h1 style="color: #062e33"
                        class="ms-10 mb-0">Join a fleet in Damascus to drive with AutoCar </h1>

                    <p style="color: #1d7977; font-size: 20px">
                        Looking for driving jobs in Damascus?
                        Become an employed driver with a fleet car company that partners with AutoCar. 
                        Start driving for them using AutoCar’s Driver website.
                    </p>

                </div>
                <img
                    class="d-none d-sm-block img-fluid w-50 h-50 ms-10 mb-0"
                    src="../images/join_us-removebg-preview.png"
                    alt="" />


                <!-- <div class="col-md-4 col-lg-5 ms-5 mb-5">
                    <img src="cherrydeck-rMILC1PIwM0-unsplash.jpg"
                      class="img-fluid" alt="Phone image">
                  </div> -->
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
