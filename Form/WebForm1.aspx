<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Form.WebForm1" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.6.1.js"></script>
    <script type="text/javascript"></script>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grvDataDisplay" runat="server" AutoGenerateColumns="False" EmptyDataText="No record found" OnRowCommand="grvDataDisplay_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Pid" HeaderText="Pid" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                            <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" />
                            <asp:BoundField DataField="MoblieNumber" HeaderText="MoblieNumber" />
                            <asp:BoundField DataField="Address" HeaderText="Address" />
                            <asp:BoundField DataField="Country" HeaderText="Country" />
                            <asp:BoundField DataField="State" HeaderText="State" />
                            <asp:BoundField DataField="City" HeaderText="City" />
                            <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                            <asp:BoundField DataField="DateOfBrith" HeaderText="DateOfBrith" DataFormatString="{0:MM/dd/yyyy}"/>
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="Hobbies" HeaderText="Hobbies" />
                            
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="EditRecord" CommandArgument='<%# Eval("Pid") %>'
                                        Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <table border="1">
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="LoginFrame"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter Fname"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revFirstName" ValidationGroup="LoginFrame" Display="Dynamic" ValidationExpression="(^[A-Z a-z]*$)"
                        ControlToValidate="txtFirstName" runat="server" ErrorMessage="Enter the Only alphabets"></asp:RegularExpressionValidator>
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
                    <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="LoginFrame"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqLastName" ControlToValidate="txtLastName" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter Lastname"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMoblieNumber" runat="server" OnTextChanged="txtMoblieNumber_TextChanged" ValidationGroup="LoginFrame"></asp:TextBox><br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqMoblieNumber" ControlToValidate="txtMoblieNumber" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter MoblieNumber"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ValidationGroup="LoginFrame"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqAddress" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>Country</td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged1" DataTextField="CountryName" DataValueField="CountryId">
                        <asp:ListItem Value="0" ValidationGroup="LoginFrame">--Select Country--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqCountry" ControlToValidate="ddlCountry" ValidationGroup="LoginFrame" InitialValue="0"
                        runat="server" ErrorMessage="Select Country" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>

            </tr>

            <tr>
                <td>State</td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged1">
                        <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqState" ControlToValidate="ddlState" ValidationGroup="LoginFrame" InitialValue="0"
                        runat="server" ErrorMessage="Select State" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>City</td>
                <td>
                    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true">
                        <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqCity" ControlToValidate="ddlCity" ValidationGroup="LoginFrame" InitialValue="0"
                        runat="server" ErrorMessage="Select City" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
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
                    <asp:TextBox ID="txtDate" runat="server" placeholder="mm/dd/yyyy" TextMode="Date" ReadOnly="false" ValidationGroup="LoginFrame" OnTextChanged="txtDate_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqDate" ControlToValidate="txtDate" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter Date"></asp:RequiredFieldValidator>
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
                <td>
                    <asp:RequiredFieldValidator ID="ReqGender" ControlToValidate="rblGender" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Select Gender"></asp:RequiredFieldValidator>
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
                <%--<td>
                    <asp:RequiredFieldValidator ID="ReqHobbies" ControlToValidate="cblHobbies" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Select min 3" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>--%>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:CheckBox ID="chkIsTermsAccept" runat="server" Text="I Agree with this from" OnCheckedChanged="chkIsTermsAccept_CheckedChanged"
                        AutoPostBack="true" />
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center; align-items: center; align-content: center; align-self: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Sumbit" OnClick="btnSubmit_Click" Style="height: 26px" ValidationGroup="LoginFrame" />
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
