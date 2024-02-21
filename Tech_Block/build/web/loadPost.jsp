


<%@page import="dao.PostDao" %>
<%@page import="entities.Post" %>
<%@page import="Helper.ConnectionProvider" %>
<%@page import="java.util.*" %>

<div class="row">


    <%
       // Thread.sleep(1000);
        
     PostDao d = new PostDao(ConnectionProvider.getConnection());
 
     
     int cid = Integer.parseInt(request.getParameter("cid"));
      List<Post> p = null;
     
      if(cid == 0){
         p = d.getAllPost();
 
        }else{
         p = d.getAllPost(cid);
        }
        
        if(p.size() == 0){
        out.println("<h3 class='display-3 text-center '>No post in this category..</h3>");
        return;
        }
     
    for(Post cc:p){
    
    %>


    <!--post boostrap-->
   
   
     
        <div class="col-md-4 mt-3 ">
            <div class="card effect" style="width: 18rem;">
                <img src="Blog_pics/<%= cc.getpPic() %>" class="card-img-top" alt="Not found img" >
                <div class="card-body">
                    <h5 class="card-title">  <%= cc.getpTitle()%> </h5>
                    <p class="card-text">    <%= cc.getpContent()%> </p>


                </div>

                <div class="card-footer text-center primary-bcg">
                    <a href="#" class="btn btn-outline-dark btn-sm "> <i class="fa fa-thumbs-o-up"></i><span>100</span></a>
                    <a href="showBlog.jsp?post_id=<%= cc.getpId()%>" class="btn btn-outline-dark btn-sm "> Read More..</a>

                    <a href="#" class="btn btn-outline-dark btn-sm "> <i class="fa fa-commenting-o"></i><span>120</span></a>
                </div>
            </div>
                    
                    
                    
        </div>





        <%
            }
        %>

    </div>