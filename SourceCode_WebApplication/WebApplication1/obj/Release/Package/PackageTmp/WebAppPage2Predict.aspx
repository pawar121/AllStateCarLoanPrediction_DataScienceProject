<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAppPage2Predict.aspx.cs" Inherits="WebApplication1.WebAppPage2Predict" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

   <style type="text/css">

       body{
           background:url("http://www.hdwallwide.com/wp-content/uploads/2014/11/car-insurance-02-hd-wallpaper-hdwallwide.com_.jpg");
           background-repeat:no-repeat;
           background-size:100%;
        }         

      form input{
          margin-bottom:30px;
      }   
      
   
      #sub{
            margin-bottom:100px;
      }

      #SatisfiedFlagNo{
          margin-left:150px;
      }

      #formdiv{
          margin-left:500px;
          margin-right:300px;
          margin-bottom:200px;
           color:black;
           font-weight:bold;
           font-size:larger;
           top: -15px;
           left: -203px;
           height: 390px;
           width: 850px;
           margin-top: 2px;
       }

      #married, #homeowner{
          float:right;
      }
      
       .auto-style1 {
           font-size: xx-large;
       }
      
   </style>

     <script runat="server">

        /* void Page_Load(Object sender, EventArgs e)
         {
             
             
         }
         */
         void Response_Click(Object sender, EventArgs e)
         {
             Button clickedButton = (Button)sender;
             Response.Redirect("WebAppPage3Customize.aspx");
             clickedButton.Enabled = false;
         }
     </script>

     <script src="Scripts/jquery-3.1.1.js"></script>
     <script src="Scripts/bootstrap.js"></script>
     <script src="Scripts/bootstrap.min.js"></script>
     <script src="Scripts/jquery.backstretch.js"></script>
     <script src="Scripts/jquery-3.1.1.min.js"></script>

  <script type ="text/javascript">
      $(document).ready(function () {

});
   </script>

     <link href="Content/bootstrap.css" rel="stylesheet" />
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link href="Content/Site.css" rel="stylesheet" />
     <link href="Content/font-awesome.css" rel="stylesheet" type="text/css" />
     <link href="Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   </head>

 <body>
   

    <form id="form1" runat="server">
    <div class="container">


         <img src="https://media.glassdoor.com/sqll/2341/allstate-squarelogo.png" alt="Sample Image" style="height: 113px; width: 128px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; YOUR SUGGESTED PLAN </span> </strong></h1>
        <div class="col-lg-12 col-md-6 " id="formdiv">
            <div class="registrationform">
                <div class="form-horizontal">
                     <div class ="col-lg-8" id="ProposedPlan">  
                       
                     
                            <h3> &nbsp;</h3> 
                            <asp:label ID ="PredictionResut1" runat="server" Width="250px"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         <asp:label ID ="Confidence1"  runat="server" ></asp:label>
                           <br />
                            <asp:label ID ="PredictionResut2"  runat="server" Width="250px" ></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         <asp:label ID ="Confidence2"  runat="server" ></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut3"  runat="server" Width="250px"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                         <asp:label ID ="Confidence3"  runat="server" ></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut4"  runat="server" Width="250px" ></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                          <asp:label ID ="Confidence4"  runat="server" ></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut5"  runat="server" Width="250px" ></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:label ID ="Confidence5"  runat="server" ></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut6"  runat="server" Width="250px" ></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:label ID ="Confidence6"  runat="server" ></asp:label>
                            <br />
                            <asp:label ID ="PredictionResut7"  runat="server" width="250px"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:label ID ="Confidence7"  runat="server" ></asp:label>
                         <br />
                            </div>
                                                
                         </div>

 


                   <div class ="col-lg-8" id="ProposedPrice">   
                    <h3> <strong>Total Price for your plan:<asp:label ID ="TotalPriceLabel"  runat="server" ></asp:label></strong></h3>
                       
                     
                    </div>
                    <br /> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class ="col-lg-12" id="Selectbutton">   
                            &nbsp;<div class ="col-lg-12" id="Selectbutton1">   
                        </div>
                     
                       
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     
                       
                       <asp:label Text ="t1"  runat="server">  Click here to Change your plan options!</asp:label>
                          
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                              
                    &nbsp;<asp:Button ID="SatisfiedFlagNo" runat="server" CssClass="btn btn-warning col-lg-6" Text="Not Satisfied?" Width="300px" OnClick="Response_Click"/>                              
                    </div> 
            </div>
        </div>
            </div>
    </div>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.backstretch.js"></script>
    <script type="text/javascript">
        'use strict';

    
    </script>
    </form>

</body>
</html>
