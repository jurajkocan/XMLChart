<%@ Page Title="Chart" Language="C#" MasterPageFile="~/Page/MasterPages/NestedMasterPage.master" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="WebApplication2.Page.Chart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHead" runat="server">    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentMain" runat="server">
    <div class="containerMain">
        <div class="containerSecondary">
            comming soon
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentScripts" runat="server">
    <script type="text/javascript" src="../Scripts/Static_Content/js/chart/Chart.js"></script>
    <script type="text/javascript" src="../Scripts/Static_Content/js/page_chart.js"></script>
</asp:Content>
