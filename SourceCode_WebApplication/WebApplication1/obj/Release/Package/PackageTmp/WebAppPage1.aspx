<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebAppPage1.aspx.cs" Inherits="WebApplication1.WebFormTest" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<title></title>
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

      h1{
          font-weight:bolder;
      }
      #sub{
            margin-bottom:100px;
      }

      #formdiv{
          
          margin-left:244px;
          margin-right:300px;
          margin-bottom:200px;
           top: -8px;
           left: -39px;
             color:black;
           font-weight:bold;
           font-size:larger;
           height: 1229px;
       }

      #married, #homeowner{
          float:right;
           top: 13px;
           left: -9px;
           margin-top: 0px;
       }

      
   </style>

     <script runat="server">

         void Page_Load(Object sender, EventArgs e)
         {
             // Manually register the event-handling method for
             // the Click event of the Button control.
            // SatisfiedFlagNo.Click += new EventHandler(this.Response_Click);
         }

         void Response_Click(Object sender, EventArgs e)
         {
             // When the button is clicked,
             // change the button text, and disable it.

             Button clickedButton = (Button)sender;
             Response.Redirect("Contact.aspx");
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
             $("#groupage").hide();

             $("#GroupValue").change(function () {
                 if ($("#GroupValue").val() == 1) {
                    $("#CustAge").show();
                     $("#groupage").hide();
                 } else if ($("#GroupValue").val() > 1) {
                     $("#groupage").show();
                     $("#CustAge").hide();
                 }
             });

         });
   </script>


     <link href="Content/bootstrap.css" rel="stylesheet" />
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link href="Content/Site.css" rel="stylesheet" />
     <link href="Content/font-awesome.css" rel="stylesheet" type="text/css" />
     <link href="Content/bootstrap-theme.css" rel="stylesheet" />
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
   </head>

 <body>
   <h1 class="h1"> 
       
        
         <img src="https://media.glassdoor.com/sqll/2341/allstate-squarelogo.png" alt="Sample Image" style="height: 113px; width: 128px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>GET YOUR CUSTOMIZED AUTO INSURANCE PLAN</strong> </h1>
       
        
         &nbsp;<form id="form1" runat="server">
       
        
         <div class="col-lg-12 col-md-8 col-sm-6 col-xs-6" id="formdiv">
          
    <div class="container">



            <div class="registrationform">
                <div class="form-horizontal">

                        Please fill the following details to get a quote 
                         
                           
                        <div class="form-group">
                            <div class ="col-lg-12">
                                <div class="col-lg-6">
                                     <asp:label Text ="Select your state" runat="server"></asp:label>
                                    <asp:DropDownList ID="State" runat="server" CssClass="form-control ddl" Width="250px">
                                        <asp:ListItem Text ="AL"/>
                                        <asp:ListItem Text ="AR" />
                                        <asp:ListItem Text ="CO" />
                                        <asp:ListItem Text ="CT" />
                                        <asp:ListItem Text ="DC" />
                                        <asp:ListItem Text ="DE" />
                                        <asp:ListItem Text ="FL" />
                                        <asp:ListItem Text ="GA" />
                                        <asp:ListItem Text ="IA" />
                                        <asp:ListItem Text ="ID" />
                                        <asp:ListItem Text ="IN" />
                                        <asp:ListItem Text ="KS" />
                                        <asp:ListItem Text ="KY" />
                                        <asp:ListItem Text ="MD" />
                                        <asp:ListItem Text ="ME" />
                                        <asp:ListItem Text ="MO" />
                                        <asp:ListItem Text ="MS" />
                                        <asp:ListItem Text ="ND" />
                                        <asp:ListItem Text ="NE" />
                                        <asp:ListItem Text ="NH" />
                                        <asp:ListItem Text ="NM" />
                                        <asp:ListItem Text ="NV" />
                                        <asp:ListItem Text ="NY" />
                                        <asp:ListItem Text ="OH" />
                                        <asp:ListItem Text ="OK" />
                                        <asp:ListItem Text ="OR" />
                                        <asp:ListItem Text ="PA" />
                                        <asp:ListItem Text ="RI" />
                                        <asp:ListItem Text ="SD" />
                                        <asp:ListItem Text ="TN" />
                                        <asp:ListItem Text ="UT" />
                                        <asp:ListItem Text ="WA" />
                                        <asp:ListItem Text ="WI" />
                                        <asp:ListItem Text ="WV" />
                                        <asp:ListItem Text ="WY" />
                                    </asp:DropDownList>
                                </div>  
                             <br />
                                <div class="col-lg-6" id="homeowner">
                                  
                                    <asp:label Text ="Are you Homeowner" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:RadioButtonList ID="HomeownerFlag" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>                                
                                 </div>
                             </div>
                            <div class ="col-lg-12">
                                <div class="col-lg-6">
                                      <asp:label text ="Car Age" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:TextBox ID="CarAge" Text ="1" runat="server" placeholder="Car Age (in years)" CssClass="form-control" Width="238px"></asp:TextBox>
                                </div>  
                                 <div class ="col-lg-6" id="married">
                                     <br/>
                                    <asp:label Text ="Are you Married" runat="server"></asp:label>
                                    <asp:RadioButtonList ID="Married" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem Selected="True">Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>                
                                </div> 
                             
                             </div>

                            
                          <div class ="col-lg-12">
                              <div class="col-lg-4">
                              <asp:label Text ="Enter Car Value" runat="server"></asp:label>
                             &nbsp;<asp:DropDownList ID="CarValue" runat="server" placeholder="Car Value (in dollars)" Width="250px" CssClass="form-control">
                            <asp:ListItem>Less than $30,000</asp:ListItem>
                            <asp:ListItem>Between $30,000 and $40,000</asp:ListItem>
                            <asp:ListItem>Between $40,000 and $50,000</asp:ListItem>
                            <asp:ListItem>Between $50,000 and $60,000</asp:ListItem>
                            <asp:ListItem>Between $60,000 and $70,000</asp:ListItem>
                            <asp:ListItem>Between $70,000 and $80,000</asp:ListItem>
                            <asp:ListItem>Between $80,000 and $90,000</asp:ListItem>
                            <asp:ListItem>Between $90,000 and $100,000</asp:ListItem>
                            <asp:ListItem>More than $100,000</asp:ListItem>
                            </asp:DropDownList>
                               
                                  <br />
                               
                                  <asp:label Text ="Location" runat="server" repeatdirection="Horizontal" ></asp:label >
                                  <asp:TextBox ID="Location" Text="10001" runat="server" placeholder="Location" Width="248px" CssClass="form-control"></asp:TextBox>
                                  <br />
                             </div>
                            <div class="col-lg-4">
                                </div>
                           
                         </div>

                             <div class ="col-lg-12">
                                <div class="col-lg-6">
                                      <asp:label Text ="Duration of Previous Plan" runat="server" Width="250px" repeatdirection="Horizontal" ></asp:label >
                                    <asp:TextBox ID="DurationPrevious" Text ="0"  runat="server" Width="250px" placeholder="Duration Previous (in years)" CssClass="form-control"></asp:TextBox>
                                </div>  
                                <div class="col-lg-6">
                                  <asp:label Text ="Enter C Previous" runat="server"></asp:label>
                             <asp:DropDownList ID="C_Previous" runat="server" placeholder="C_Previous" Width="250px" CssClass="form-control">
                             <asp:ListItem>1</asp:ListItem>
                             <asp:ListItem>2</asp:ListItem>
                             <asp:ListItem>3</asp:ListItem>
                             <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList><br />
                             
                                </div>  
                                
                             </div>

                         <div class ="col-lg-12">
                                <div class="col-lg-6">
                               <asp:label Text ="Select Number of members in your group"  runat="server"></asp:label>
                             <asp:DropDownList ID="GroupValue"  runat="server"  Width="250px" placeholder="Number of people in Group" CssClass="form-control">
                             <asp:ListItem>1</asp:ListItem>
                             <asp:ListItem>2</asp:ListItem>
                             <asp:ListItem>3</asp:ListItem>
                             <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList><br />
                              </div>
                                <div class="col-lg-6" id="CustAge">
                                     <asp:label Text ="Age" Width="100px" runat="server"></asp:label>
                                <asp:TextBox ID="Age" runat="server" text = "0" placeholder="Age (in years) " CssClass="form-control" Width="478px"></asp:TextBox>
                                </div>          
                         </div>
                            
                         <div class = "col-lg-12" id="groupage">
                                <div class="col-lg-6">
                                     <asp:label Text ="Minimum Age" Width="250px"  runat="server"></asp:label>
                                <asp:TextBox ID="MinAge" runat="server"  Text="1" CssClass="form-control">1</asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                     <asp:label Text ="Maximum Age"  runat="server"></asp:label>
                                <asp:TextBox ID="MaxAge" runat="server" Width="250px" Text="1" CssClass="form-control">1</asp:TextBox>
                                </div>                           
                         </div>         

                           
                           

                           <div class ="col-lg-12" id="sub">   
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;   
                               <asp:Button ID="Button1" OnClick="Button1_Click"   Text="Submit"  runat="server" CssClass="btn btn-primary" Width="156px"/>
                                 </div>

                             <div class ="col-lg-12" id="sub1">   
                            <asp:Label ID = "DisplayErrorsLabel" runat="server" Text=""></asp:Label>

                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </div>

                        <br />
                        <div></div>
                        <div></div>


                       
        
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