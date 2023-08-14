<%@ Page Title="Layouts" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Layouts.aspx.cs" Inherits="SonunSonu.Layouts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function confirmDelete() {
            return confirm('Are you sure you want to delete this record?');
        }
    </script>
    <div class="center-container">
        <div style="margin: 20px;">
            <h3 class="section-title"></h3>
            <h3 style="text-align: center;">Layouts</h3>
            <div style="overflow-x: auto;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1"
                    DataKeyNames="Oid" EmptyDataText="No records have been added." CssClass="gridview" AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="Oid" HeaderText="ID" ItemStyle-Width="50" InsertVisible="False" ReadOnly="True" SortExpression="Oid" />
                        <asp:BoundField DataField="Code" HeaderText="Code" ItemStyle-Width="100" SortExpression="Code" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-Width="150" SortExpression="Name" />
                        <asp:BoundField DataField="LayoutWidth" HeaderText="Width" ItemStyle-Width="70" SortExpression="LayoutWidth" />
                        <asp:BoundField DataField="LayoutHeight" HeaderText="Height" ItemStyle-Width="70" SortExpression="LayoutHeight" />
                        <asp:TemplateField ItemStyle-Width="160">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit"
                                    CssClass="edit-button" />
                                <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"
                                    CssClass="delete-button" OnClientClick="return confirmDelete();" />
                                <asp:LinkButton ID="lnkGoToLayout" runat="server" CssClass="layout-link" Text="Go to Layout" PostBackUrl='<%# "/Layout.aspx?layoutId=" + Eval("Oid") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update"
                                    CssClass="edit-button" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel"
                                    CssClass="cancel-button" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <style>
                    .layout-link {
                        display: inline-block;
                        padding: 6px 12px;
                        background-color: #2196F3;
                        border-radius: 4px;
                        color: white;
                        text-decoration: none;
                        cursor: pointer;
                    }

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
                <div style="margin-top: 20px; text-align: center;">
                    <h3 class="section-title"></h3>
                    <h3 class="text-center">Add New Layout</h3>

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
                                    ErrorMessage="Code is required." ValidationGroup="AddLayout">*</asp:RequiredFieldValidator>
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
                                    ErrorMessage="Name is required." ValidationGroup="AddLayout">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLayoutWidth" runat="server" CssClass="float-input" Text="Width:" AssociatedControlID="txtLayoutWidth"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLayoutWidth" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvLayoutWidth" runat="server" ControlToValidate="txtLayoutWidth" InitialValue=""
                                    ErrorMessage="Width is required." ValidationGroup="AddLayout">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLayoutHeight" runat="server" Text="Height:" AssociatedControlID="txtLayoutHeight"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLayoutHeight" runat="server" CssClass="form-control" Width="80"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="rfvLayoutHeight" runat="server" ControlToValidate="txtLayoutHeight" InitialValue=""
                                    ErrorMessage="Height is required." ValidationGroup="AddLayout">*</asp:RequiredFieldValidator>
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
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:myProjectDBConnectionString %>'
            SelectCommand="SELECT [Oid], [Code], [Name], [LayoutWidth], [LayoutHeight] FROM [LayoutTable]"
            DeleteCommand="DELETE FROM [LayoutTable] WHERE [Oid] = @Oid"
            InsertCommand="INSERT INTO [LayoutTable] ([Code], [Name], [LayoutWidth], [LayoutHeight]) VALUES (@Code, @Name, @LayoutWidth, @LayoutHeight)"
            UpdateCommand="UPDATE [LayoutTable] SET [Code] = @Code, [Name] = @Name, [LayoutWidth] = @LayoutWidth, [LayoutHeight] = @LayoutHeight WHERE [Oid] = @Oid">
            <DeleteParameters>
                <asp:Parameter Name="Oid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="LayoutWidth" Type="Int32" />
                <asp:Parameter Name="LayoutHeight" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Code" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="LayoutWidth" Type="Int32" />
                <asp:Parameter Name="LayoutHeight" Type="Int32" />
                <asp:Parameter Name="Oid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
