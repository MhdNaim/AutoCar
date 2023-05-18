<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driver.aspx.cs" Inherits="AutoCar.html.driver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="../css/login.css" rel="stylesheet" />
    <link href="../css/index.css" rel="stylesheet" />
    <title>Driver</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <style>
        .panel-flex {
            display: flex;
            flex-wrap: wrap;
            justify-content: left;
            
        }

        .panel-flex-item {
            flex: 0 0 calc((100% / 3) - 20px); /* subtracting 20px for margin */
            margin-bottom: 20px;
            margin-right:20px;
        }

        .panel-flex-one-item {
            flex: 0 0 calc((100%) - 20px); /* subtracting 20px for margin */
            margin-bottom: 20px;
        }

        @media (max-width: 767px) {
            .panel-flex-item {
                flex: 0 0 100%;
            }
        }

        #Brand:hover {
            color: #f2dd80;
        }
    </style>
</head>
<body style="background-color: #edf1da">
    <form id="form1" runat="server">
        <div id="parent_div">





            <!------------------------------------Nav bar---------------------------->


            <nav class="navbar navbar-expand-lg" style="background-color: #062f33">
                <a class="navbar-brand" id="Brand" href="#" style="">Driver</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-bell"></i>
                                <span class="badge badge-pill badge-danger" runat="server" id="orders_num"></span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Actions
                            </a>
                            <div class="dropdown-menu bg-white-50" aria-labelledby="navbarDropdownMenuLink">

                                <asp:Button ID="Button1" runat="server" CssClass=" dropdown-item btn btn-group-sm" Text="MyProfile" />


                                <asp:Button ID="logout_button" runat="server" CssClass="dropdown-item btn btn-group-sm" Text="Logout" OnClick="logout_button_click" />

                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!---------------------------------Orders DIV------------------------------------->
            <div class="container">
                <div class="panel-flex">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <ItemTemplate>
                            <div class="panel-flex-item">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #f6f8ea">New Order</div>
                                    <div class="panel-body" style="background-color: #062f33">


                                        <ol class="list-group">
                                            <li class="list-group-item"><strong>Destnation :</strong> <%# Eval("Item1") %><br />
                                            </li>
                                            <li class="list-group-item"><strong>Distance :</strong>  <%# Eval("Item2") %> KM<br />
                                            </li>
                                            <li class="list-group-item"><strong>Cost :</strong> <%# Eval("Item3") %> SYP<br />
                                            </li>
                                        </ol>
                                        <div class="d-flex justify-content-center text-center">

                                            <asp:Button runat="server" Text="Take Order" CommandArgument='<%# Eval("Item4") %>' CssClass="btn btn-lg btn-block" BackColor="#f2dd80" OnClick="take_order_click" />

                                        </div>
                                    </div>


                                    <div class="panel-heading" style="background-color: #f6f8ea"><%# Eval("Item5") %> Days and <%# Eval("Item6") %> hour and <%# Eval("Item7") %> minutes</div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>


            <!---------------------The Processing order card ------------------------->

            <div class="container" runat="server" id="trip_div">
                <div class="panel-flex">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="panel-flex-one-item">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #f6f8ea">New Order</div>
                                    <div class="panel-body" style="background-color: #062f33">


                                        <ol class="list-group">
                                            <li class="list-group-item"><strong>Destnation  :</strong> <%# Eval("Item1") %><br />
                                            </li>
                                            <li class="list-group-item"><strong>Distance : </strong>  <%# Eval("Item2") %> KM<br />
                                            </li>
                                            <li class="list-group-item"><strong>Cost : </strong> <%# Eval("Item3") %> SYP<br />
                                            </li>
                                            <li class="list-group-item"><strong>Customer Name : </strong> <%# Eval("Item4") %>  <%# Eval("Item5") %><br />
                                            </li>
                                            <li class="list-group-item"><strong>Phone Number : </strong><%# Eval("Item6") %><br />
                                            </li>
                                        </ol>
                                        <div class="d-flex justify-content-center text-center">

                                            <asp:Button ID="start_trip" UseSubmitBehavior="false" runat="server" Text="Start Trip" CommandArgument='<%# Eval("Item7") %>' CssClass="btn btn-lg btn-block" BackColor="#f2dd80" OnClick="start_order_click" />

                                        </div>
                                    </div>


                                    <div class="panel-heading" style="background-color: #f6f8ea">On the Road ...</div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!---------------------The done trip card ------------------------->
            
            <div class="container" runat="server" id="done_div">
                <div class="panel-flex">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <div class="panel-flex-one-item">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #f6f8ea">New Order</div>
                                    <div class="panel-body" style="background-color: #062f33">


                                        <ol class="list-group">
                                            <li class="list-group-item"><strong>Destnation : </strong> <%# Eval("Item1") %><br />
                                            </li>
                                            <li class="list-group-item"><strong>Distance : </strong>  <%# Eval("Item2") %> KM<br />
                                            </li>
                                            <li class="list-group-item"><strong>Cost : </strong> <%# Eval("Item3") %> SYP<br />
                                            </li>
                                            <li class="list-group-item"><strong>Customer Name : </strong> <%# Eval("Item4") %><br />
                                            </li>
                                            <li class="list-group-item"><strong>Phone Number : </strong><%# Eval("Item5") %><br />
                                            </li>
                                        </ol>
                                        <div class="d-flex justify-content-center text-center">


                                            <asp:Button ID="done_trip" runat="server" Text="Done" CommandArgument='<%# Eval("Item7") %>' CssClass="btn btn-lg btn-block" BackColor="#f2dd80" OnClick="done_order_click" />

                                        </div>
                                    </div>


                                    <div class="panel-heading" style="background-color: #f6f8ea">Delivery Is Underway The Order Was Start :<%# Eval("Item6") %></div>
                                </div>
                            </div>

                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

          


           


            <label id="ord" runat="server"></label>

        </div>
    </form>

</body>
</html>
