<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucBeverageDetail.ascx.cs" Inherits="de1.UserControl.ucBeverageDetail" %>

<asp:FormView ID="FormView1" runat="server" DataSourceID="BeverageDetailEntityDataSource" DataKeyNames="ID">

    <ItemTemplate>
        ID:
        <asp:Label ID="lblBeverageDetailID" runat="server" Text='<%# Eval("ID") %>' />
        <br />
        Name:
        <asp:Label ID="lblBeverageDetailName" runat="server" Text='<%# Eval("Name") %>' />
        <br />
        <asp:Image ID="imgBeverageDetail" runat="server" ImageUrl='<%# Eval("ImageFilePath", "~/images/Beverages/{0}") %>' />
        <br />
        Description:
        <asp:Label ID="lblBeverageDetailDescription" runat="server" Text='<%# Eval("Description") %>' />
        <br />
        Price:
        <asp:Label ID="lblBeverageDetailPrice" runat="server" Text='<%# Eval("Price") %>' />


        <br />

        Category:
        <asp:Label ID="lblBeverageDetailCategory" runat="server" Text='<%# Eval("Category.CatName") %>' />
        <br />


    </ItemTemplate>

</asp:FormView>
<asp:EntityDataSource ID="BeverageDetailEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableFlattening="False" EntitySetName="Beverages"
    Where="it.ID = @ID">
    <WhereParameters>
        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>

