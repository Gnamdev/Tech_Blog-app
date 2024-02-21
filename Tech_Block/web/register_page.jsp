
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <script src="CSS/jquery.js" type="text/javascript"></script>





        <style>
            .banner-bcg{
                clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 99%, 0 0, 21% 0);
            }

        </style>
    </head>
    <body>

        <!--nav-bar-->
        <%@include file="navbar.jsp" %>

        <!--register-section-->

        <main class="d-flex align-item-center primary-bcg banner-bcg  pt-5 " style=" padding-bottom:50px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4 offset-md-4">

                        <div class="card">
                            <div class="card-header text-center primary-bcg">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <h3> Register </h3>

                            </div>
                            <div class="card-body">

                                <form action="register" method="post" id="form">

                                    <div class="mb-3">
                                        <label   for="user" class="form-label">User Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">


                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  placeholder="Enter Email">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1"  placeholder="Enter password">
                                    </div>


                                    <div class="mb-3">
                                        <label  for="gender" class="form-label">Select Gender</label>
                                        <br>

                                        <input type="radio"  id="gender" name="gender" value="male"> Male
                                        <input type="radio"  id="gender" name="gender" value="female" > Female
                                    </div>





                                    <div class="mb-3 form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions </label>
                                    </div>

                                    <div id="loader" style="display: none;" >
                                        <span class="  fa fa-refresh fa-spin fa-3x" > </span>
                                        <p> please waite..</p>
                                    </div>
                                    <div class="text-center m-2 " id="submit-btn">      <button type="submit"  class="btn btn-primary  "> Submit </button>      </div>

                                </form>



                            </div>

                        </div>                        




                    </div>
                </div>
            </div>
        </main>


        <script>
            $(document).ready(function () {


                $("#form").on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    //              send data into db

                    $("#submit-btn").hide();
                    $("#loader").show();

                    $.ajax({
                        url: "register",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            

                            $("#submit-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done') {
                                swal("Registered Successfully..🙂 ")
                                        .then((value) => {
                                            window.location="login_page.jsp"
                                        });
                            } else {

                                swal(data);


                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Somthing went wrong..please try agian🥲");
                            
                        },
                        processData: false,
                        contentType: false
                    });
                });

            });
        </script>





        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <script src="JS/myjs.js" type="text/javascript"></script>


    </body>
</html>
