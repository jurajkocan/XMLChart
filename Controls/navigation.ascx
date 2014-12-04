﻿<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="navigation.ascx.cs" Inherits="WebApplication2.Controls.navigation" %>

<nav class="navigation-bar bg-black">
    <nav class="navigation-bar-content">
        <a id="navProject" runat="server" class="element" href="/Home"><i class="fa fa-cube"></i></a>
        <span class="element-divider"></span>
        <a id="navHome" runat="server" class="element" href="/Home">Home</a>
        <a id="navXML" runat="server" class="element" href="/XML">XML</a>
        <a id="navChart" runat="server" class="element" href="/Chart">Chart</a>
        <a id="navAbout" runat="server" class="element" href="/About">About Me</a>
        

    </nav>
</nav>