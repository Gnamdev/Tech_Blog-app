
<%@page  import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Block</title>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-bcg{
                clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 99%, 0 0, 21% 0);
            }
            body{
                background: url('img/bcg2.jpeg');
                background-attachment: fixed;
                background-size: cover;
            }

            /*section*/



           

        

        </style>



    </head>
    <body  ">
        <%@include file="navbar.jsp" %>

        <!--banner-section-->

        <div class="container-fluid p-0 m-0 ">

            <div class="junbotron primary-bcg text-white banner-bcg  " >
                <div class="container pt-5 ">
                    <h2 class="display-3">Welcome to Our Tech Universe</h2>
                    <p>Welcome to Technical Block, where the realms of technology converge to create a dynamic universe of innovation and knowledge. Our mission is to unravel the complexities of the tech world and present them to you in an accessible and engaging manner. From cutting-edge advancements to beginner-friendly guides, we are your go-to destination for all things tech-related.</p>

                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg mb-5"><span class="	fa fa-external-link"></span> Start ! its free</a>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg mb-5"><span class="	fa fa-user-circle-o fa-spin"></span> Login </a>
                </div>

            </div>
        </div>



        <!--card-section-->

        <div class="container-fluid pt-5 " >


            <div class="container ">
                <div class="row mb-5">

                    <div class="col-md-4   ">
                        <div class="card effect" style="width: 18rem;">
                            <img src="img/java.jpeg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Java Programming</h5>
                                <p class="card-text">Java 17 was released as a long-term support version, bringing improvements in performance, security, and language enhancements, focusing on developer productivity and efficiency.</p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4  ">
                        <div class="card effect" style="width: 18rem;">
                            <img src="img/ai.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Machine Learning</h5>
                                <p class="card-text">Artificial Intelligence and Machine Learning continued to advance rapidly. There was a surge in interest and development in natural language processing (NLP), reinforcement learning, and computer vision applications</p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card effect" style="width: 18rem;">
                            <img src="img/blockchain.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Block Chain</h5>
                                <p class="card-text">Blockchain technology expanded beyond cryptocurrencies, finding applications in supply chain management, decentralized finance (DeFi), and digital identity verification. s</p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">

                        <div class="card effect" style="width: 18rem;">
                            <img src="img/pyth.jpeg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Python Programming</h5>
                                <p class="card-text"> Python continued to be one of the most popular programming languages, known for its simplicity, readability, and versatility. Python 3.10 was released with new features like pattern matching, security improvements, and performance enhancements.</p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 ">
                        <div class="card effect" style="width: 18rem;">
                            <img src="img/php.jpeg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Php Programming</h5>
                                <p class="card-text">PHP 8.1 was released, introducing features like fibers for lightweight cooperative multitasking, enumerations, and enhancements in performance and error handling.offering new features like extended support. </p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ">
                        <div class="card effect" style="width: 18rem;">
                            <img src="img/js.png" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title text-center">Java script</h5>
                                <p class="card-text">JavaScript remained essential for web development. The latest version at that time was ECMAScript 2021, offering new features like extended support for promises, logical assignment operators, and more.</p>
                                <div class="text-center">
                                    <a href="login_page.jsp" class="btn btn-primary " >Read More</a>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

        </div>

        <!--footer-section-->

<!--
        <footer>
            <div class="footer">
                <div class="row">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-instagram"></i></a>
                    <a href="#"><i class="fa fa-youtube"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                </div>

                <div class="row">
                    <ul>
                        <li><a href="#">Contact us</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Career</a></li>
                    </ul>
                </div>

                <div class="row">
                    INFERNO Copyright © 2021 Inferno - All rights reserved || Designed By: Mahesh 
                </div>
            </div>
        </footer>-->


        <!--end of footer-->


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="JS/myjs.js" type="text/javascript"></script>

    </body>
</html>
