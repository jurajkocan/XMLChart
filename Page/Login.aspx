<%@ Page Title="Login" Language="C#" MasterPageFile="~/Page/MasterPages/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.Page.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">
    <link rel="stylesheet" type="text/css" href="../Scripts/Static_Content/css/page_login.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div class="containerMain">
        <div class="containerSecondary">
            <div class="containerLogin">
                <div class="container">
                    <div id="signup">
                        <div class="header">
                            <h3>Sign In</h3>
                        </div>
                        <div class="sep"></div>
                        <div class="inputs">
                            <input id="emailTextboxID" type="email" name="email" placeholder="e-mail" required autofocus />
                            <input type="password" placeholder="Password" />
                            <div class="members">
                                <a href="/Register">Register</a> / <a href="#">Forgot password</a>
                            </div>
                            <a id="submit" href="#" class="button default large bg-blue fg-white">Sign IN<i class="icon-arrow-right-5 on-right"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
    <script type="text/javascript" src="../Scripts/Static_Content/js/page_sign.js"></script>
</asp:Content>
