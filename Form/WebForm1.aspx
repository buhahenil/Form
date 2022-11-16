﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Form.WebForm1" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.6.1.js"></script>
    <script type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table border="1">
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMidd" runat="server" Text="Middle Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMiddleName" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMoblieNumber" runat="server" OnTextChanged="txtMoblieNumber_TextChanged"></asp:TextBox><br />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address" meta:resourcekey="Label5Resource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Country</td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server" OnSelectedIndexChanged="Country_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select Country--</asp:ListItem>  
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>State</td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" OnSelectedIndexChanged="State_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select Country--</asp:ListItem>  
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>City</td>
                <td>
                    <asp:DropDownList ID="ddlCity" runat="server" OnSelectedIndexChanged="City_SelectedIndexChanged">
                        <asp:ListItem Value="0">--Select Country--</asp:ListItem>  
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblPincode" runat="server" Text="Pin Code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPincode" runat="server" OnTextChanged="txtPincode_TextChanged"></asp:TextBox><br />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date Of Brith"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" placeholder="mm/dd/yyyy" TextMode="Date" ReadOnly="false" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblGender_SelectedIndexChanged">
                        <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                    </asp:RadioButtonList>

                </td>
            </tr>

            <tr>
                <td aria-orientation="vertical">
                    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
                </td>
                <td>
                    <asp:CheckBoxList ID="cblHobbies" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" OnSelectedIndexChanged="cblHobbies_SelectedIndexChanged">
                        <asp:ListItem>Cricket</asp:ListItem>
                        <asp:ListItem>Volleyball</asp:ListItem>
                        <asp:ListItem>Movies</asp:ListItem>
                        <asp:ListItem>Serial</asp:ListItem>
                        <asp:ListItem>Football</asp:ListItem>
                        <asp:ListItem>Reading</asp:ListItem>
                        <asp:ListItem>Writing</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:CheckBox ID="chkIsTermsAccept" runat="server" Text="I Agree with this from" OnCheckedChanged="chkIsTermsAccept_CheckedChanged" AutoPostBack="true" />
                </td>

            </tr>

            <tr>
                <td colspan="2" style="text-align: center; align-items: center; align-content: center; align-self: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Sumbit" OnClick="btnSubmit_Click" Style="height: 26px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
