
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Message" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-bcg{
                clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 99%, 0 0, 21% 0);
            }

        </style>

    </head>
    <body>

        <!--nav-bar-->
        <%@include file="navbar.jsp" %>

        <!--login-page-->

        <main class="d-flex align-item-center primary-bcg banner-bcg  pt-5" style="height: 80vh">

            <div class="container-fluid ">
                <div class="contianer">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">
                            <div class="card ">



                                <div class="card-header primary-bcg text-white text-center">

                                    <span class="fa fa-user-plus fa-3x "></span>
                                    <h3> Login </h3>


                                </div>

                                <%  
                               Message m =(Message) session.getAttribute("mgs");
                               if(m != null){
                              
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%= m.getContent() %>
                                </div>
                                <%
                                    session.removeAttribute("mgs");
                              
                                      }

                                %> 

<!--                                <div class="alert alert-danger d-flex align-items-center" role="alert">
                                    <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                                    <div>
                                        An example danger alert with an icon
                                    </div>
                                </div>-->







                                <div class="card-body">
                                    <form action="login_page" method="post">
                                        <div class="mb-3">
                                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                                            <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="exampleInputPassword1" class="form-label" >Password</label>
                                            <input name="password" required type="password" class="form-control" id="exampleInputPassword1"  placeholder="Enter Password">
                                        </div>
                                        <div class="mb-3 form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div >

                                        <div class=" container text-center">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>

                                    </form>

                                </div>



                            </div>


                        </div>
                    </div>

                </div>
            </div>




        </main>








        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="JS/myjs.js" type="text/javascript"></script>

    </body>
</html>
