<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="masas.aspx.cs" Inherits="WebApplication1.Materiales.masas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../Styles/estilos.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <asp:ListView ID="lsvDatos" runat="server" DataSourceID="lqDatos" 
        DataKeyNames="idbase" GroupItemCount="3" 
        oniteminserting="lsvDatos_ItemInserting" 
        onitemcommand="lsvDatos_ItemCommand" oniteminserted="lsvDatos_ItemInserted" 
        onitemupdating="lsvDatos_ItemUpdating" OnItemCanceling="lsvDatos_ItemCanceling" OnItemDeleted="lsvDatos_ItemDeleted" OnItemDeleting="lsvDatos_ItemDeleting">
        <EditItemTemplate>
        <td id="Td1" runat="server" style="">
            <div class="divEdit">
            Nombre:
            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ControlToValidate="nombreTextBox"></asp:RequiredFieldValidator>
            <br />
            <asp:Image ID="imagenTextBox" class="imgItem" runat="server" ImageUrl='<%# string.Format("~/Materiales/masas/{0}",Eval("imagen")) %>' />
            <br /> 
            <asp:FileUpload ID="imgFile" runat="server"/><br /><br />
            Precio:
            <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' />
                  <ajaxToolkit:FilteredTextBoxExtender ID="precioTextBox_FilteredTextBoxExtender" runat="server" FilterType="Custom, Numbers" ValidChars ="." Enabled="True" TargetControlID="precioTextBox">
                </ajaxToolkit:FilteredTextBoxExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="precioTextBox"></asp:RequiredFieldValidator>
            <br /><br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Actualizar" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"  CausesValidation="false"
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
            <asp:Button ID="btnAgregar" runat="server" CssClass="boton_1" Text="Agregar Nueva Masa" CommandName="AgregarMasa" />
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
               <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="nombreTextBox"></asp:RequiredFieldValidator>
                <br />Imagen:
                <asp:FileUpload ID="imgFile" runat="server" /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="imgFile"></asp:RequiredFieldValidator>
                <br />Precio:
                <asp:TextBox ID="precioTextBox" runat="server" Text='<%# Bind("precio") %>' /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="precioTextBox"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="precioTextBox_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="Custom, Numbers" ValidChars ="." TargetControlID="precioTextBox" >
                    </ajaxToolkit:FilteredTextBoxExtender>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nombreTextBox" Display="Dynamic" ErrorMessage="El nombre es obligatorio" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="precioTextBox" Display="Dynamic" ErrorMessage="El precio no es válido." MaximumValue="999999" MinimumValue="0.00" SetFocusOnError="True" Type="Currency"></asp:RangeValidator>
                    <asp:RegularExpressionValidator ID="REGEXFileUploadLogo" runat="server" ErrorMessage="La imágen no es válida" ControlToValidate="imgFile" ValidationExpression= "(.*).(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.bmp|.BMP|.png|.PNG)$" Display="Dynamic" />
                    <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Agregar" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" CausesValidation="false"/>
                    </div>
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td id="Td4" runat="server" style="">
            <div class="divItemLSV">
                <div style="text-align:center;">
                <%--Código:
                <asp:Label ID="idbaseLabel" runat="server" Text='<%# Eval("idbase") %>' />
                <br />--%>Nombre:
                <br />
                <asp:Label ID="nombreLabel"  Width="200" runat="server" Text='<%# Eval("nombre") %>' />
                <br />
                <asp:Image ID="imagenLabel" class="imgItem" runat="server" ImageUrl='<%#string.Format("~/Materiales/masas/{0}",Eval("imagen")) %>' />
                <br />Precio: $ 
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br /><br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Eliminar" />
                    <ajaxToolkit:ConfirmButtonExtender ID="DeleteButton_ConfirmButtonExtender" runat="server" ConfirmText="Se eliminará de manera permanente el item seleccionado. ¿Desea continuar?" Enabled="True" TargetControlID="DeleteButton">
                    </ajaxToolkit:ConfirmButtonExtender>
                    </div>
            </div>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Nueva Masa" CssClass="boton_1" CommandName="AgregarMasa" />
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
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="Ultima" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageText="Ultima" FirstPageText="Primero" />
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
                <asp:Label ID="idbaseLabel" runat="server" Text='<%# Eval("idbase") %>' />
                <br />Nombre:
                <br />
                <asp:Label ID="nombreLabel" Width="200" runat="server" Text='<%# Eval("nombre") %>' />
                <br />Imagen:<br />
                <asp:Image ID="imagenLabel" ImageAlign="Middle" runat="server" Width="180" Height="150" ImageUrl='<%#string.Format("~/Materiales/masas/{0}",Eval("imagen")) %>' />
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
        EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="bases">
    </asp:LinqDataSource>

</asp:Content>
