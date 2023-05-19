<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error404.aspx.cs" Inherits="AutoCar.html.error404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" />
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
    <title></title>
</head>
<body style="background-color: #093c42;">
    <form id="form1" runat="server">
        <div class="d-flex align-items-center justify-content-center vh-100">
            <div class="text-center">
                <h1 class="display-1 fw-bold" style="color:#fdc500">404</h1>
                <p class="fs-3" style="color:#fdc500"><span>Opps!</span> Page not found.</p>
                <p class="lead"  style="color:#fdc500">
                    The page you’re looking for doesn’t exist.
                </p>
                <a href="home.aspx" class="btn" style="background-color: #fdc500; margin-left: 1px; width: 50%">Go Home</a>
            </div>
            <img src="../images/crash-car.png" class="img-fluid" style="width: 1000px" />
        </div>
    </form>
</body>
</html>
