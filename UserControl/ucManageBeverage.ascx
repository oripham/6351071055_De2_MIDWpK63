<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucManageBeverage.ascx.cs" Inherits="de1.UserControl.ucManageBeverage" %>
<table style="width:100%;">
    <tr>
    <td>Beverage name:</td>
    <td>
        <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="TextBoxName" 
            ErrorMessage="Tên đồ uống chưa nhập" 
            ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
    <td>&nbsp;</td>
</tr>
<tr>
    <td>Beverage Price</td>
    <td>
        <asp:TextBox ID="TextBoxPrice" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBoxPrice" 
            ErrorMessage="Mức giá đồ uống chưa nhập" 
            ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
    <td>&nbsp;</td>
</tr>
<tr>
    <td>Category</td>
    <td>
        <asp:DropDownList ID="DropDownListCategory" runat="server"></asp:DropDownList>
    </td>
    <td>&nbsp;</td>
</tr>
<tr>
    <td>Beverage Description</td>
    <td>
        <asp:TextBox ID="TextBoxDescription" TextMode="MultiLine" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBoxDescription" 
            ErrorMessage="Mô tả thông tin đồ uống chưa nhập" 
            ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
    <td>&nbsp;</td>
</tr>
<tr>
    <td>Beverage Picture</td>
    <td>
        <asp:FileUpload ID="FileUploadPicture" runat="server" />
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="FileUploadPicture" 
            ErrorMessage="Hình ảnh đồ uống chưa nhập" 
            ForeColor="Red"></asp:RequiredFieldValidator>
    </td>
    <td>&nbsp;</td>
</tr>


    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:Button ID="ButtonAddNew" runat="server" Text="Add new" OnClick="ButtonAddNew_Click" /></td>
    </tr>
</table>

<hr />
<asp:GridView ID="GridViewBeverages" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"  AllowPaging="True" PageSize="3" OnPageIndexChanging="GridViewBeverages_PageIndexChanging">
    <Columns>
    <asp:TemplateField HeaderText="No.">
        <ItemTemplate>
            <%# Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Picture">
        <ItemTemplate>
            <asp:Image runat="server" ID="imageBeverage" ImageUrl='<%# "~/images/Beverages/" + Eval("ImageFilePath") %>' Width="100px" Height="100px" />
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="Name">
        <ItemTemplate>
            <asp:HyperLink ID="HyperLink1" Text='<%# Eval("Name")%>' Target="_blank" runat="server" NavigateUrl='<%# "~/Details.aspx?id="+Eval("id") %>'></asp:HyperLink>
        </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField>
        <ItemTemplate>
            <asp:Button runat="server" OnClientClick="return confirm('Do you really want to delete this Beverage?');" ID="DeleteButton" Text="Delete" CommandName="DeleteBeverage" CommandArgument='<%# Eval("id") %>'/>
        </ItemTemplate>
    </asp:TemplateField>


        <asp:TemplateField>
    <ItemTemplate>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditBeverage" CommandArgument='<%# Eval("id") %>' />
    </ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>

<asp:EntityDataSource ID="ManageBeverageEntityDataSource" runat="server" ConnectionString="name=QLDoUongEntities" DefaultContainerName="QLDoUongEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Beverages">
</asp:EntityDataSource>

