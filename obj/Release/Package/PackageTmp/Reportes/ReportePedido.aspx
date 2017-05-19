<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportePedido.aspx.cs" Inherits="WebApplication1.Reportes.ReportePedido" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" ReportSourceID="CrystalReportSource1" ToolPanelView="ParameterPanel"  Height="50px" ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reportes\rptPedido.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
