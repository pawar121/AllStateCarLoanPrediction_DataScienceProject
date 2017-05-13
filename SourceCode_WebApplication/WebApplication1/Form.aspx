<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form.aspx.cs" Inherits="WebApplication1.Form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<style>    
    
.wrapper {
	position: relative;
	display: inline;       /* displays the three input fields in the same row */
}

.wrapper .fa {
	position: absolute;
	padding: 0.4em;      /* sat the icons with a right spacing referring to the border */
	font-size: 1.2em;   /* chose a suitable font size according to the size of the field */
	color: #ccc;       /* gave icons a light gray color */
}

.input-group {
	width: 15em;
	height: 2.5em;
	margin-bottom: 1.8em;            /* some space below other field */
	margin-right: 1.7em;             /* some space from the next field */
	padding-left: 2.5em;             /* space from left to accommodate icons */
	border: 0.1em solid #ccc;        /* light gray border applied */
	border-radius: 0.3em;            /* small border radius */
	background-color: #ffffea;       /* light yellow field background color */
	}

.input-group:hover {
	border-color: #3399FF;
	box-shadow: 0em 0em 0.2em #3399FF;
}

.input-group:active {
	border-color: #006699;
}

.textarea:hover {
	border-color: #3399FF;
	box-shadow: 0em 0em 0.2em #3399FF;
}

.textarea:active {
	border-color: #006699;
}

.send-btn {
	padding: 0.5em 4em;
	font-size: 1em;
	margin-top: 2em;
	background-color: #319cd5;
	color: white;
	border: none;
	border-radius: 0.3em;
	margin-left: 37em;   /* this value depends from page to page */
}
</style>
<body>
   

 <form id="form1" runat="server" class="form" >

<h2>Contact Form</h2>   <!-- just a title -->

	  <div class="wrapper">
   <input class="input-group" type="password" name="name" placeholder="Name (required)"></div>
       <div class="wrapper">
  
   <input class="input-group" type="text" name='email' placeholder="E-Mail (required)"></div>
	   <div class="wrapper">
 
   <input class="input-group" type="text" name='subject' placeholder="Subject (optional)"></div>
	<textarea class="textarea" placeholder="Write your message here..." ></textarea>

   <button href="#" class="send-btn">Send</button>
</form>










    </form>
</body>
</html>
