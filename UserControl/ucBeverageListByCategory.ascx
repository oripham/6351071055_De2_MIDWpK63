<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBeverageListByCategory.ascx.cs" Inherits="de1.UserControl.ucBeverageListByCategory" %>
<asp:ListView ID="ltvBeverageListByCategory" runat="server" DataKeyNames="ID" DataSourceID="BeverageListByCategoryEntityDataSource">

    <ItemTemplate>
        <td style="text-align:center" >
            <br />
            <asp:Label ID="lblBeverageName" runat="server" Text='<%# Eval("Name") %>' ForeColor="red"></asp:Label><br />
            <br />
            <asp:Image ID="imgBeverage" runat="server" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>' Width="200px" Height="150px" /><br />
            <br />
            <asp:Label ID="lblBeveragePrice" runat="server" Text='<%# Eval("Price") + "VND" %>' ForeColor="red"></asp:Label><br />
            <br />
            <asp:HyperLink ID="hrlBeverageDetail" runat="server" NavigateUrl='<%# "~/Detail.aspx?id="+Eval("ID") %>'>View Detail</asp:HyperLink><br />
            <br />

        </td>
        </div>
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



</asp:ListView>
<asp:EntityDataSource ID="BeverageListByCategoryEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Beverages" Where="it.Category.CatID = @ID" Include="Category">
    <WhereParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>

