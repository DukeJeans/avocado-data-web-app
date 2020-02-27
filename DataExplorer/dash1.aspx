<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="dash1.aspx.cs" Inherits="DataExplorer.dash1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <header>
        <div>
            <p>
                Sales by Month and Region
            </p>
        </div>
        <div>
            <p style="font-size: 16px">
                Select which month you would like to view sales statistics for in the top dropdown menu, and then proceed to choose which region you would like to filter by in the bottom dropdown menu.
            </p>
        </div>
        <div>

            <asp:SqlDataSource ID="avocadoRegions" runat="server" ConnectionString="<%$ ConnectionStrings:region-str %>" SelectCommand="SELECT DISTINCT region FROM AvocadoSale
ORDER BY region ASC" OnSelecting="avocadoRegions_Selecting"></asp:SqlDataSource>

            <asp:SqlDataSource ID="pluByRegion" runat="server" ConnectionString="<%$ ConnectionStrings:avocado-plu-region-str %>" SelectCommand="SELECT year 'Year', SUM(sold4225) 'PLU 4225', SUM(sold4770) 'PLU 4770', SUM(sold4046) 'PLU 4046' FROM AvocadoSale WHERE region = @regionSelection AND MONTH(date) = @monthSelection GROUP BY year" OnSelecting="SqlDataSource1_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="dropDownRegion" DefaultValue="" Name="regionSelection" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="dropMonths" Name="monthSelection" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="avocadoMonths" runat="server" ConnectionString="<%$ ConnectionStrings:avocadoSales-months %>" OnSelecting="avocadoMonths_Selecting" SelectCommand="SELECT DISTINCT MONTH(date) FROM AvocadoSale ORDER BY MONTH(date) ASC"></asp:SqlDataSource>
       </div>
            <div style="font-size: 16px">
            <p>
                MONTH:
                <asp:DropDownList ID="dropMonths" runat="server" AutoPostBack="True" DataSourceID="avocadoMonths" DataTextField="Column1" DataValueField="Column1">
                </asp:DropDownList>
            </p>
            <p>
                REGION:
                <asp:DropDownList ID="dropDownRegion" class="drop-region" runat="server" DataSourceID="avocadoRegions" DataTextField="region" DataValueField="region" AutoPostBack="True">
                </asp:DropDownList>
            </p>
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="pluByRegion">
                <Columns>
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="PLU 4225" HeaderText="PLU 4225" ReadOnly="True" SortExpression="PLU 4225" />
                    <asp:BoundField DataField="PLU 4770" HeaderText="PLU 4770" ReadOnly="True" SortExpression="PLU 4770" />
                    <asp:BoundField DataField="PLU 4046" HeaderText="PLU 4046" ReadOnly="True" SortExpression="PLU 4046" />
                </Columns>
            </asp:GridView>

        </div>
    </header>
</form>
</asp:Content>
