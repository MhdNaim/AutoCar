<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="AutoCar.html.order" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Calculate Distance Between Two Points</title>
    <meta name="viewport" content="initial-scale=1.0" />
    <meta charset="utf-8" />



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js" integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.min.js" integrity="sha384-Y4oOpwW3duJdCWv5ly8SCFYWqFDsfob/3GkgExXKV4idmbt98QcxXYs9UoXAB7BZ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../bootstrap/css/fontawesome.css" />
    <script async defer id="gm"></script>
    <script src="../jquery/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../css/order.css">
    <script src="../js/googlemaps.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"
        integrity="sha384-zYPOMqeu1DAVkHiLqWBUTcbYfZ8osu1Nd6Z89ify25QV9guujx43ITvfi12/QExE"
        crossorigin="anonymous"></script>
</head>

<body>
    <form id="form1" runat="server">
        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="col-md-6 col-lg-6 col-xl-5 offset-xl-1">

                        <div>
                            <h1 class="fw-bold mb-4" style="color: #f2dd80">Order </h1>
                        </div>

                        <!---- hint --------->
                        <ol class="list-group">
                            <li class="text-white">Select the Distination to calculate the distance</li>
                            <li class="text-white">After selecting the destination choose Confirm to Calculate the price</li>
                            <li class="text-white" runat="server" id="cost"></li>
                        </ol>



                        <!---------confirmation order card----------->

                        <div id="trip_details" class="card my-5" style="width: 25rem; background-color: #e9eed6">
                            <img src="../images/undraw_delivery_truck_vt6p-removebg-preview.png" class="card-img-top" alt="...">
                            <div class="card-body" style="background-color: #e9eed6">
                                <h5 class="card-title">Trip Details</h5>
                                <p class="card-text">
                                    <asp:Label ID="distination_name" CssClass="text-dark fs-3" runat="server" Text=""></asp:Label>

                                    <br />
                                    <asp:Label ID="distination_distince" CssClass="text-dark fs-3" runat="server" Text=""></asp:Label>

                                    <br />
                                    
                                    <asp:Label ID="price" CssClass="text-dark fs-3" runat="server" Text=""><span style='color: #f2dd80'>Cost : </span></asp:Label>

                                    <br />
                                </p>
                                <div class="d-flex justify-content-center text-center">

                                    <asp:Button UseSubmitBehavior="false" OnClick="confirm_order_click" CssClass=" btn btn-lg" BackColor="#f2dd80" runat="server" Text="Confirm Order" />

                                </div>
                            </div>
                        </div>



                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">


                                <div class="modal-content" style="background-color: #062e33">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Destionation</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        <span aria-hidden="true">&times;</span>

                                    </div>
                                    <div class="continer">
                                        <div class="modal-body">


                                            <div class="form-floating mb-4" style="margin-bottom: 5px;">
                                                <input
                                                    type="text"
                                                    id="myInput"
                                                    name=""
                                                    placeholder="First Name"
                                                    class="form-control form-control-lg"
                                                    style="margin-top: 5px" />
                                                <label class="form-label" for="form1Example13">
                                                    Search Place</label>
                                            </div>
                                            <div>
                                                <select class="form-control" id="places">
                                                    <option value="0" data-name="">NO RESULT!!</option>

                                                </select>
                                            </div>
                                            <div id="map"></div>
                                            <p id="msg"></p>




                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button id="confirm_destination" type="button" data-bs-dismiss="modal" class="btn" style="background-color: #f2dd80">Confirm</button>



                                    </div>
                                </div>


                            </div>
                        </div>

                        <!------- Select Place Button -------->
                        <button id="select_place" type="button" style="background-color: #f2dd80; margin-left: 0px; width: 50%; margin-top: 20px" class="btn btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Select Place
                        </button>
                        <label runat="server" id="error"></label>

                        <!-- <asp:Button ID="select_place" runat="server" CssClass="btn btn-lg" BackColor="#f2dd80" Text="Button" />-->

                        <br />
                        <br />
                        <asp:HiddenField ID="cust_lant" runat="server" />
                        <asp:HiddenField ID="cust_lang" runat="server" />
                        <asp:HiddenField ID="dest_lant" runat="server" />
                        <asp:HiddenField ID="dest_lang" runat="server" />
                        <asp:HiddenField ID="distance" runat="server" />
                        <asp:HiddenField ID="destination" runat="server" />
                        <asp:HiddenField ID="total_price" runat="server" />






                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
                        <label id="message"></label>




                    </div>
                    <!----------right svg----------->
                    <div class="col-md-6 col-lg-6 col-xl-4 s-d-none">
                        <img src="../images/Anticipatory_Design__How_to_Create_Magical_User_Experiences___Toptal_-removebg-preview.png" class="img-fluid" alt="Logo image" />
                    </div>

                </div>
            </div>
        </section>
    </form>
    <script>
        var confirm_dis = document.getElementById("confirm_destination");
        var trip_details = document.getElementById('trip_details');
        trip_details.style.display = 'none';
        confirm_dis.addEventListener("click", function () {
            trip_details.style.display = 'block';

            document.getElementById('<%= distination_name.ClientID %>').innerHTML = "<span style='color: #f2dd80'>Distination : </span>" + distination_name + " ";
            document.getElementById('<%= distination_distince.ClientID %>').innerHTML = "<span style='color:#f2dd80' >Distance : </span>" + distince_km + " KM ";

            var cost_per_km = document.getElementById("cost");
            document.getElementById('<%= cust_lant.ClientID %>').value = c_lant;
            document.getElementById('<%= cust_lang.ClientID %>').value = c_lang;
            document.getElementById('<%= dest_lant.ClientID %>').value = d_lant;
            document.getElementById('<%= dest_lang.ClientID %>').value = d_lang;
            document.getElementById('<%= distance.ClientID %>').value = distince_km;
            document.getElementById('<%= destination.ClientID %>').value = distination_name;
            var total_cost = parseFloat(distince_km) * parseFloat(cost_per_km);
            document.getElementById('<%= total_price.ClientID %>').value = total_cost.toString();

            //document.getElementById('<%= price.ClientID %>').innerHTML = "<span style='color:#f2dd80' > Cost : </span>" + total_cost.toString() + " SYP ";
        });

    </script>

</body>


</html>
