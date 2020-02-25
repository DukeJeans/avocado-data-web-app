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
        the weekly 2018 retail scan data for units and price. The data comes from retailer cash registers and represents 
        actual sales of avocados.
    </p>
    <img src="./media/hass.png" />
</asp:Content>
