<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="AutoCar.html.employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bootstrap/js/bootstrap.min.js" rel="stylesheet" />
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="../bootstrap/css/fontawesome.css" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="../css/login.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <section class="vh-100">
                <div class="container py-5 h-100">
                    <div class="row d-flex align-items-center justify-content-center h-100">
                        <div class="col-md-6 col-lg-6 col-xl-5 offset-xl-1">

                            <div>
                                <h1 class="fw-bold mb-4" style="color: #f2dd80">Add Emolyee</h1>
                            </div>
                            <!-- First Name input -->
                            <div class="form-outline" style="margin-bottom: 5px;">
                                <input
                                    type="text"
                                    id="form1Example1"
                                    name="firstname"
                                    placeholder="First Name"
                                    class="form-control form-control-lg"
                                    autocomplete="on"
                                    style="margin-top: 5px" />
                                <label class="form-label" for="form1Example13">
                                </label>
                            </div>
                            <!-- Last Name input -->
                            <div class="form-outline" style="margin-top: 5px">
                                <input
                                    type="text"
                                    id="form1Example12"
                                    name="lastname"
                                    autocomplete="on"
                                    placeholder="Last Name"
                                    class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example13"></label>
                            </div>
                            <!----- Birth of date ----->

                            <div class="input-group form-outline mb-3">
                                <span class="input-group-text" id="dof" aria-autocomplete="both" style="background-color: #f2dd80; font-size: 15px">Date Of Birth</span>
                                <input type="date" class="form-control jDatepicker" name="birthdate" style="vertical-align: central; font-size: 18px" placeholder="mm-dd-yyyy" />
                            </div>


                            <!--- Gender ---->

                            <div class="row mb-3">
                                <div class="col">
                                    <div class="form-outline">
                                        <span class="input-group-text" style="width: 100%; background-color: #f2dd80; font-size: 15px">Gender</span>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline">
                                        <input type="radio" class="btn-check" value="male" name="gender" id="option1" autocomplete="off" checked />
                                        <label class="btn" for="option1" style="color: #f2dd80">Male</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline">
                                        <input type="radio" value="female" class="btn-check" name="gender" id="option2" autocomplete="off" />
                                        <label class="btn" for="option2" style="color: #f2dd80">Female</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Email input -->
                            <div class="form-outline">
                                <input
                                    type="email"
                                    id="form1Example13"
                                    name="email"
                                    placeholder="Email"
                                    class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example13">
                                </label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline">
                                <input
                                    type="password"
                                    id="form1Example23"
                                    name="password"
                                    placeholder="password"
                                    class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example23"></label>
                            </div>

                            <!--depid and role id-->

                            <div class="row">
                                <div class="col">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 1.5rem;">
                                        <button type="button" class="btn btn-warning"
                                            style="background-color: #ffffff; width: 85%;">
                                            Department Name
                                        </button>
                                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                            style="background-color: #f2dd80; width: 15%;">
                                            <span class="visually-hidden">Toggle Dropdown</span>
                                        </button>

                                        <div class="dropdown-menu" aria-labelledby="myDropdown">

                                            <asp:DropDownList ID="dept" CssClass="form-control" AutoPostBack="True"
                                                OnSelectedIndexChanged="dept_change_selected"
                                                runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                                <div class="col">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 1.5rem;">
                                        <button type="button" class="btn btn-warning"
                                            style="background-color: #ffffff; width: 85%;">
                                            Role Name
                                        </button>
                                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                            style="background-color: #f2dd80; width: 15%;">
                                            <span class="visually-hidden">Toggle Dropdown</span>
                                        </button>

                                        <div class="dropdown-menu" aria-labelledby="myDropdown">
                                            <asp:DropDownList ID="role" CssClass="form-control" AutoPostBack="True"
                                                OnSelectedIndexChanged="role_change_selected" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--permission-->
                            <div class="row mb-3">
                                <div class="col">
                                    <div class="form-outline">
                                        <span class="input-group-text" style="width: 100%; background-color: #f2dd80; font-size: 15px">Permission</span>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline d-flex mt-1">

                                        <asp:CheckBox ID="Read" BorderColor="Yellow" CssClass="mx-1" runat="server" />
                                        <label class="form-check-label" style="color: #f2dd80; width: 100%" for="inlineCheckbox1">Read</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline d-flex mt-1">
                                        <asp:CheckBox ID="add" BorderColor="Yellow" CssClass="mx-1" runat="server" />

                                        <label class="form-check-label" style="color: #f2dd80; width: 100%" for="inlineCheckbox1">Add</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline d-flex mt-1">
                                        <asp:CheckBox ID="update" BorderColor="Yellow" CssClass="mx-1" runat="server" />

                                        <label class="form-check-label" style="color: #f2dd80; width: 100%" for="inlineCheckbox1">Update</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-outline d-flex mt-1">
                                        <asp:CheckBox ID="delete" BorderColor="Yellow" CssClass="mx-1" runat="server" />
                                        <label class="form-check-label" style="color: #f2dd80; width: 100%" for="inlineCheckbox1">Delete</label>
                                    </div>
                                </div>
                            </div>


                            <!-------Salary----->

                            <div class="form-outline">
                                <input
                                    type="text"
                                    id="form1Example20"
                                    name="salary"
                                    placeholder="Salary"
                                    class="form-control form-control-lg" />
                                <label class="form-label" for="form1Example13">
                                </label>
                            </div>

                            <!--shiftid and car id-->
                            <div class="row" runat="server" id="car_div">
                                <div class="col">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 1.5rem;">
                                        <button type="button" class="btn btn-warning"
                                            style="background-color: #ffffff; width: 85%;">
                                            Car Id
                                        </button>
                                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                            style="background-color: #f2dd80; width: 15%;">
                                            <span class="visually-hidden">Toggle Dropdown</span>
                                        </button>

                                        <div class="dropdown-menu" aria-labelledby="myDropdown">

                                            <asp:DropDownList ID="car" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>



                                <div class="col" runat="server" id="shift_div">
                                    <div class="btn-group" style="width: 100%; margin-bottom: 1.5rem;">
                                        <button type="button" class="btn btn-warning"
                                            style="background-color: #ffffff; width: 85%;">
                                            Shift
                                        </button>
                                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                            style="background-color: #f2dd80; width: 15%;">
                                            <span class="visually-hidden">Toggle Dropdown</span>
                                        </button>

                                        <div class="dropdown-menu" aria-labelledby="myDropdown">
                                            <asp:DropDownList ID="shift" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!--nn and company name-->
                            <div class="row mb-3">
                                <div class="col" runat="server" id="nn_div">
                                    <div class="form-outline">
                                        <input type="text" name="nationalnumber" id="form3Example1" class="form-control" placeholder="National Number" />
                                    </div>
                                </div>
                                <div class="col" runat="server" id="company_name_div">
                                    <div class="form-outline">
                                        <input type="text" id="form3Example2" name="companyname" class="form-control" placeholder="Company Name" />
                                    </div>
                                </div>
                            </div>

                            <asp:Button ID="register_btn" runat="server" UseSubmitBehavior="false" CssClass="btn btn-lg btn-block register_btn" OnClick="register_button_click" Style="width: 100%" Text="Register" />

                            <asp:Label ID="error" runat="server" CssClass="fs-3 text-danger"  Text=""></asp:Label>
                              <asp:Label ID="success" runat="server" CssClass="fs-3 text-white"  Text=""></asp:Label>
                        </div>
                        <div class="col-md-6 col-lg-6 col-xl-6">
                            <img src="../images/addemployee.svg" class="img-fluid" alt="Logo image" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>

</body>
</html>
