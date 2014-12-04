<%@ Page Title="XML" Language="C#" AutoEventWireup="true" CodeBehind="XML.aspx.cs" Inherits="WebApplication2.Page.XML" MasterPageFile="~/Page/MasterPages/MasterPage.Master" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="contentHead" runat="server">
    
    <%-- wizard --%>    
    <link rel="stylesheet" type="text/css" href="../../Scripts/Static_Content/css/wizard/main.css" />
    <link rel="stylesheet" type="text/css" href="../../Scripts/Static_Content/css/wizard/normalize.css" />
    <link rel="stylesheet" type="text/css" href="../../Scripts/Static_Content/css/wizard/jquery.steps.css" />

    <link rel="stylesheet" type="text/css" href="../../Scripts/Static_Content/css/page_xml.css" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="contentMain" runat="server">
    <div class="containerMain">
        <div class="containerSecondary">
            <div class="containerXMLParser">
                <%-- hiden objects --%>
                <asp:HiddenField ID="hiddenFieldChartInfoX" runat="server" ClientIDMode="Static" Value="" />
                <asp:HiddenField ID="hiddenFieldChartInfoY" runat="server" ClientIDMode="Static" Value="" />
                <button id="btnWizardFinished" runat="server" onserverclick="btnWizardFinished_Click" clientidmode="Static" graph-stat="false" style="display: none"></button>
                <%-- end of hiden objects --%>

                <div class="submitXml">
                    <%-- Step 1: Insert XML--%>
                    <div class="h2">Insert your XML Url adress</div>
                    try: http://www.pantarhei.sk/media/bestseller_export.xml

            <div class="inputFieldXml">
                <div class="input-control text" id="inputInsertXml">
                    <input type="text" class="inputField" value="" placeholder="input text" id="inputXMLUrl" runat="server" autofocus />
                </div>

                <%-- Button: Submit XML Url--%>

                <button class="button primary" value="submit" id="btnSubmitXml" runat="server" onserverclick="btnSubmitXML_Click"
                    style="margin-left: 10px; height: 32px; width: 100px; font-size: 17px;">
                    submit                            
                </button>
                <asp:Label ID="labelWrongUrl" runat="server"
                    Style="display: none; font-size: large; color: red;">
                    can not read xml file, check if you add right url adress<br>
                    Url adress have to start with "www" or "http", and end with ".xml"
                </asp:Label>

                <%-- Step 2: XML Configuration --%>
                <div id="divConfigureXml" style="display: none" runat="server">
                    <h2 style="color: #2184be"><b>Configure your XML</b></h2>

                    <div id="wizard">
                        <h2>First Step</h2>
                        <section>
                            <div id="divXmlConfig" runat="server" class="border">
                                <table class="tabConfigureXml" id="table_section1" style="background-color: inherit;">
                                    <%-- Section: Table Head --%>
                                    <tr>
                                        <th style="width: 300px;"></th>

                                        <th></th>
                                    </tr>
                                    <%-- Section: Table Body--%>
                                    <tr id="trKeyWord">
                                        <%-- Select: X AXIS --%>
                                        <td>
                                            <label class="labelAxis label_dropdownDescription">X axis</label>
                                        </td>
                                        <td>
                                            <select id="demoShowSelectedXaxis" runat="server" clientidmode="static">
                                            </select>
                                        </td>
                                    </tr>
                                    <tr id="trUrlAddress">
                                        <%-- Select: Y AXIS --%>
                                        <td>
                                            <label class="labelAxis label_dropdownDescription">Y axis "Have to be a number"</label>
                                        </td>
                                        <td>
                                            <select id="demoShowSelectedYaxis" runat="server" clientidmode="static">
                                            </select>
                                        </td>
                                        <td>
                                            <span class="icon-cancel-2 on-right on-left" id="spanIcoCancel"
                                                style="background: red; color: white; padding: 10px; border-radius: 50%; display: none"></span>
                                        </td>
                                    </tr>
                                    <%-- Section: Table Footer--%>
                                </table>
                            </div>

                        </section>

                        <h2>Second Step</h2>
                        <section>
                            <table class="tabConfigureXml" id="table_section2" style="background-color:inherit;">
                                <tr>
                                    <th style="width: 300px;"></th>
                                    <th></th>
                                </tr>                                
                                <tr>
                                    <td>
                                        <label class="label_dropdownDescription">Lorem Ipsum</label>

                                    </td>
                                    <td>
                                        <div class="input-control select">
                                            <select id="demoShowSelectedQuantity">
                                                <option value="0" data-imagesrc="../../Scripts/Static_Content/images/quantity.png"
                                                    data-description="Select quantity of displayed data on one page">10</option>
                                                <option value="1" data-imagesrc="../../Scripts/Static_Content/images/quantity.png"
                                                    data-description="Select quantity of displayed data on one page">20</option>
                                                <option value="2" data-imagesrc="../../Scripts/Static_Content/images/quantity.png"
                                                    data-description="Select quantity of displayed data on one page">30</option>
                                                <option value="3" data-imagesrc="../../Scripts/Static_Content/images/quantity.png"
                                                    data-description="Select quantity of displayed data on one page">40</option>
                                                <option value="3" data-imagesrc="../../Scripts/Static_Content/images/quantity.png"
                                                    data-description="Select quantity of displayed data on one page">50</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </section>

                        <h2>Third Step</h2>
                        <section>
                            <p>third step</p>
                        </section>
                    </div>

                </div>

                <div class="chart">
                    <canvas id="myChart" width="800" height="700"></canvas>
                </div>
            </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="contentScripts">
    <%-- ! Execute Javascript --%>    
    <script type="text/javascript" src="../../Scripts/Static_Content/js/wizard/modernizr-2.6.2.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Static_Content/js/wizard/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../../Scripts/Static_Content/js/wizard/jquery.cookie-1.3.1.js"></script>
    <script type="text/javascript" src="../../Scripts/Static_Content/js/wizard/jquery.steps.js"></script>        
    <script type="text/javascript" src="../../Scripts/Static_Content/js/jquery.ddslick.js"></script>     
    <script type="text/javascript" src="../../Scripts/Static_Content/js/component/metro-input-control.js"></script>
    <script type="text/javascript" src="../Scripts/Static_Content/js/chart/Chart.js"></script>
    <script type="text/javascript" src="../Scripts/Static_Content/js/chart/initializeChart.js"></script>
    <script type="text/javascript" src="../../Scripts/Static_Content/js/xmlConfigure.js"></script>
</asp:Content>