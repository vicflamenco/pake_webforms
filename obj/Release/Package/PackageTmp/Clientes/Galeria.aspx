<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Galeria.aspx.cs" Inherits="WebApplication1.Clientes.Galeria"  ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
    <asp:ListView ID="lsvDatos" runat="server" DataKeyNames="iddiseno" DataSourceID="dbData" GroupItemCount="3" InsertItemPosition="None" OnItemCommand="lsvDatos_ItemCommand">
        <EditItemTemplate>
            <td id="Td1" runat="server" style="">iddiseno:
                <asp:Label ID="iddisenoLabel1" runat="server" Text='<%# Eval("iddiseno") %>' />
                
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>No se han devuelto datos.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td id="Td2" runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td id="Td3" runat="server" style="">
                </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td id="Td4" runat="server" style="">
                <div class="divItemLSV">
                <div style="text-align:center;">
                Nombre:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                </div>
                <div class="divDiseno">
                    <asp:Image ID="imgMasa" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/masas/{0}",Eval("imgmasa")) %>' />
                    <asp:Image ID="imgCrema" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/cremas/{0}",Eval("imgcrema")) %>' />
                    <asp:Image ID="imgTopping" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/topping/{0}",Eval("imgtopping")) %>' />
                </div>
                Precio: $ 
                <asp:Label ID="preciobaseLabel" runat="server" Text='<%# Eval("disenoPrecio") %>' />
                <br />Votos:
                <asp:Label ID="votosLabel" runat="server" Text='<%# Eval("votos") %>' /> 
                    <br />
                    <div style="text-align:center;">
                <asp:Button ID="btnCarrito" Style="margin-top:8px; box-shadow:none; font-size:14px;"  CommandName="Carrito" runat="server" Width="150px" text="Agregar Al Carrito" />
                    </div>
                </div>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td5" runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td6" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True " 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageText="Primera" LastPageText="Ultima" NextPageText="Siguiente" PreviousPageText="Anterior" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" PreviousPageText="Anterior" NextPageText="Siguiente" LastPageText="Ultima" FirstPageText="Primero" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td id="Td7" runat="server" style="">
                 <div class="divSelect">
                <div style="text-align:center;">
                Nombre:
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                </div>
                <div class="divDiseno">
                    <asp:Image ID="imgMasa" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/masas/{0}",Eval("imgmasa")) %>' />
                    <asp:Image ID="imgCrema" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/cremas/{0}",Eval("imgcrema")) %>' />
                    <asp:Image ID="imgTopping" runat="server" CssClass="imgDiseno" ImageUrl='<%# string.Format("~/Materiales/topping/{0}",Eval("imgtopping")) %>' />
                </div>
                Precio: $ 
                <asp:Label ID="preciobaseLabel" runat="server" Text='<%# Eval("disenoPrecio") %>' />
                <br />Votos:
                <asp:Label ID="votosLabel" runat="server" Text='<%# Eval("votos") %>' /> 
                    <br />
                    <div style="text-align:center;">
                <asp:Button ID="Button1" CssClass="botonBlanco" Style="margin-top:8px; box-shadow:none; font-size:14px;"  CommandName="Carrito" runat="server" Width="150px" text="Agregar Al Carrito" />
                                <%--<br />--%>
                <%--<asp:Button ID="btnCompartir" CssClass="botonBlanco" Style="margin-top:8px; box-shadow:none; font-size:14px;"  CommandName="Compartir" runat="server" Width="150px" text="Compartir" />--%>
                        
                        </div>
                </div>
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:Button runat="server" ID="btnFake" Style="display:none;" />

        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlEditar" TargetControlID="btnFake" CancelControlID="btnCancelar" BackgroundCssClass="modalBackground"  ></cc1:ModalPopupExtender>

        <asp:Panel ID="pnlEditar" runat="server" Style="display:none;" CssClass="modalPopup">
            <asp:Label ID="Label2" runat="server" Text="Agregando al carrito" style="display:block; margin:6px; text-align:center;"/>
            
            <asp:Label ID="Label3" runat="server" Text="Cantidad" style="display:inline-block; vertical-align:middle; margin:5px;" />
            <asp:TextBox ID="txtCantidad" CssClass="cajaTexto" runat="server" style="display:inline-block; vertical-align:middle; width:100px;"/>
            <div style="display:inline-block; vertical-align:middle;">
                <asp:Button ID="btnUP" runat="server" Text="▲" style="display:block; width:24px; height:14px; font-size:8px;"/>
                <asp:Button ID="btnDOWN" runat="server" Text="▼" style="display:block; width:24px; height:14px; font-size:8px;"/>
            </div>
            <cc1:NumericUpDownExtender ID="NumericUpDownExtender1" runat="server" Minimum="1" TargetControlID="txtCantidad" TargetButtonUpID="btnUP" TargetButtonDownID="btnDOWN"></cc1:NumericUpDownExtender>
                <br />  
            <asp:Button ID="btnAgregar"  CssClass="botonBlanco" runat="server" Text="Aceptar" OnClick="btnAgregar_Click" />
            <asp:Button ID="btnCancelar"  CssClass="botonBlanco" runat="server" Text="Cancelar" />
        </asp:Panel>

    <asp:SqlDataSource ID="dbData" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT diseno.iddiseno, diseno.idtopping, diseno.idcrema, diseno.idbase, diseno.nombre, usuarios.idusuario, crema.imagen AS imgcrema, topping.imagen AS imgtopping, crema.precio + topping.precio + base.precio AS disenoPrecio, base.imagen AS imgmasa, COUNT(voto.idlike) AS votos FROM diseno INNER JOIN base ON diseno.idbase = base.idbase INNER JOIN crema ON diseno.idcrema = crema.idcrema INNER JOIN topping ON diseno.idtopping = topping.idtopping INNER JOIN usuarios ON diseno.idusuario = usuarios.idusuario LEFT OUTER JOIN voto ON diseno.iddiseno = voto.iddiseno GROUP BY diseno.iddiseno, diseno.idtopping, diseno.idcrema, diseno.idbase, diseno.nombre, usuarios.idusuario, crema.imagen, topping.imagen, base.imagen, crema.precio + topping.precio + base.precio" ProviderName="<%$ ConnectionStrings:ApplicationServices.ProviderName %>"></asp:SqlDataSource>
</asp:Content>
