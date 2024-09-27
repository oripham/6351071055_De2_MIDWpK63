<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="ManageBeverage.aspx.cs" Inherits="de1.ManageBeverage" %>

<%@ Register Src="~/UserControl/ucManageBeverage.ascx" TagPrefix="uc1" TagName="ucManageBeverage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucManageBeverage runat="server" id="ucManageBeverage" />
</asp:Content>
