<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucCategoryList.ascx.cs" Inherits="de1.UserControl.ucCategoryList" %>

<b>Beverage Category Available</b>
<br />
<br />

<asp:DataList ID="DataList1" runat="server" DataKeyField="CatID" DataSourceID="CategoryListEntityDataSource">
    <ItemTemplate>
        <ul>
            <li>
                <asp:HyperLink ID="hplCategoryList" runat="server" Text='<%# Eval("CatName") + "(" + Eval("Beverages.Count") + ")" %>' NavigateUrl='<%# "~/Category.aspx?id=" + Eval("CatID") %>'></asp:HyperLink>
                <br /><br />
            </li>
        </ul>
    </ItemTemplate>
    <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="Larger" Font-Strikeout="False" Font-Underline="False" />
</asp:DataList>
<asp:EntityDataSource ID="CategoryListEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Categories" Include="Beverages">
</asp:EntityDataSource>


