<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PedidosAdmin.aspx.cs" Inherits="WebApplication1.Admin.PedidosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>
            <div>
                <br />
                <asp:CheckBox ID="ckUsuario" Text="Buscar por usuario:" runat="server" /><asp:TextBox ID="txtBUser" CssClass="cajaTexto" runat="server" style="display:inline-block; vertical-align:middle;"  EnableTheming="False" />
                <br />
                <asp:CheckBox ID="ckFecha" Text="Filtrar por fecha de entrega: Desde " runat="server" /><asp:TextBox ID="txtFecha1" CssClass="cajaTexto" style="display:inline-block; vertical-align:middle;" runat="server" />  
                <ajaxToolkit:CalendarExtender ID="txtFecha1_CalendarExtender" runat="server" Format="dd/MM/yyyy" Enabled="True" TargetControlID="txtFecha1">
                </ajaxToolkit:CalendarExtender>
                Hasta:<asp:TextBox CssClass="cajaTexto" ID="txtFecha2" style="display:inline-block; vertical-align:middle;"  runat="server" />
                <ajaxToolkit:CalendarExtender ID="txtFecha2_CalendarExtender" runat="server" Format="dd/MM/yyyy" Enabled="True" TargetControlID="txtFecha2">
                </ajaxToolkit:CalendarExtender>
                <br /><br />
                <asp:Button Text="Filtrar Datos" runat="server" ID="btnBuscar" style="font-size:14px;" CssClass="boton_1" OnClick="btnBuscar_Click" />
                <asp:Button Text="Exportar a PDF" runat="server" ID="btnImprimir" style="font-size:14px;" CssClass="boton_1" OnClick="btnImprimir_Click" />
            </div>
         <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="9" DataKeyNames="idpedido" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Left" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:BoundField DataField="idpedido" HeaderText="Código" ReadOnly="True" SortExpression="idpedido" InsertVisible="False" />
                <asp:BoundField DataField="idusuario" HeaderText="Usuario" SortExpression="idusuario" />
                <asp:BoundField DataField="fecha" HeaderText="F. Creado" SortExpression="fecha" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
                <asp:BoundField DataField="fecha_entrega" HeaderText="F. Entrega" SortExpression="fecha_entrega" dataformatstring="{0:MMMM d, yyyy}" htmlencode="false" />
                <asp:BoundField DataField="dir_entrega" HeaderText="Dir. Entrega" SortExpression="dir_entrega" />
                <asp:BoundField DataField="dir_factura" HeaderText="Dir. Factura" SortExpression="dir_factura" />
                <asp:CheckBoxField DataField="entregado" HeaderText="Entregado" SortExpression="entregado" />
                <asp:BoundField DataField="subtotal" HeaderText="Sub-Total" SortExpression="subtotal" />
                <asp:BoundField DataField="iva" HeaderText="IVA" SortExpression="iva" />
                <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
                 <EmptyDataTemplate>
                <div>
                    <table  cellspacing="0">
                        <tr>
                            <td>
                            Aún no existen pedidos agregados al sistema.
                            </td>
                        </tr>
                    </table>
                </div>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT [pedido.detalle].iddetalle, topping.imagen AS imgTopping, base.imagen AS imgBase, crema.imagen AS imgCrema, [pedido.detalle].cantidad, [pedido.detalle].precio FROM [pedido.detalle] INNER JOIN diseno ON [pedido.detalle].iddiseno = diseno.iddiseno INNER JOIN topping ON diseno.idtopping = topping.idtopping INNER JOIN crema ON diseno.idcrema = crema.idcrema INNER JOIN base ON diseno.idbase = base.idbase INNER JOIN pedido ON [pedido.detalle].idpedido = pedido.idpedido WHERE (pedido.idpedido = @idPedido)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="idPedido" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT idpedido, idusuario, fecha, fecha_entrega, dir_entrega, dir_factura, entregado, subtotal, iva, total FROM pedido">
            <%--<SelectParameters>
                <asp:ControlParameter ControlID="txtCliente" DefaultValue="" Name="idusuario" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFecha1" DefaultValue="" Name="fecha1" PropertyName="Text" />
                <asp:ControlParameter ControlID="txtFecha2" DefaultValue="" Name="fecha2" PropertyName="Text" />
            </SelectParameters>--%>
        </asp:SqlDataSource>
             <asp:Button runat="server" ID="btnFake" Style="display:none;" />

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlEditar" OkControlID="btnAceptar" TargetControlID="btnFake" BackgroundCssClass="modalBackground"  ></ajaxToolkit:ModalPopupExtender>

        <asp:Panel ID="pnlEditar" runat="server" Style="display:none; width:300px; height:auto;" CssClass="modalPopup botonTexto">
            <asp:Label ID="Label1" runat="server" Text="Detalle de pedido" style="display:block; margin:6px; text-align:center;"/>
            
          <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="iddetalle" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="iddetalle" HeaderText="Código" ReadOnly="True" SortExpression="iddetalle" Visible="False" />
                    <asp:BoundField DataField="imgTopping" HeaderText="imgTopping" SortExpression="imgTopping" Visible="False" />
                    <asp:BoundField DataField="imgBase" HeaderText="imgBase" SortExpression="imgBase" Visible="False" />
                    <asp:BoundField DataField="imgCrema" HeaderText="imgCrema" SortExpression="imgCrema" Visible="False" />
                    <asp:TemplateField HeaderText="Producto">
                        <ItemTemplate>
                         <div class="divCart">
                            <asp:Image ID="Image1" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, String.Empty)  + string.Format("/Materiales/masas/{0}",Eval("imgBase")) %>' />
                            <asp:Image ID="Image2" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, String.Empty)  + string.Format("/Materiales/cremas/{0}",Eval("imgCrema")) %>' />
                            <asp:Image ID="Image3" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# Request.Url.AbsoluteUri.Replace(Request.Url.AbsolutePath, String.Empty)  + string.Format("/Materiales/topping/{0}",Eval("imgTopping")) %>' />
                        </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Cantidad" HeaderText="cantidad" SortExpression="cantidad" />
                    <asp:BoundField DataField="Precio" HeaderText="precio" SortExpression="precio" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            
            </asp:GridView>
                <br />  <div style="text-align:center;">
            <asp:Button ID="btnAceptar" CssClass="botonBlanco" runat="server" Text="Aceptar" />
                    </div>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
           <asp:PostBackTrigger ControlID="btnBuscar" />
        </Triggers>   
    </asp:UpdatePanel>

</asp:Content>
