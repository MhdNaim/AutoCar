<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spareParts.aspx.cs" Inherits="AutoCar.html.spareParts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="bootstrap/css/fontawesome.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
        crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/spareparts.css" />
    <title></title>
</head>
<body>
   <section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100">
            <div class="col-md-6 col-lg-6 col-xl-5 offset-xl-1">
                <form>
                    <div>
                        <h1 class="fw-bold mb-4" style="color: #f2dd80">Order Sparepart</h1>
                    </div>
                    <!-- VehicleID -->
                    <div class="form-floating mb-4">
                        <input type="text"
                               id="vid"
                               name="vid"
                               placeholder="VehicleID"
                               class="form-control form-control-lg" />
                        <label class="form-label" for="form1Example13">VehicleID</label>
                    </div>
                    <!-- Vendor -->
                    <div class="btn-group" style="width:100%; margin-bottom: 1.5rem;">
                        <button type="button" class="btn btn-warning"
                                style="background-color: #ffffff;
                                    width: 85%;">
                            Vendor
                        </button>
                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                style="
                                    background-color: #f2dd80;
                                    width: 15%; ">
                            <span class="visually-hidden">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu" style="background-color: #f2dd80; padding-left:10px;">
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label class="form-check-label">
                                            A
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label class="form-check-label">
                                            B
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label class="form-check-label">
                                            C
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label class="form-check-label">
                                            D
                                        </label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- Sparepart-->
                    <div class="btn-group" style="width:100%; margin-bottom: 1.5rem;">
                        <button type="button" class="btn btn-warning"
                                style="
                                    background-color: #ffffff;
                                    width: 85%; ">
                            SparePart
                        </button>
                        <button type="button" class="btn btn-warning dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false"
                                style="
                                    background-color: #f2dd80;
                                    width: 15%; ">
                            <span class="visually-hidden">Toggle Dropdown</span>
                        </button>
                        <ul class="dropdown-menu" style="background-color: #f2dd80; padding-left:10px;">
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label>
                                            A
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label>
                                            B
                                        </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                            <label>
                                                C
                                            </label>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="col-12">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox"/>
                                        <label class="form-check-label">
                                            D
                                        </label>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <!-- Quantity -->
                    <div class="form-floating mb-4">
                        <input type="text"
                               id="form1Example13"
                               placeholder="Quantity"
                               class="form-control form-control-lg" />
                        <label class="form-label" for="form1Example13">Quantity</label>
                    </div>
                    <!-- Price -->
                    <div class="form-floating mb-4">
                        <input type="text"
                               id="price"
                               name="price"
                               placeholder="Price"
                               class="form-control form-control-lg" />
                        <label class="form-label" for="form1Example23">Price</label>
                    </div>
                    <!-- Total Price -->
                    <div class="form-floating mb-4">
                        <input type="text"
                               id="floatingInput"
                               placeholder="Total Price"
                               class="form-control form-control-lg" />
                        <label class="form-label" for="form1Example23">TotalPrice</label>
                    </div>
                    <!-- SparePart -->
                    <div class="buttons">
                        
                        <button type="submit"
                                class="btn btn-lg btn-block"
                                style="
                  background-color: #f2dd80;
                  width: 50%;
                ">
                            Select
                        </button>
                        <button type="submit"
                                class="btn btn-lg btn-block"
                                style="background-color: #f2dd80;
                  margin-left: 20px;
                  width: 50%">
                            Clear
                            </button>
                    </div>
                </form>
            </div>
            <div class="col-md-6 col-lg-6 col-xl-6" style="margin-top: 70px">
                <img src="../images/sparePart.jpg" class="img-fluid" alt="Phone image" />
            </div>
        </div>
    </div>
</section>
</body>
</html>