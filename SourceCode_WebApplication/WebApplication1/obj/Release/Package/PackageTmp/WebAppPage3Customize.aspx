<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAppPage3Customize.aspx.cs" Inherits="WebApplication1.WebAppPage3Customize" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title> </title>

   <style type="text/css">

       body{
           background:url("http://www.hdwallwide.com/wp-content/uploads/2014/11/car-insurance-02-hd-wallpaper-hdwallwide.com_.jpg");
           background-repeat:no-repeat;
           background-size:100%;
           color :blanchedalmond;
       }        
       
      #SubmitQuotes{
          margin-left:150px;
      }

      form input{
          margin-bottom:30px;
      }     

      #sub{
            margin-bottom:100px;
      }

      #formdiv{
          margin-left:650px;
          margin-right:300px;
          margin-bottom:200px;
           top: -6px;
           left: -411px;
           color:black;
           font-weight:bold;
           font-size:larger;
           height: 597px;
           width: 554px;
       }

      #married, #homeowner{
          float:right;
      }

      
       </style>


    
     <script runat="server">
/* void Page_Load(Object sender, EventArgs e)
         {
            
         }
         
       */

          
     </script>

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

       <h1 > 
       
        
         <img src="https://media.glassdoor.com/sqll/2341/allstate-squarelogo.png" alt="Sample Image" style="height: 113px; width: 128px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CUSTOMIZE YOUR PLAN</strong></h1>
       
      
<%--        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Previous Quote:<i class="fa fa-pencil pull-right"></i></h4>
        <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:label  ID="previousPlan" runat="server" repeatdirection="Horizontal" CssClass="auto-style3" ></asp:label>
        <br class="auto-style3" />
        <span class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price:
        </span>
        <asp:label  ID="previousPlanPrice" runat="server" repeatdirection="Horizontal" CssClass="auto-style3" ></asp:label>                          
      </span>                          
      
         --%>
        
        
         
        
        <div class="col-lg-12 col-md-12 " id="formdiv">

            
            <asp:label ID ="LABEL1" Text =" Select Coverage A " runat="server" repeatdirection="Horizontal" ></asp:label >
            <div class="registrationform">
                <div class="form-horizontal">

                    <fieldset>
                        <legend>Choose your plan below <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <div class ="col-lg-6">
                         
                                    <asp:label Text =" Select Coverage A " runat="server" repeatdirection="Horizontal" ></asp:label >
                                      &nbsp;
                                    <br />
                                    Suggested A:
                                 <asp:label ID="Aprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:DropDownList ID="QuoteA" CssClass="form-control col-lg-6" runat="server" AutoPostBack="true"
                                          repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                    </asp:DropDownList>                                
                              </div>
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Coverage B" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                    Suggested B:
                                 <asp:label ID="Bprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
                                    <asp:DropDownList ID="QuoteB" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                            
                           
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Coverage C" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    Suggested C:
                                 <asp:label ID="Cprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
                                    <asp:DropDownList ID="QuoteC" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">      
                                            <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>

                                <div class="col-lg-6">
                                    <asp:label Text =" Select Coverage D" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    Suggested D:
                                 <asp:label ID="Dprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
                                    <asp:DropDownList ID="QuoteD" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>1</asp:ListItem>      
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>

                            
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Coverage E" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    Suggested E:
                                 <asp:label ID="Eprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
                                    <asp:DropDownList ID="QuoteE" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>      
                                            <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                           
                                <div class="col-lg-6">
                                    <asp:label Text =" Select Coverage F" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    Suggested F:
                                 <asp:label ID="Fprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
                                    <asp:DropDownList ID="QuoteF" CssClass="form-control col-lg-6" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>0</asp:ListItem>
                                            <asp:ListItem>1</asp:ListItem>      
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>                                
                                 </div>
                             
                            
                                <div class="col-lg-6">
                                    <asp:label Text ="Select Coverage G" runat="server" repeatdirection="Horizontal" ></asp:label >
                                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                    <br />
                                    Suggested G:
                                 <asp:label ID="Gprev"   runat="server" repeatdirection="Horizontal" ></asp:label >
                                
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
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="SubmitQuotes" runat="server" OnClick="Response_Click" CssClass="btn btn-primary col-lg-8" Text="Submit"/>                        
                        </div> 

                        <div class ="col-lg-12">   


                           
                       
                     
                            <h3> Compare your plans:</h3> 
                            <asp:label ID ="PredictionResut1" runat="server" Width="120px"></asp:label> 
                            <asp:label ID ="PredictionResut1new"  runat="server" Width="120px" ></asp:label>
                           <br />
                            <asp:label ID ="PredictionResut2"  runat="server" Width="120px" ></asp:label> 
                         <asp:label ID ="PredictionResut2new"  runat="server" Width="120px"></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut3"  runat="server" Width="120px"></asp:label> 
                         <asp:label ID ="PredictionResut3new"  runat="server" Width="120px"></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut4"  runat="server" Width="120px" ></asp:label> 
                          <asp:label ID ="PredictionResut4new"  runat="server" Width="120px" ></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut5"  runat="server" Width="120px" ></asp:label>
                         <asp:label ID ="PredictionResut5new"  runat="server" Width="120px"></asp:label>
                         <br />
                            <asp:label ID ="PredictionResut6"  runat="server" Width="120px" ></asp:label>
                         <asp:label ID ="PredictionResut6new"  runat="server"  Width="120px" ></asp:label>
                            <br />
                            <asp:label ID ="PredictionResut7"  runat="server" width="120px"></asp:label>
                         <asp:label ID ="PredictionResut7new"  runat="server" Width="120px"></asp:label>
                         <br />
                            </div>
                                                
                         


                            <br />
                            <strong>Total Price for your selected plan:
                                    
                            </strong>
                            <asp:label ID="TotalPriceLabel" BackColor="WhiteSmoke" runat="server" ></asp:label >
                                 
                              <br />
                            <strong>Total Price of plan suggested by us:
                                    
                            </strong>
                            <asp:label ID="TotalPriceLabelPrev" BackColor="WhiteSmoke" runat="server" ></asp:label >
                               
                            <br />
                                 
                            <br />
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
