<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disenar.aspx.cs" Inherits="WebApplication1.Clientes.disenar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="CupcakeCreator" runat="server" style="text-align:center;">
        <asp:Label class="titulo" runat="server" Text="Crea tu propio Cupcake!" />
        <asp:Image ImageUrl="~/Clientes/cupcake_creator.jpg" runat="server" />
        <asp:Button ID="btnDisenar" UseSubmitBehavior="true" CssClass="boton_1" runat="server" Text="Crear Cupcake" OnClick="btnDisenar_Click" />
        <asp:Button id="btnGaleria" UseSubmitBehavior="true" CssClass="boton_1" runat="server" Text="Ver Diseños" OnClick="btnGaleria_Click" />
    </div>
    </asp:Content>
