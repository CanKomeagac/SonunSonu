<%@ Page Title="Machines" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Machines.aspx.cs" Inherits="SonunSonu.Machines" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="margin: 20px; text-align: center;">
        <script type="text/javascript">
            // Bu işlev, yalnızca float değerlerini kabul eder
            function validateFloatInput(input) {
                var floatValue = parseFloat(input.value);
                if (isNaN(floatValue)) {
                    alert("Please enter a valid float number.");
                    input.value = "";
                }
            }

            // Sayfa yüklendiğinde çalışacak kod
            window.onload = function () {
                var floatInputs = document.getElementsByClassName("float-input");
                for (var i = 0; i < floatInputs.length; i++) {
                    floatInputs[i].addEventListener("blur", function () {
                        validateFloatInput(this);
                    });
                }
            };
        </script>

        <h3 class="section-title"></h3>
        <h3 style="text-align: center;">Machines</h3>
        <div style="overflow-x: auto;">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource2"
                DataKeyNames="ID" EmptyDataText="No records have been added." CssClass="gridview" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="50" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" ItemStyle-Width="30"></asp:BoundField>
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" ItemStyle-Width="30"></asp:BoundField>
                    <asp:BoundField DataField="Info1" HeaderText="Info1" SortExpression="Info1"></asp:BoundField>
                    <asp:BoundField DataField="Info2" HeaderText="Info2" SortExpression="Info2"></asp:BoundField>
                    <asp:BoundField DataField="PositionX" HeaderText="PositionX" SortExpression="PositionX" ItemStyle-Width="30"></asp:BoundField>
                    <asp:BoundField DataField="PositionY" HeaderText="PositionY" SortExpression="PositionY" ItemStyle-Width="30"></asp:BoundField>
                    <asp:BoundField DataField="PhotoUrl" HeaderText="PhotoUrl" SortExpression="PhotoUrl"></asp:BoundField>
                    <asp:BoundField DataField="LayoutOid" HeaderText="LayoutOid" SortExpression="LayoutOid"></asp:BoundField>
                    <asp:CheckBoxField DataField="RunningStatus" HeaderText="RunningStatus" SortExpression="RunningStatus" ItemStyle-Width="30"></asp:CheckBoxField>
                    <asp:TemplateField ItemStyle-Width="133">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit"
                                CssClass="edit-button" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                CssClass="delete-button" OnClientClick="return confirmDelete();" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update"
                                CssClass="edit-button"/>
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel"
                                CssClass="cancel-button" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <script type="text/javascript">
            function confirmDelete() {
                return confirm('Are you sure you want to delete this record?');
            }
        </script>
        <style>
            .section-title {
                border-bottom: 2px solid #ccc;
                margin-bottom: 15px;
                padding-bottom: 5px;
            }

            .cancel-button {
                background-color: #f44336;
                color: white;
                border: none;
                padding: 4px 8px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 12px;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 5px;
            }

            .update-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 4px 8px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 12px;
                border-radius: 4px;
                cursor: pointer;
            }

            .error-message {
                color: red;
                font-weight: bold;
                margin-top: 10px;
            }

            .gridview {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

                .gridview th,
                .gridview td {
                    border: 1px solid #ddd;
                    padding: 8px;
                    text-align: left;
                    word-wrap: break-word;
                }

                .gridview th {
                    background-color: #e6e6e6;
                    color: #000;
                    text-align: center;
                    vertical-align: middle;
                    text-decoration: none;
                    border-bottom: none;
                }

            .edit-button {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 6px 12px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                border-radius: 4px;
                cursor: pointer;
            }

                .edit-button:hover {
                    background-color: #45a049;
                }


            .delete-button {
                background-color: #f44336;
                color: white;
                border: none;
                padding: 6px 12px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                border-radius: 4px;
                cursor: pointer;
            }

                .delete-button:hover {
                    background-color: #d32f2f;
                }

            .add-button {
                background-color: #2196F3;
                color: white;
                border: none;
                padding: 8px 16px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 4px;
                cursor: pointer;
            }

                .add-button:hover {
                    background-color: #1976D2;
                }
        </style>

        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:myProjectDBConnectionString %>'
            DeleteCommand="DELETE FROM [Table_1] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Table_1] ([Code], [Name], [Width], [Height], [Info1], [Info2], [Style], [PositionX], [PositionY], [PhotoUrl], [LayoutOid], [RunningStatus]) VALUES (@Code, @Name, @Width, @Height, @Info1, @Info2, @Style, @PositionX, @PositionY, @PhotoUrl, @LayoutOid, @RunningStatus)"
            SelectCommand="SELECT [ID], [Code], [Name], [Width], [Height], [Info1], [Info2], [Style], [PositionX], [PositionY], [PhotoUrl], [LayoutOid], [RunningStatus] FROM [Table_1]"
            UpdateCommand="UPDATE [Table_1] SET [Code] = @Code, [Name] = @Name, [Width] = @Width, [Height] = @Height, [Info1] = @Info1, [Info2] = @Info2, [Style] = @Style, [PositionX] = @PositionX, [PositionY] = @PositionY, [PhotoUrl] = @PhotoUrl, [LayoutOid] = @LayoutOid, [RunningStatus] = @RunningStatus WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Width" Type="Int32" />
                <asp:Parameter Name="Height" Type="Int32" />
                <asp:Parameter Name="Info1" Type="String"></asp:Parameter>
                <asp:Parameter Name="Info2" Type="String"></asp:Parameter>
                <asp:Parameter Name="Style" Type="String"></asp:Parameter>
                <asp:Parameter Name="PositionX" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PositionY" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PhotoUrl" Type="String"></asp:Parameter>
                <asp:Parameter Name="LayoutOid" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="RunningStatus" Type="Boolean"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Width" Type="Int32" />
                <asp:Parameter Name="Height" Type="Int32" />
                <asp:Parameter Name="Info1" Type="String"></asp:Parameter>
                <asp:Parameter Name="Info2" Type="String"></asp:Parameter>
                <asp:Parameter Name="Style" Type="String"></asp:Parameter>
                <asp:Parameter Name="PositionX" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PositionY" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="PhotoUrl" Type="String"></asp:Parameter>
                <asp:Parameter Name="LayoutOid" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="RunningStatus" Type="Boolean"></asp:Parameter>
                <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>

        <div style="margin-top: 20px; text-align: center;">
            <h3 class="section-title"></h3>
            <h3 class="text-center">Add New Machine</h3>

            <div style="text-align: center;">
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="error-message" Visible="false"></asp:Label>
            </div>
            <table border="0" cellpadding="5" cellspacing="0" style="margin: 0 auto;">
                <tr>
                    <td>
                        <asp:Label ID="lblCode" runat="server" Text="Code:" AssociatedControlID="txtCode"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode" InitialValue=""
                            ErrorMessage="Code is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" InitialValue=""
                            ErrorMessage="Name is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblWidth" runat="server" CssClass="float-input" Text="Width:" AssociatedControlID="txtWidth"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWidth" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvWidth" runat="server" ControlToValidate="txtWidth" InitialValue=""
                            ErrorMessage="Width is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblHeight" runat="server" Text="Height:" AssociatedControlID="txtHeight"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtHeight" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvHeight" runat="server" ControlToValidate="txtHeight" InitialValue=""
                            ErrorMessage="Height is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInfo1" runat="server" Text="Info1:" AssociatedControlID="txtInfo1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtInfo1" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblInfo2" runat="server" Text="Info2:" AssociatedControlID="txtInfo2"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtInfo2" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPositionX" runat="server" Text="PositionX:" AssociatedControlID="txtPositionX"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPositionX" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPositionX" runat="server" ControlToValidate="txtPositionX" InitialValue=""
                            ErrorMessage="PositionX is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPositionY" runat="server" Text="PositionY:" AssociatedControlID="txtPositionY"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPositionY" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPositionY" runat="server" ControlToValidate="txtPositionY" InitialValue=""
                            ErrorMessage="PositionY is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPhotoUrl" runat="server" Text="Photo:" AssociatedControlID="ddlPhoto" OnLoad="PopulateDropDownList"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPhoto" runat="server" CssClass="form-control" DataTextField="Name">
                            <asp:ListItem Text="-- Select Photo --" Value="" />
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblRunningStatus" runat="server" Text="Running Status:" AssociatedControlID="chkRunningStatus"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="chkRunningStatus" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLayoutOid" runat="server" Text="Layout:" AssociatedControlID="ddlLayout"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLayout" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="Oid">
                            <asp:ListItem Text="-- Select Layout --" Value="" />
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlLayout" InitialValue=""
                            ErrorMessage="Layout ID is required." ValidationGroup="AddMachine">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" CssClass="add-button" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
