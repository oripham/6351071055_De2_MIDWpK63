<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucSearchBeverage.ascx.cs" Inherits="de1.UserControl.ucSearchBeverage" %>

<table style="width: 100%;">
    <tr>
        <td>Name:
        </td>
        <td>
            <asp:TextBox ID="tbxName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>Price:
        </td>
        <td>
            <asp:TextBox ID="tbxLowerPrice" runat="server"></asp:TextBox>
        </td>

        <td>
            <asp:TextBox ID="tbxUpperPrice" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" /></td>
    </tr>

</table>
<p>Search Result</p>
<asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SearchResultEntityDataSource" AutoGenerateWhereClause="false">

    <ItemTemplate>
        <td runat="server" style="">ID:
            <span style="">

                <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>' /><br />

                <asp:Label Text='<%# Eval("Price") %>' runat="server" ID="PriceLabel" /><br />


                <asp:HyperLink ID="hrlBeverageDetail" runat="server" NavigateUrl='<%# "~/Detail.aspx?id="+Eval("ID") %>'>View Detail</asp:HyperLink><br />
                <br />
            </span>
        </td>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server" border="0" style="">
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </table>
        <div style="">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>
    <EmptyDataTemplate>
        <p style="color: red">No beverage founded!</p>
    </EmptyDataTemplate>
</asp:ListView>
<asp:EntityDataSource ID="SearchResultEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Beverages"
    Where="it.Name like '%' + @Name + '%' and it.Price >= @LowerPrice and it.Price <= @UpperPrice " EntityTypeFilter="" Select="" Include="Category">
    <WhereParameters>
        <asp:ControlParameter ControlID="tbxName" PropertyName="Text" Name="Name" Type="String"></asp:ControlParameter>
        <asp:ControlParameter ControlID="tbxLowerPrice" PropertyName="Text" Name="LowerPrice" Type="Decimal"></asp:ControlParameter>
        <asp:ControlParameter ControlID="tbxUpperPrice" PropertyName="Text" Name="UpperPrice" Type="Decimal"></asp:ControlParameter>
    </WhereParameters>
</asp:EntityDataSource>

