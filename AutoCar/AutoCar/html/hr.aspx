<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hr.aspx.cs" Inherits="AutoCar.html.hr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css" />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <title>HR Manager</title>

    <script src="jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/hr.css" />
    <script>
        $(document).ready(function () {
            $("#tap1").click(function () {
                $("#tap-1").click();
            });
            $("#tap2").click(function () {
                $("#tap-2").click();
            });
            $("#tap3").click(function () {
                $("#tap-3").click();
            });
        });
    </script>

</head>
<body style="background-color: #e9eed6;">
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-dark fixed-top">
                <div class="container-fluid">
                    <div>
                        <a class="navbar-brand" href="#">
                            <span class="icon"><i class="fas fa-home fa-lg"></i></span></a>
                    </div>
                    <div class="iconc">
                        <a class="navbar-brand" href="#">
                            <span class="icon"><i class="fas fa-bell fa-lg"></i></span></a>
                    </div>
                    <span class="icon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation"><i class="fas fa-bars fa-lg"></i></span>
                    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" style="background-color: #062e33;">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" style="color: #f2dd80;" id="offcanvasDarkNavbarLabel">HR Manager</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                                <li class="nav-item">
                                    <asp:Button ID="logout_button" runat="server" CssClass="btn nav-link" Text="Logout" OnClick="logout_button_click" />
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">More
                                    </a>
                                    <ul class="dropdown-menu " style="background-color: #062e33;">
                                        <li><a class="link" href="employee.aspx">Add Employee <i class="fas fa-plus-circle"></i></a></li>
                                        <li>
                                            <hr class="" style="color: #f2dd80;" />
                                        </li>
                                        <li><a class="link" href="#" id="tap2">Create Report <i class="far fa-eye"></i></a></li>
                                        <li>
                                            <hr class="" style="color: #f2dd80;" />
                                        </li>
                                        <li><a class="link" href="#" id="tap2">Show Shifts <i class="far fa-eye"></i></a></li>
                                        <li>
                                            <hr class="" style="color: #f2dd80;" />
                                        </li>
                                        <li><a class="link" href="#" id="tap3">My Info <i class="fas fa-info-circle"></i></a></li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="d-flex mt-3" role="search">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                                <button class="searchb" type="submit">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="blog-card">
                <input type="radio" name="select" id="tap-1" checked />
                <input type="radio" name="select" id="tap-2" />
                <input type="radio" name="select" id="tap-3" />
                <input type="checkbox" id="imgTap" />
                <div class="sliders">
                    <label for="tap-1" class="tap tap-1"></label>
                    <label for="tap-2" class="tap tap-2"></label>
                    <label for="tap-3" class="tap tap-3"></label>
                </div>
                <div class="inner-part">
                    <label for="imgTap" class="img">
                        <img class="img-1" src="#" />
                    </label>
                    <div class="content content-1">
                        <span>26 December 2017</span>
                        <div class="title">
                            Lorem Ipsum Dolor
                        </div>
                        <div class="text">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo animi atque aliquid pariatur voluptatem numquam, quisquam. Neque est voluptates doloribus!
                        </div>
                        <button>Read more</button>
                    </div>
                </div>
                <div class="inner-part">
                    <label for="imgTap" class="img">
                        <img class="img-2" src="#" />
                    </label>
                    <div class="content content-2">
                        <div class="form-floating mb-4">
                            <input
                                type="password"
                                id="password"
                                placeholder="Confirm Password"
                                class="form-control form-control-lg" />
                            <label class="form-label" for="form1Example23">
                                Confirm Password</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input
                                type="password"
                                id="pass"
                                placeholder="Confirm Password"
                                class="form-control form-control-lg" />
                            <label class="form-label" for="form1Example23">
                                Confirm Password</label>
                        </div>
                        <div class="form-floating mb-4">
                            <input
                                type="password"
                                id="floatingInput"
                                placeholder="Confirm Password"
                                class="form-control form-control-lg" />
                            <label class="form-label" for="form1Example23">
                                Confirm Password</label>
                        </div>
                        <!-- Submit button -->
                        <div class="buttons">
                            <button
                                type="submit"
                                class="btn btn-lg btn-block"
                                style="background-color: #f2dd80; width: 50%;">
                                Sign up
                            </button>
                            <button>Read more</button>
                        </div>
                    </div>
                    <div class="inner-part">
                        <label for="imgTap" class="img">
                            <img class="img-3" src="#" />
                        </label>
                        <div class="content content-3">
                            <span>26 December 2019</span>
                            <div class="title">
                                Lorem Ipsum Dolor
                            </div>
                            <div class="text">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod excepturi nemo commodi sint eum ipsam odit atque aliquam officia impedit.
                            </div>
                            <button>Read more</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>










