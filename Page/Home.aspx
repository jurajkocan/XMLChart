<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication2.Page.WebForm1" MasterPageFile="~/Page/MasterPages/MasterPage.Master" %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="contentHead" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Scripts/Static_Content/css/page_home.css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="contentMain" runat="server">    
    <div class="containerMain">
        <div class="containerSecondary">
            <div id="landing"
                style="background-image: url('../../Scripts/Static_Content/images/header.jpg'); margin: 0; background-repeat: no-repeat; background-size: cover; height: 300px;">
                <div class="container padding20">
                    <h1 class="fg-white">ICSB Site</h1>
                    <div style="height: 140px;"></div>
                </div>
            </div>


            <div id="homeDescription">
                <div id="gettingStarted" class="textDescription">
                    <div class="h2">Getting Started</div>
                    <p>
                        XMLParser Application gives you a basic way to build your own graph
                from your XML document. Go and create your first Chart.
                    </p>
                    <a href="/XML" class="button default large bg-blue fg-white">Create chart<i class="icon-arrow-right-5 on-right"></i></a>
                </div>
                <div id="additionalFunctions" class="textDescription">
                    <div class="h2">About Application</div>
                    <p>
                        If You want to know more about this application you can download the Specification.
                <a href="/Register">Sign Up</a> and get more functions on this page
                    </p>
                    <a 
                        class="button default large bg-blue fg-white"
                        runat="server"
                        onserverclick="btnSpecDownload_Click">Specification<i class="icon-download on-right"></i></a>
                </div>

                <div id="divHomePageID" class="textDescription">
                    <div class="h2">Lorem ipsum</div>
                    <p>
                        Lorem Ipsum is simply dummy text of the printing and 
                typesetting industry. Lorem Ipsum has been the industry's 
                standard dummy text ever since the 1500s, 
                when an unknown printer took a galley of type and 
                scrambled it to make a type specimen book.
                    </p>
                </div>

            </div>
        </div>
    </div>

</asp:Content>