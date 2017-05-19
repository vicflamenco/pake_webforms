<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreaTuCupcake.aspx.cs" Inherits="WebApplication1.Clientes.CreaTuCupcake" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="height:480px;">
    <div id="InsertarDiseno" >
        <div id="vistaPrevia">
            <div style="display:block;padding:7px 7px;text-align:center;">
                <asp:Label ID="Label1" Text="Nombre del Diseño" runat="server"  />
                <asp:TextBox ID="txtNombre" runat="server" Text="" /><br /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="Nombre es obligatorio." SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
            <div class="divNuevoDiseno">
                <asp:Image ID="imgMasa" class="imgDisenoNuevo" ImageUrl="imageurl" runat="server" />
                <asp:Image ID="imgCrema" class="imgDisenoNuevo" ImageUrl="imageurl" runat="server" />
                <asp:Image ID="imgTopping" class="imgDisenoNuevo" ImageUrl="imageurl" runat="server" />
            </div>
        </div>
        <div style="float:left; margin: 0px auto; width:500px; height:auto;" >
            <div id="materiales" class="disenador" style="height:auto;">
                <asp:ListView ID="lsvtopping" runat="server" DataSourceID="dbTopping" EnablePersistedSelection="True" DataKeyNames="idtopping" OnSelectedIndexChanged="lsvtopping_SelectedIndexChanged" >
                    <EmptyDataTemplate>
                        <table style="">
                            <tr>
                                <td>No exiten topping agregados.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td runat="server" style="text-align:center;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraTopping" runat="server" ImageUrl='<%# string.Format("~/Materiales/topping/{0}",Eval("imagen")) %>' />
                            </div>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="selectores">
                        <table runat="server" border="0" style="text-align:center;">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </table>
                        <div style="text-align:center;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                            </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="border-radius:10px;border:solid 2px #0094ff;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraTopping" runat="server" ImageUrl='<%# string.Format("~/Materiales/topping/{0}",Eval("imagen")) %>' />
                            </div>
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:LinqDataSource ID="dbTopping" runat="server" ContextTypeName="WebApplication1.dbLQDataContext" EntityTypeName="" Select="new (idtopping, nombre, precio, imagen)" TableName="toppings">
                </asp:LinqDataSource>
                <asp:ListView ID="lsvCrema" runat="server" DataSourceID="dbCrema" EnablePersistedSelection="True" DataKeyNames="idcrema" OnSelectedIndexChanged="lsvCrema_SelectedIndexChanged">
                    <EmptyDataTemplate>
                        <table style="">
                            <tr>
                                <td>No exiten cremas agregadas.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td id="Td1" runat="server" style="text-align:center;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraCrema" runat="server" ImageUrl='<%# string.Format("~/Materiales/cremas/{0}",Eval("imagen")) %>' />
                            </div>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="selectores">
                        <table id="Table1" runat="server" border="0" style="text-align:center;">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </table>
                        <div style="text-align:center;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                            </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td2" runat="server" style="border-radius:10px;border:solid 2px #0094ff;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraCrema" runat="server" ImageUrl='<%# string.Format("~/Materiales/cremas/{0}",Eval("imagen")) %>' />
                            </div>
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:LinqDataSource ID="dbCrema" runat="server" ContextTypeName="WebApplication1.dbLQDataContext" EntityTypeName="" Select="new (idcrema, nombre, precio, imagen)" TableName="cremas">
                </asp:LinqDataSource>
                <asp:ListView ID="lsvMasas" runat="server" DataSourceID="dbMasa" EnablePersistedSelection="True" DataKeyNames="idbase" OnSelectedIndexChanged="lsvMasas_SelectedIndexChanged">
                    <EmptyDataTemplate>
                        <table style="">
                            <tr>
                                <td>No exiten masas agregadas.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <td id="Td1" runat="server" style="text-align:center;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraMasa" runat="server" ImageUrl='<%# string.Format("~/Materiales/masas/{0}",Eval("imagen")) %>' />
                            </div>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="selectores">
                        <table id="Table1" runat="server" border="0" style="text-align:center;">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </table>
                        <div style="text-align:center;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowNextPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                </Fields>
                            </asp:DataPager>
                        </div>
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td id="Td2" runat="server" style="border-radius:10px;border:solid 2px #0094ff;">
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <div style="overflow:hidden;">
                            <asp:ImageButton CommandName="Select" ID="imagen" CssClass="imgTiraMasa" runat="server" ImageUrl='<%# string.Format("~/Materiales/masas/{0}",Eval("imagen")) %>' CausesValidation="False" />
                            </div>
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:LinqDataSource ID="dbMasa" runat="server" ContextTypeName="WebApplication1.dbLQDataContext" EntityTypeName="" Select="new (idbase, nombre, precio, imagen)" TableName="bases">
                </asp:LinqDataSource>
            </div>
            <div id="controles" style="text-align:center; height:auto;">
                <asp:Button ID="btnCrearDiseno" Font-Size="14px" CssClass="boton_1" runat="server" Text="Añadir a Galería" OnClick="btnCrearDiseno_Click" />
                <asp:Button ID="btnCompartir" Font-Size="14px" CssClass="boton_1" style="display:none;" runat="server" Text="Compartir" />
                <asp:Button ID="btnComprar" Font-Size="14px" CssClass="boton_1" runat="server" Text="Añadir al carrito" OnClick="btnComprar_Click" />
            </div>
        </div>
    </div>
            </div>

       <asp:Button runat="server" ID="btnFake" Style="display:none;" />

        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlEditar" TargetControlID="btnFake" CancelControlID="btnCancelar" BackgroundCssClass="modalBackground"  ></cc1:ModalPopupExtender>

        <asp:Panel ID="pnlEditar" runat="server" Style="display:none;" CssClass="modalPopup botonTexto">
            <asp:Label ID="Label2" runat="server" Text="Agregando al carrito" style="display:block; margin:6px; text-align:center;"/>
            
            <asp:Label ID="Label3" runat="server" Text="Cantidad" style="display:inline-block; vertical-align:middle; margin:5px;" />
            <asp:TextBox ID="txtCantidad" CssClass="cajaTexto" runat="server" style="display:inline-block; vertical-align:middle; width:100px;"/>
            <ajaxToolkit:FilteredTextBoxExtender ID="precioTextBox_FilteredTextBoxExtender" runat="server" FilterType="Numbers" Enabled="True" TargetControlID="txtCantidad">
                </ajaxToolkit:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtCantidad"></asp:RequiredFieldValidator>
            <div style="display:inline-block; vertical-align:middle;">
                <asp:Button ID="btnUP" runat="server" Text="▲" style="display:block; width:24px; height:14px; font-size:8px;"/>
                <asp:Button ID="btnDOWN" runat="server" Text="▼" style="display:block; width:24px; height:14px; font-size:8px;"/>
            </div>
            <cc1:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Minimum="1" TargetControlID="txtCantidad" TargetButtonUpID="btnUP" TargetButtonDownID="btnDOWN"></cc1:NumericUpDownExtender>
                <br />  
            <asp:Button ID="btnAgregar" CssClass="botonBlanco" runat="server" Text="Aceptar" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnCancelar" CssClass="botonBlanco" runat="server" Text="Cancelar" />
        </asp:Panel>
       
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
