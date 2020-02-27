<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="dash2.aspx.cs" Inherits="DataExplorer.dash2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <header>
        <div>
            <p>
                Total Bags and Average Price by Region and Year
            </p>
        </div>
        <div>
            <p style="font-size: 16px">
                Search which region you would like to view sales statistics for in the textbox, and then proceed to choose which year you would like to filter by in the second dropdown menu.
                When using the textbox to search, the results will include entries containing the searched substring.</p>
        </div>
    </header>
    <div id="dash2-data-sources">

        <asp:SqlDataSource ID="dash2SourceRegions" runat="server" ConnectionString="<%$ ConnectionStrings:dash2-regions %>" SelectCommand="SELECT DISTINCT region FROM AvocadoSale ORDER BY region ASC"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dash2SourceYears" runat="server" ConnectionString="<%$ ConnectionStrings:dash2-years %>" SelectCommand="SELECT DISTINCT year FROM AvocadoSale ORDER BY year ASC"></asp:SqlDataSource>

        <asp:SqlDataSource ID="dash2SourceSales" runat="server" ConnectionString="<%$ ConnectionStrings:dash2-sales %>" SelectCommand="SELECT region, SUM(totalBags) 'Total Bags Sold', AVG(averagePrice) 'Average Price per Avocado' FROM AvocadoSale WHERE region LIKE '%'+@searchStr+'%' AND [year] = @yearSelection GROUP BY region" OnSelecting="dash2SourceSales_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtRegion" Name="searchStr" PropertyName="Text" />
                <asp:ControlParameter ControlID="dropDownYear" Name="yearSelection" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <div>
        <p>
        REGION: 
        <asp:TextBox ID="txtRegion" runat="server" OnTextChanged="txtRegion_TextChanged"></asp:TextBox>
        </p>
        <p>
        YEAR: 
        <asp:DropDownList ID="dropDownYear" runat="server" DataSourceID="dash2SourceYears" DataTextField="year" DataValueField="year" AutoPostBack="True">
        </asp:DropDownList>
        </p>
    </div>
    <div style="float: left; padding: 20px; width: 20%">
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" DataSourceID="dash2SourceRegions">
        </asp:GridView>

    </div>
    <div style="overflow: hidden; width: 60%">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dash2SourceSales" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="region" HeaderText="region" SortExpression="region" />
                <asp:BoundField DataField="Total Bags Sold" HeaderText="Total Bags Sold" ReadOnly="True" SortExpression="Total Bags Sold" />
                <asp:BoundField DataField="Average Price per Avocado" HeaderText="Average Price per Avocado" ReadOnly="True" SortExpression="Average Price per Avocado" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</asp:Content>
