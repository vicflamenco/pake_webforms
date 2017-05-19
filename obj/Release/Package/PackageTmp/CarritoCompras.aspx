<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CarritoCompras.aspx.cs" Inherits="WebApplication1.CarritoCompras" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../Styles/estilos.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" CancelButtonText="Cancelar" FinishCompleteButtonText="Finalizar" FinishPreviousButtonText="Atrás" StartNextButtonText="Siguiente" StepNextButtonText="Siguiente" StepPreviousButtonText="Atrás" DisplaySideBar="False" Width="929px" OnNextButtonClick="Wizard1_NextButtonClick" OnFinishButtonClick="Wizard1_FinishButtonClick" >
                    <FinishNavigationTemplate>
                        <asp:Button ID="FinishPreviousButton" CssClass="boton_1"  runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Atrás" />
                        <asp:Button ID="FinishButton" CssClass="boton_1" runat="server" CommandName="MoveComplete" Text="Realizar Pedido" />
                    </FinishNavigationTemplate>
                    <StartNavigationTemplate>
                        <asp:Button ID="StartNextButton" CssClass="boton_1" runat="server" CommandName="MoveNext" Text="Siguiente" />
                    </StartNavigationTemplate>
                    <WizardSteps>
                        <asp:WizardStep ID="WizardStep1" runat="server" Title="Carrito de compra" StepType="Start">
                            <asp:GridView ID="dgCarrito" class="Carrito" runat="server" ShowFooter="True" Style="border-radius:15px;" AutoGenerateColumns="False" OnRowDataBound="dgCarrito_RowDataBound" OnRowEditing="dgCarrito_RowEditing" OnRowDeleting="dgCarrito_RowDeleting" GridLines="None" HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                <asp:TemplateField Visible="False">
                     <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).id %>'></asp:Label>
                     </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ID Diseño" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="lblIDDiseno" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).iddiseno %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Producto">
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).nombre %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                     <div class="divCart">
                        <asp:Image ID="Image1" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# ((WebApplication1.ListaCompras)Container.DataItem).urlbase %>' />
                        <asp:Image ID="Image2" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# ((WebApplication1.ListaCompras)Container.DataItem).urlcrema %>' />
                        <asp:Image ID="Image3" runat="server" CssClass="imgDisenoCart" ImageUrl='<%# ((WebApplication1.ListaCompras)Container.DataItem).urltop %>' />
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:Label ID="lblCantidad" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).cantidad %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Precio">
                    <ItemTemplate>
                        <asp:Label ID="lblPrecio" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).precio %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total">
                    <ItemTemplate>
                        <asp:Label ID="lblTotal" runat="server" Text='<%# ((WebApplication1.ListaCompras)Container.DataItem).precio * ((WebApplication1.ListaCompras)Container.DataItem).cantidad %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
 
                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="botonBlanco" EditText="Editar" ShowEditButton="True" >
                        <ControlStyle CssClass="botonBlanco" />
                        </asp:CommandField>
                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="botonBlanco" DeleteText="Remover" ShowDeleteButton="True" >
                        <ControlStyle CssClass="botonBlanco" />
                        </asp:CommandField>
            </Columns>
                    <EditRowStyle BackColor="#999999" />
            <EmptyDataTemplate>
                <div>
                    <table  cellspacing="0">
                        <tr>
                            <td>
                            Aún no existen Cupcakes agregados a su lista de compra.
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
            <asp:Button runat="server" ID="btnFake" Style="display:none;" />
                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlEditar" TargetControlID="btnFake" CancelControlID="btnCancelar" BackgroundCssClass="modalBackground"  ></cc1:ModalPopupExtender>

                <asp:Panel ID="pnlEditar" runat="server" Style="display:none;" CssClass="modalPopup botonTexto">
                    <asp:Label ID="Label1" runat="server" Text="Editando Item" style="display:block; margin:6px; text-align:center;"/>
            
                    <asp:Label ID="Label2" runat="server" Text="Cantidad" style="display:inline-block; vertical-align:middle; margin:5px;" />
                    <asp:TextBox ID="txtCantidad" CssClass="cajaTexto" runat="server" style="display:inline-block; vertical-align:middle; width:100px;"/>
                    <div style="display:inline-block; vertical-align:middle;">
                        <asp:Button ID="btnUP" runat="server" Text="▲" style="display:block; width:24px; height:14px; font-size:8px;"/>
                        <asp:Button ID="btnDOWN" runat="server" Text="▼" style="display:block; width:24px; height:14px; font-size:8px;"/>
                    </div>
                    <cc1:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Minimum="1" TargetControlID="txtCantidad" TargetButtonUpID="btnUP" TargetButtonDownID="btnDOWN"></cc1:NumericUpDownExtender>
                        <br />  
                    <asp:Button ID="btnActualizar" CssClass="botonBlanco" runat="server" Text="Aceptar" OnClick="btnActualizar_Click" />
                    <asp:Button ID="btnCancelar" CssClass="botonBlanco" runat="server" Text="Cancelar" />
                </asp:Panel>

                        </asp:WizardStep>
                        <asp:WizardStep ID="WizardStep2" AllowReturn="false" runat="server" Title="Datos del pedido" StepType="Finish">
                            <asp:Table ID="Table1" runat="server" Width="489px" style="margin-left: 0px">
                                <asp:TableRow runat="server">
                                    <asp:TableCell runat="server">
                                        Fecha Entrega:
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell1" runat="server">
                                        <asp:Calendar ID="dtpCalendario" OnDayRender="dtpCalendario_DayRender" runat="server" ></asp:Calendar>                                     


</asp:TableCell>
                                </asp:TableRow>
                               <asp:TableRow ID="TableRow1" runat="server">
                                    <asp:TableCell ID="TableCell2" runat="server">
                                        Dirección Entrega:
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell3" runat="server">
                                        <asp:TextBox ID="txtDirEntrega" runat="server" ></asp:TextBox>
</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow2" runat="server">
                                    <asp:TableCell ID="TableCell4" runat="server">
                                        Dirección Factura:
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell5" runat="server">
                                        <asp:TextBox ID="txtDirFactura" runat="server" ></asp:TextBox>
</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow3" runat="server">
                                    <asp:TableCell ID="TableCell6" runat="server">
                                        Sub-Total
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell7" runat="server">
                                        <asp:Label ID="lblSubtotal" runat="server"></asp:Label>
</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow4" runat="server">
                                    <asp:TableCell ID="TableCell8" runat="server">
                                        IVA
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell9" runat="server">
                                        <asp:Label ID="lblIVA" runat="server"></asp:Label>
</asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow ID="TableRow5" runat="server">
                                    <asp:TableCell ID="TableCell10" runat="server">
                                        Total
                                    </asp:TableCell>
                                    <asp:TableCell ID="TableCell11" runat="server">
                                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
</asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <div style="text-align:center;">
                                <asp:Label runat="server" ID="lblValidar" Font-Size="14px" Text="Por favor, complete todos los campos correctamente." Visible="false"></asp:Label>
                            </div>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" AllowReturn="False" ID="WizardStep3" Title="Pedido Realizado" StepType="Complete">
                            <asp:Label runat="server" Font-Size="20px" Text="El pedido ha sido realizado satisfactoriamente, gracias por su compra"></asp:Label>
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>

        </ContentTemplate>

    </asp:UpdatePanel>
    
</asp:Content>
