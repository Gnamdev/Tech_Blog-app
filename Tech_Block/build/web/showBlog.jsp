

<%@page import="entities.User" %>
<%@page import="Helper.ConnectionProvider" %>
<%@page import="dao.*" %>
<%@page import="entities.Post" %>
<%@page import="entities.Message"%>
<%@page import="entities.Categories"%>
<%@page import="java.util.*"%>
<%--<%@page import="dao.UserDao"%>--%>

<%@page  errorPage="error_page.jsp" %>

<%
try {
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("login_page.jsp");
    } else {
%>
<%
    
 int id = Integer.parseInt(request.getParameter("post_id"));
 PostDao d = new PostDao(ConnectionProvider.getConnection());
      
 Post p = d.getPostByPostId(id);
        
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || TechBlog by goutam Namdev..</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <script src="CSS/jquery.js" type="text/javascript"></script>


        <style>
            .banner-bcg{
                clip-path: polygon(50% 0%, 82% 0, 100% 0, 100% 100%, 80% 90%, 50% 100%, 20% 90%, 0 99%, 0 0, 21% 0);
            }

            .post-title{
                font-weight: 200;
                font-size: 30px;
            }

            .post-content{

                font-weight: 150;
                font-size: 23px;
            }
            .post-code{
                font-weight: 100;
                font-size: 18px;
                padding-left: 14px;
                border: 1px solid black;
                border-color: activecaption;
                border-radius: 5px;


            }
            .code{
                font-family: sans-serif;
                color: black;
                padding-bottom: 5px;

            }
            .c-body{

                background:#e5eaf5;
            }

            body{

                background: url('img/bcg.jpeg');
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

        <!--facebook comment plugging-->

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="3RCtRchT"></script>

</head>
<body>

    <!--nav-bar-->

    <nav class="navbar navbar-expand-lg primary-bcg ">



        <div class="container-fluid ">
            <a class="navbar-brand text-white nav-effect" href="index.jsp"> <span class="	fa fa-bug"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse  " id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active text-white nav-effect" aria-current="page" href="#"><span class="	fa fa-home"></span> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white nav-effect" href="#"> <span class="	fa fa-address-card"></span> Contact</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Categories
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Programming</a></li>
                            <li><a class="dropdown-item" href="#">Data Structure</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">java programming</a></li>
                        </ul>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link text-white nav-effect" href="#" data-bs-toggle="modal" data-bs-target="#post-modal"> <span class="	fa fa-plus-circle"></span> Post</a>
                    </li>


                </ul>



                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#"  data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"> <%= user.getName() %> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white nav-effect" href="logout_page"><span class="fa fa-sign-out"></span> Logout</a>
                    </li>

                </ul>

            </div>



        </div>
    </nav>

    <!--main content of body-->

    <main> 

        <div class="container">
            <div class="row my-4">
                <div class="col-md-5 offset-md-4">
                    <div class="card  ">

                        <div class="card-header primary-bcg text-white">
                            <h3 class="post-title"><%= p.getpTitle() %></h3>
                        </div>

                        <div class="card-body  c-body">
                            <img src="Blog_pics/<%= p.getpPic() %>" class="card-img-top my-2" alt="Not found img" >

                            <% 
                              UserDao ud  = new UserDao(ConnectionProvider.getConnection());
                            %>
                            <div class="row">
                                <div class="col-md">
                                    <p> <a href="#" style="text-decoration: none; color: blue; font-weight: 300; font-family: cursive;"><%= ud.getUserDetailsByUserId(p.getClientId()).getName()%> </a>  has posted:</p>
                                </div>
                            </div>

                            <p class="post-content">
                                <b>  <%= p.getpContent()%> </b>

                            </p>
                            <br>


                            <div class="post-code">
                                <label class="code">Code : </label>
                                <pre> <%= p.getpCode()%> </pre>

                            </div>

                        </div>

                        <%
                                likeDao ld = new likeDao(ConnectionProvider.getConnection());
                        %>
                        <div class="card-footer primary-bcg">
                            <a href="#" onclick="doLike(<%= p.getpId()%>,<%= user.getId()%>)" class="btn btn-outline-dark btn-sm m-3"> <i class="fa fa-thumbs-o-up"></i><span> <%= ld.countLikePost(p.getpId())%>   </span></a>


                            <a href="#" class="btn btn-outline-dark btn-sm "> <i class="fa fa-commenting-o"></i><span>120</span></a>


                        </div>

                        <div class="">
                            
                            <div class="fb-comments" data-href="http://localhost:8086/Tech_Block/showBlog.jsp?post_id=<%= p.getpId()%>" data-width="" data-numposts="5"></div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </main>
    <!--end of main content-->


    <!--profile Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center primary-bcg text-white">
                    <h1 class="modal-title fs-5 " id="exampleModalLabel">TechBlog</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">


                    <div class="text-center">




                        <img src="pics/<%= user.getProfile()%> " class="img-fluid image" style=" border-radius: 50%;" > </img>
                        <h5><%= user.getName() %></h5>

                        <!--datails-->

                        <div id="profile-details">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row"> ID: </th>
                                        <td><%= user.getId() %></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email: </th>
                                        <td><%= user.getEmail() %></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender :</th>
                                        <td colspan="2"><%= user.getGender() %></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered Date :</th>
                                        <td colspan="2"><%= user.getDateTime().toString() %></td>

                                    </tr>
                                </tbody>
                            </table>


                        </div>

                        <!--profile-edit pandding kam hai facing some problem here so stop the work here--> 

                        <div id="profile-edit" style="display: none;">

                            <h3>Please Edit Carefully..</h3>

                            <form action="edit" method="post" enctype="multipart/form-data" > 
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID: </th>
                                            <td><%= user.getId() %></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Password: </th>
                                            <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Gender: </th>
                                            <td><%= user.getGender() %></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> New Profile photo: </th>
                                            <td><input type="file" class="form-control" name="user_image" value="<%= user.getProfile() %>"></td>

                                        </tr>



                                    </tbody>
                                </table>

                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>

                            </form>
                        </div>               





                    </div>





                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button  id="edit-button" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--post model-->


    <div class="modal fade" id="post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header  primary-bcg text-white">
                    <h1 class="modal-title fs-5 " id="exampleModalLabel">Create Post</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">

                    <form id="add-post-form"action="postServlet" method="post">


                        <div class="form-group mb-3">
                            <select name="cid" class="form-select" aria-label="Default select example">



                                <option selected disabled>---Select Category---</option>

                                <%
                               PostDao ps = new PostDao(ConnectionProvider.getConnection());
                                    
 
                               ArrayList<Categories> list = ps.getAllCategory();
                               for(Categories c: list){
                               int i =0;
                                %>  

                                <option value="<%= c.getcId()%>"> <%= c.getcName()%> </option>


                                <%
                                  }

                                %>
                            </select>

                        </div>
                        <div class="form-grou mb-3"><!-- comment -->
                            <input name="title" type="text" placeholder="Enter post Title" class="form-control" /><!-- comment -->
                        </div>

                        <div class="form-group  mb-3">
                            <div class="form-floating">
                                <textarea name="content" class="form-control" placeholder="write your content ." id="floatingTextarea2" style="height: 250px"></textarea>
                                <label for="floatingTextarea2">Content</label>
                            </div>

                        </div>

                        <div class="form-group mb-3">
                            <div class="form-floating">
                                <textarea name="code" class="form-control" placeholder="write your program ." id="floatingTextarea2" style="height: 250px"></textarea>
                                <label for="floatingTextarea2">write-Program</label>
                            </div>

                        </div>



                        <div class="form-group mb-3">

                            <div class="mb-3">
                                <label for="formFile" class="form-label">Select your pics</label>
                                <input name="pics" class="form-control" type="file" id="formFile">
                            </div>


                        </div>

                        <div class="container text-center">
                            <button type="submit" class=" btn btn-outline-primary">Post</button>
                        </div>

                    </form>



                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save</button>
                </div>
            </div>
        </div>
    </div>

    <!--end of post modal-->






    <!--jquery-->
    <script>

        $(document).ready(function () {

            let status = false;
            $("#edit-button").click(function () {

                if (status == false) {

                    $("#profile-details").hide();

                    $("#profile-edit").show();
                    $(this).text("Back");
                    status = true;
                } else {
                    $("#profile-details").show();

                    $("#profile-edit").hide();
                    $(this).text("Edit");
                }


            })

        });


    </script>



    <!--write post js-->

    <script>
        $(document).ready(function () {

            $("#add-post-form").on('submit', function (event) {
                event.preventDefault();

                console.log("your have clicked on submit");
                let form = new FormData(this);
                //           now requesting to server

                $.ajax({
                    url: "postServlet",
                    type: 'post',
                    data: form,

                    success: function (data, textStatus, jqXHR) {
                        //success
                        console.log(data);
                        if (data.trim() === 'done') {

                            swal("Good job ??", "Post successfully..", "success");
                        } else {
                            swal("Error ? ", "Something went wrong.. please try again later", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        //error
                        swal("Error ! ", "Something went wrong.. please try again later", "error");
                    },
                    processData: false,
                    contentType: false


                })

            });
        }
        );

    </script>

    <!--end-of write post-->

    <!--loading pages--> 


    <script>

        function getPost(catId, temp) {
            $("#load").show();
            $("#post-container").hide();

            $(".c-link").removeClass('active');




            $.ajax({
                url: "loadPost.jsp",
                data: {cid: catId},

                success: function (data) {
                    console.log("Success", data);

                    $("#load").hide();
                    $("#post-container").show();
                    $("#post-container").html(data);
                    $(temp).addClass('active');
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("Error", textStatus, errorThrown);
                }
            });
        }

        $(document).ready(function (event) {

            let allPostRef = $('.c-link')[0]
            getPost(0, allPostRef);



            // Additional code outside of the $.ajax() call
        });



    </script>







    <!--ending loading pages-->








    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>






    <<script src="JS/myjs.js"></script>



</body>
</html>
<%
    }
} catch (Exception e) {
    // Log or print the stack trace to debug the issue
    e.printStackTrace();
    // Redirect to an error page or handle the exception appropriately
    response.sendRedirect("error_page.jsp");
}
%>
