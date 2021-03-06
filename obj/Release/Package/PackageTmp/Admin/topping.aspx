﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="topping.aspx.cs" Inherits="WebApplication1.Materiales.topping" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="lsvDatos" runat="server" DataSourceID="lqDatos" 
        DataKeyNames="idtopping" GroupItemCount="3" 
        oniteminserting="lsvDatos_ItemInserting" 
        onitemcommand="lsvDatos_ItemCommand" oniteminserted="lsvDatos_ItemInserted" 
        onitemupdating="lsvDatos_ItemUpdating" OnItemCanceling="lsvDatos_ItemCanceling" OnItemDeleted="lsvDatos_ItemDeleted" OnItemDeleting="lsvDatos_ItemDeleting">
        <EditItemTemplate>
        <td id="Td1" runat="server" style="">
            <div class="divEdit">
            Nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
            <br />
            <asp:Image ID="imagenTextBox" class="imgItem" runat="server" ImageUrl='<%# string.Format("~/Materiales/topping/{0}",Eval("imagen")) %>' />
            <br /> 

            <asp:FileUpload ID="imgFile" runat="server"/><br />
            Precio:
            <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
            <br />
                <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Actualizar" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancelar" />
        </div>
        </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>
                        No se han devuelto datos.</td>
                </tr>
            </table>
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_1" Text="Agregar Nuevo Topping" CommandName="AgregarTopping" />
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td id="Td2" runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td id="Td3" runat="server" style="">
                <div class="divInsert">
                Nombre:
               <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />Imagen:
                <asp:FileUpload ID="imgFile" runat="server" />
                <br />Precio:
                <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                <br /><br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Agregar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    </div>
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td id="Td4" runat="server" style="">
            <div class="divItemLSV">
                <div style="text-align:center;">
                <%--Código:
                <asp:Label ID="idbaseLabel" runat="server" Text='<%# Eval("idtopping") %>' />
                <br />--%>Nombre:
                <br />
                <asp:Label ID="nombreLabel"  Width="200" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                <asp:Image ID="imagenLabel" class="imgItem" runat="server" ImageUrl='<%#string.Format("~/Materiales/topping/{0}",Eval("imagen")) %>' />
                <br />Precio: $ 
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br /><br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                    </div>
            </div>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_1" Text="Agregar Nuevo Topping" CommandName="AgregarTopping" />
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td5" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
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
                <div class="divItemLSV">
                Código:
                <asp:Label ID="idbaseLabel" runat="server" Text='<%# Eval("idtopping") %>' />
                <br />Nombre:
                <br />
                <asp:Label ID="nombreLabel" Width="200" runat="server" Text='<%# Eval("nombre") %>' />
                <br />Imagen:<br />
                <asp:Image ID="imagenLabel" ImageAlign="Middle" runat="server" Width="180" Height="150" ImageUrl='<%#string.Format("~/Materiales/topping/{0}",Eval("imagen")) %>' />
                <br />Precio:
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
            </div>
            </td>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:LinqDataSource ID="lqDatos" runat="server" 
        ContextTypeName="WebApplication1.dbLQDataContext" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="toppings">
    </asp:LinqDataSource>

</asp:Content>
