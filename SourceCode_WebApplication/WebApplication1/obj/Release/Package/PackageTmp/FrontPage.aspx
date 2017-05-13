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

     <script runat="server">

         void Page_Load(Object sender, EventArgs e)
         {
             // Manually register the event-handling method for
             // the Click event of the Button control.
             NavigatePage2.Click += new EventHandler(this.Response_Click);
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
    $("#CustAge").hide();
    $("#groupage").hide();
    $("#GroupValue").focusout(function (event) {
        alert($("#GroupValue").val());
        if ($("#GroupValue").val() == 1) {
            alert('zero');
            $("#CustAge").show();
            $("#groupage").hide();
        } else if ($("#GroupValue").val() >1) {
            alert('else');
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
     <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   </head>

 <body>
   
    <form id="form1" runat="server">
    <div class="container">

        <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12" id="formdiv">
            <div class="registrationform">
                <div class="form-horizontal">

                    <fieldset>
                        <legend>Please fill the following details to get a quote <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <div class ="col-lg-12">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="Location" runat="server" placeholder="Location" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-6" id="homeowner">
                                    <asp:label Text ="Are you Homeowner" runat="server" repeatdirection="Horizontal" ></asp:label >
                                    <asp:RadioButtonList ID="HomeownerFlag" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>                                
                                 </div>
                             </div>
                            <div class ="col-lg-12">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="CarAge" runat="server" placeholder="Car Age (in years)" CssClass="form-control"></asp:TextBox>
                                </div>  
                                <div class="col-lg-6">
                                    <asp:TextBox ID="C_Previous" runat="server" placeholder="C_Previous" CssClass="form-control"></asp:TextBox>
                                </div>  
                             </div>

                            <div class ="col-lg-12">
                                <div class="col-lg-6">
                                    <asp:TextBox ID="DurationPrevious" runat="server" placeholder="Duration Previous (in years)" CssClass="form-control"></asp:TextBox>
                                </div>  
                                <div class="col-lg-6">
                                    <asp:DropDownList ID="State" runat="server" CssClass="form-control ddl">
                                        <asp:ListItem Text ="AL" Value="1"/>
                                        <asp:ListItem Text ="AK" Value="2"/>
                                        <asp:ListItem Text ="AZ" Value="3"/>
                                        <asp:ListItem Text ="CA" Value="4"/>
                                        <asp:ListItem Text ="CT" Value="5"/>
                                        <asp:ListItem Text ="MA" Value="6"/>
                                        <asp:ListItem Text ="NE" Value="7"/>
                                        <asp:ListItem Text ="NY" Value="8"/>
                                        <asp:ListItem Text ="ND" Value="9"/>
                                        <asp:ListItem Text ="OK" Value="10"/>
                                    </asp:DropDownList>
                                </div>  
                             </div>
                           
                        <div class ="col-lg-12">
                                <div class="col-lg-6">
                                <asp:TextBox ID="CarValue" runat="server" placeholder="Car Value (in dollars)" CssClass="form-control"/>
                                </div>  
              
                            <div class ="col-lg-6" id="married">
                                    <asp:label Text ="Are you Married" runat="server"></asp:label>
                                    <asp:RadioButtonList ID="Married" runat="server" repeatdirection="Horizontal">
                                            <asp:ListItem>Yes</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                    </asp:RadioButtonList>                
                                </div> 
                         </div>
                         <div class ="col-lg-12">
                                <div class="col-lg-6">
                                <asp:TextBox ID="GroupValue" runat="server" placeholder="Number of people in Group" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-6" id="CustAge">
                                <asp:TextBox ID="Age" runat="server" placeholder="Age (in years) " CssClass="form-control"></asp:TextBox>
                                </div>          
                         </div>
                            
                         <div class = "col-lg-12" id="groupage">
                                <div class="col-lg-6">
                                <asp:TextBox ID="MinAge" runat="server" placeholder="Maximum age in Group" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                <asp:TextBox ID="MaxAge" runat="server" placeholder="Minimum age in Group" CssClass="form-control"></asp:TextBox>
                                </div>                           
                         </div>         

                         <div class ="col-lg-12" id="sub">   
                               <asp:Button ID="SubmitDetails" runat="server" CssClass="btn btn-primary col-lg-6" Text="Submit" />
                                 <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning col-lg-6" Text="Cancel" />                              
                            </div>
                        <div></div>
                        <div></div>
                            
                         <div class ="col-lg-12">  
                                <div class="col-lg-7">
                                    <h3> <strong>Your Suggested plan is </strong></h3> 
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
                                 <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary col-lg-6" Text="Are you Satisfied with the Plan?" />
                                 <asp:Button ID="NavigatePage2" runat="server" CssClass="btn btn-warning col-lg-6" Text="Are you Not Satisfied with the Plan?" OnClick="Response_Click"  />                              
                            </div>
                        
                                                   
                    </div>
                    </fieldset> </div>
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
