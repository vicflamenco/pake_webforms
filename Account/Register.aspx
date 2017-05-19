<%@ Page Title="Registrarse" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Account.Register" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<%--    <asp:CreateUserWizard ID="RegisterUser" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" >
                <ContentTemplate>--%>
    <div style="border: solid 1.5px #00589a; width:280px; height:auto; margin:0px auto; padding:10px; border-radius:10px; ">
                    <table>
                        <tr>
                            <td align="center" colspan="2" style="font-size:16px; font-weight:bold;">Registra tu nueva cuenta</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Usuario:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Usuario Requerido" ToolTip="Usuario Requerido">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Clave:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es requerida" ToolTip="La contraseña es requerida" >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirmar Clave:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="La confirmación es requerida." ToolTip="La confirmación es requerida." >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." >*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Las contraseñas no coinciden." ></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Label ID="ErrorMessage1" runat="server" EnableViewState="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnRegistrar" Text="Registrar" OnClick="btnRegistrar_Click"/>
                            </td>
                        </tr>
                    </table>
        </div>
<%--                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>--%>
</asp:Content>
