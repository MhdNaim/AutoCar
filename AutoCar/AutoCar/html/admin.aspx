﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="AutoCar.html.admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../css/hr.css" />
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
    <title>Admin</title>

    <script src="jquery-3.6.0.js"></script>
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
                    <div class="icon">
                        <a class="navbar-brand" href="#">
                            <span class="iconc"><i class="fas fa-bell fa-lg"></i></span>

                        </a>
                    </div>
                    <span class="icon" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation"><i class="fas fa-bars fa-lg"></i></span>
                    <div class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel" style="background-color: #062e33;">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" style="color: #f2dd80;" id="offcanvasDarkNavbarLabel">Admin</h5>
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
                                        <li><a class="link" href="./vehicle.aspx" id="tap2">Add vehicle <i class="far fa-eye"></i></a></li>

                                        <li>
                                            <hr class="" style="color: #f2dd80;" />
                                        </li>
                                        <li><a class="link" href="#" id="tap3">Show  Report <i class="far fa-eye"></i></a></li>
                                        <li>
                                            <hr class="" style="color: #f2dd80;" />
                                        </li>
                                        <li><a class="link" href="#" id="tap4">My Info <i class="fas fa-info-circle"></i></a></li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="d-flex mt-3" role="search">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                                <asp:Button UseSubmitBehavior="false" ID="Button1" runat="server" CssClass="searchb" Text="Search" />

                            </div>
                        </div>
                    </div>
                </div>
            </nav>


           


            <asp:GridView ID="myGridView" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="first_name" HeaderText="First Namr" />
                    <asp:BoundField DataField="last_name" HeaderText="Name" />
                    <asp:BoundField DataField="is_emp" HeaderText="Employee" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="UpdateRecord" CommandArgument='<%# Eval("users_id") %>' />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteRecord" CommandArgument='<%# Eval("users_id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <!--  
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

              -->


            <!-- Submit button -->
            <!---
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

                -->



        </div>
    </form>
</body>
</html>

