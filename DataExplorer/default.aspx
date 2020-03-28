<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DataExplorer.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="default-page">Welcome to the home page of the Avocado Price Explorer!</p>
    <p></p>
    <p class="default-page">
            The data set used in this assignment comes from Kaggle, posted by an individual named Justin Kiggins. 
        Based on the description that Justin provides, this data originates from the Hass Avocado Board website, 
        and the data was downloaded in May 2018. The Hass website goes on to further describe the data as representing 
        the weekly 2018 retail scan data for units and price. 
        <br /><br />
        The data represents numbers recorded from retailer cash registers and thus the 
        actual sales of avocados.
        <br /><br />
        <a href="https://www.kaggle.com/neuromusic/avocado-prices">Kaggle Source</a>
        <br /><br />
        The data used in any dashboards is pulled from jeansndserver.database.windows.net and sourced by <a href="https://www.kaggle.com/neuromusic">Justin Kiggins</a> on Kaggle.com
    </p>
    <img src="./media/hass.png" />
</asp:Content>
