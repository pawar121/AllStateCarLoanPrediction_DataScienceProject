<%@Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title> </title>

   <style type="text/css">

       body{
           background:url("C:/Users/Gautam/Documents/Visual Studio 2015/Projects/FinalAllstate/FinalAllstate/image/image1.jpg");
           background-repeat:no-repeat;
           background-size:100%;
       }         

      form input{
          margin-bottom:30px;
      }     

      #sub{
            margin-bottom:100px;
      }

      #formdiv{
          margin-left:700px;
          margin-bottom:200px;
      }

      #married, #homeowner{
          float:right;
      }

      
   </style>

     <script src="Scripts/jquery-3.1.1.js"></script>
     <script src="Scripts/bootstrap.js"></script>
     <script src="Scripts/bootstrap.min.js"></script>
     <script src="Scripts/jquery.backstretch.js"></script>
     <script src="Scripts/jquery-3.1.1.min.js"></script>

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

        <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12" id="formdiv">
            <div class="registrationform">
                <div class="form-horizontal">

                    <fieldset>
                        <legend>Choose your plan below <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <div class ="col-lg-6   ">
                                    <asp:label Text =" Select Quote A" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteA" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                    </asp:DropDownList>                                
                              </div>
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote B" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteB" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                            
                           
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote C" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteC" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">      
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>

                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote D" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteD" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>1</asp:ListItem>      
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>

                            
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote E" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteE" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                           
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote F" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteF" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>      
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                             
                            
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Quote G" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteG" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>      
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>

                            </div>     
                        </fieldset>                             
                    </div>

                     <div class ="col-lg-12">  
                                <div class="col-lg-7">
                                    <h3> <strong>Your have selected the following plan. Press Submit to confirm </strong></h3> 
                                    <asp:TextBox ID="APlan" runat="server" placeholder="A" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="BPlan" runat="server" placeholder="B" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="CPlan" runat="server" placeholder="C" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="DPlan" runat="server" placeholder="D" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="EPlan" runat="server" placeholder="E" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="FPlan" runat="server" placeholder="F" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>
                                    <asp:TextBox ID="GPlan" runat="server" placeholder="G" Width="40px" CssClass="form-control col-lg-1"></asp:TextBox>

                                </div>      
                        </div>
                        <div class ="col-lg-12">   
                                 <asp:Button ID="SubmitQuotes" runat="server" CssClass="btn btn-primary col-lg-6" Text="Submit"/>                        
                        </div> 

                        <div class ="col-lg-12">   
                            <h3> <strong>Total Price for your selected plan is </strong></h3>
                                 <asp:TextBox ID="TotalPrice" runat="server" CssClass="btn btn-primary col-lg-6" Text="" />                        
                        </div>
                </div>

            </div>
        </div>
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery.backstretch.js"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        
    
       

    </script>
    </form>

</body>
</html>
