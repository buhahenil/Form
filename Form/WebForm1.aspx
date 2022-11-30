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
        <asp:Button ID="btnAddnew" runat="server" Text="Addnew" OnClick="btnAddnew_Click" />
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <asp:GridView ID="grvDataDisplay" runat="server" AutoGenerateColumns="False" EmptyDataText="No record found" OnRowCommand="grvDataDisplay_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Pid" HeaderText="Pid">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="FirstName" HeaderText="FirstName">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="MiddleName" HeaderText="MiddleName">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="LastName" HeaderText="LastName">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="MoblieNumber" HeaderText="MoblieNumber">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Address" HeaderText="Address">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Country" HeaderText="Country">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="State" HeaderText="State">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="City" HeaderText="City">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Pincode" HeaderText="Pincode" />

                            <asp:BoundField DataField="DateOfBrith" HeaderText="DateOfBrith" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Gender" HeaderText="Gender">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Hobbies" HeaderText="Hobbies">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="TermsAndConditions">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cblTermsAndConditions" runat="server" CausesValidation="false" Enabled="false" Checked='<%# Convert.ToBoolean((Eval("TermsAndConditions") == DBNull.Value ? 0 : Eval("TermsAndConditions"))) %>' />

                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False" HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="EditRecord" CommandArgument='<%# Eval("Pid") %>'
                                        Text="Edit"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="False" HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" CommandName="DeleteRecord" CommandArgument='<%# Eval("Pid") %>'
                                        Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <br />

        <%-- Form  --%>
        <table border="1">
            <asp:HiddenField ID="hdnPid" runat="server" />
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="LoginFrame"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqFirstName" ControlToValidate="txtFirstName" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ErrorMessage="Enter Firstname" ForeColor="Red"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revFirstName" ValidationGroup="LoginFrame" Display="Dynamic" ValidationExpression="(^[A-Z a-z]*$)"
                        ControlToValidate="txtFirstName" runat="server" ForeColor="Red" ErrorMessage="Enter the Only alphabets"></asp:RegularExpressionValidator>

                    <asp:RegularExpressionValidator ID="rgvFirstName" Display="Dynamic" ControlToValidate="txtFirstName" ValidationGroup="LoginFrame"
                        ValidationExpression="^[\s\S]{0,50}$" runat="server" ForeColor="Red" ErrorMessage="Maximum 50 characters allowed."></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMidd" runat="server" Text="Middle Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMiddleName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revMiddleName" ValidationGroup="LoginFrame" Display="Dynamic" ValidationExpression="(^[A-Z a-z]*$)"
                        ControlToValidate="txtMiddleName" runat="server" ForeColor="Red" ErrorMessage="Enter the Only alphabets"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator ID="rgvMiddleName" Display="Dynamic" ControlToValidate="txtMiddleName" ValidationGroup="LoginFrame"
                        ValidationExpression="^[\s\S]{0,50}$" runat="server" ForeColor="Red" ErrorMessage="Maximum 50 characters allowed."></asp:RegularExpressionValidator>
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
                        runat="server" ForeColor="Red" ErrorMessage="Enter Lastname"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rgvLastName" Display="Dynamic" ControlToValidate="txtLastName" ValidationGroup="LoginFrame"
                        ValidationExpression="^[\s\S]{0,50}$" runat="server" ForeColor="Red" ErrorMessage="Maximum 50 characters allowed."></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMobileNumber" runat="server" Text="Mobile Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMoblieNumber" runat="server" OnTextChanged="txtMoblieNumber_TextChanged" ValidationGroup="LoginFrame" AutoPostBack="true"></asp:TextBox><br />
                </td>

                <td>
                    <asp:RequiredFieldValidator ID="reqMobile" ControlToValidate="txtMoblieNumber" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ForeColor="Red" ErrorMessage="Enter Mobile Number"></asp:RequiredFieldValidator>
                    <asp:Label ID="labMobile" runat="server" ForeColor="Red" Visible="false" Text="Enter the Different number"></asp:Label>

                    <asp:RegularExpressionValidator ID="revMoblieNumber" runat="server" ErrorMessage="Enetr the Only Number" ControlToValidate="txtMoblieNumber"
                        ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ForeColor="Red" ValidationGroup="LoginFrame" Display="Dynamic">
                    </asp:RegularExpressionValidator>
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
                        runat="server" ForeColor="Red" ErrorMessage="Enter Address"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="regAddress" Display="Dynamic" ControlToValidate="txtAddress" ValidationGroup="LoginFrame"
                        ValidationExpression="^[\s\S]{0,}$" runat="server" ForeColor="Red" ErrorMessage="Maximum 200 characters allowed."></asp:RegularExpressionValidator>
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
                        runat="server" ForeColor="Red" ErrorMessage="Select Country" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        runat="server" ForeColor="Red" ErrorMessage="Select State" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
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
                        runat="server" ForeColor="Red" ErrorMessage="Select City" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblPincode" runat="server" Text="Pin Code"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPincode" runat="server" OnTextChanged="txtPincode_TextChanged"></asp:TextBox><br />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqPincode" ControlToValidate="txtPincode" ValidationGroup="LoginFrame"
                        runat="server" ForeColor="Red" ErrorMessage="Enter Pin Code" Enabled="true" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="revPincode" runat="server" ErrorMessage="Enetr only 6 Digit" ControlToValidate="txtPincode"
                        ValidationExpression="^[1-9][0-9]{5}$" ForeColor="Red" ValidationGroup="LoginFrame" Display="Dynamic">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblDate" runat="server" Text="Date Of Brith"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" placeholder="mm/dd/yyyy" TextMode="Date" ReadOnly="false" ValidationGroup="LoginFrame" OnTextChanged="txtDate_TextChanged" AutoPostBack="true"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="ReqDate" ControlToValidate="txtDate" Display="Dynamic" ValidationGroup="LoginFrame"
                        runat="server" ForeColor="Red" ErrorMessage="Enter Date"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblAge18" runat="server" ForeColor="Red" Visible="false" Text="Age should be more than 18."></asp:Label>
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
                        runat="server" ForeColor="Red" ErrorMessage="Select Gender"></asp:RequiredFieldValidator>
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
                <td>
                    <asp:CustomValidator runat="server" ID="CheckBoxRequired" OnServerValidate="cblHobbies_SelectedIndexChanged" Display="Dynamic" ValidationGroup="LoginFrame"></asp:CustomValidator>

                    <asp:Label ID="lblHobbie" runat="server" ForeColor="Red" Visible="false" Text="Minimun 3 Selected" AutoPostBack="True"></asp:Label>
                </td>
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
                    <asp:Button ID="btnUpDate" runat="server" Text="Update" OnClick="btnUpDate_Click" Style="height: 26px" ValidationGroup="LoginFrame" />
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
