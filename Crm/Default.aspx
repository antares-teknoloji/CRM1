<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Crm.Default" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>

<meta name="viewport" content="width=device-width, initial-scale=1"/>
<title>CRM Hilmi Beken TTS Müşteri İlişkileri Portalı</title>
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 450px;
        position: relative;   
        padding-right: 15px;
        padding-left: 15px;
	}
	.modal-login .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-login .modal-header {
		border-bottom: none;
        position: relative;
		justify-content: center;
	}
	.modal-login .close {
        position: absolute;
		top: -10px;
		right: -10px;
	}
	.modal-login h4 {
		color: #636363;
		text-align: center;
		font-size: 26px;
		margin-top: 0;
	}
	.modal-login .modal-content {
		color: #999;
		border-radius: 1px;
    	margin-bottom: 15px;
        background: #fff;
		border: 1px solid #f3f3f3;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 25px;
    }
	.modal-login .form-group {
		margin-bottom: 20px;
	}
	.modal-login label {
		font-weight: normal;
		font-size: 13px;
	}
	.modal-login .form-control {
		min-height: 38px;
		padding-left: 5px;
		box-shadow: none !important;
		border-width: 0 0 1px 0;
		border-radius: 0;
	}
	.modal-login .form-control:focus {
		border-color: #ccc;
	}
	.modal-login .input-group-addon {
		max-width: 42px;
		text-align: center;
		background: none;
		border-width: 0 0 1px 0;
		padding-left: 5px;
		border-radius: 0;
	}
    .modal-login .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #19aa8d;
        border-radius: 3px;
		border: none;
		min-width: 140px;
        outline: none !important;
    }
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #179b81;
	}
	.modal-login .hint-text {
		text-align: center;
		padding-top: 5px;
		font-size: 13px;
	}
	.modal-login .modal-footer {
		color: #999;
		border-color: #dee4e7;
		text-align: center;
		margin: 0 -25px -25px;
		font-size: 13px;
		justify-content: center;
	}
	.modal-login a {
		color: #fff;
		text-decoration: underline;
	}
	.modal-login a:hover {
		text-decoration: none;
	}
	.modal-login a {
		color: #19aa8d;
		text-decoration: none;
	}	
	.modal-login a:hover {
		text-decoration: underline;
	}
	.modal-login .fa {
		font-size: 21px;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
    .responsive{
    max-width:100%;
    height:auto;
    }

    img {
  display: block;
  margin-left: auto;
  margin-right: auto;
    }

    @media only screen and (max-width: 600px) {
        .modal-login {
		width: auto;
        position: relative;   
        padding-right: 15px;
        padding-left: 15px;
	}
    
}

/* Small devices (portrait tablets and large phones, 600px and up) */
@media only screen and (min-width: 600px) {
  
}

/* Medium devices (landscape tablets, 768px and up) */
@media only screen and (min-width: 768px) 
{
    
}

/* Large devices (laptops/desktops, 992px and up) */
@media only screen and (min-width: 992px) 
{
    
}

/* Extra large devices (large laptops and desktops, 1200px and up) */
@media only screen and (min-width: 1200px) 
{
    
}

</style>
</head>
<body>


<!-- Modal HTML -->
     <form method="post" id="form1" runat="server">
<div class="modal-dialog modal-login">
	<div class="modal-content">
			<div class="modal-header">	
                   <img src="image/logo_beken.png" class="responsive"   width="300" height="100"/>
				<h4 class="modal-title">Müşteri İlişkileri Yönetim Portalı</h4>
              
			</div>
			<div class="modal-body">
				
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user"></i></span>
							   <asp:TextBox ID="txtKullaniciAd" runat="server"  CssClass="form-control"></asp:TextBox>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							   <asp:TextBox ID="txtParola" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
						</div>
					</div>
					<div class="form-group">
					   <asp:Button   OnClientClick="btnGiris_Click"  runat="server" class="btn btn-primary btn-block btn-lg btn-signin" Text="Giriş" OnClick="btnGiris_Click" />
                           <br />
                           <span id="error_message"></span>
				
		              </div>
	    </div>
      </div>
    </div>
  </form>
</body>
</html>                            