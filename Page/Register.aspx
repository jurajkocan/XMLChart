<%@ Page Title="Register" Language="C#" MasterPageFile="~/Page/MasterPages/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.Page.register" %>

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
                            <h3>Register</h3>
                        </div>
                        <div class="sep"></div>
                        <div class="inputs">
                            <input id="emailTextboxID" type="email" placeholder="e-mail" autofocus />
                            <input id="passwordTextboxID1" type="password" placeholder="Password" />
                            <input id="passwordTextboxID2" type="password" placeholder="Repeat Password" />
                            <div class="members">
                                <a href="/Login">Already member?</a>
                            </div>
                            <a id="submit" onclick="onclick()" class="button default large bg-blue fg-white">Sign UP<i class="icon-arrow-right-5 on-right"></i></a>
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
