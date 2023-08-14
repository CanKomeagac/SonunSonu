<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="SonunSonu.Layout" %>

<%@ Register Assembly="DevExpress.Web.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxDiagram.v23.1, Version=23.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDiagram" TagPrefix="dx" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />

    <script type="text/javascript">

        function ItemDblClick(s, e) {
            itemId = e.item.key;
            $('#<%= HiddenField1.ClientID %>').val(itemId);
            __doPostBack('<%= HiddenField1.ClientID %>', '');;

        }

        function OnInsert(s, e) {
            if (e.items && e.items.length > 0) {
                var itemName = e.items[0].text;
                var toolboxItem = e.items[0].tool;


                if (toolboxItem && toolboxItem.containerId === 'Machines') {
                    $('#<%= HiddenField2.ClientID %>').val(itemName);
                    __doPostBack('<%= HiddenField2.ClientID %>', '');
                }
            }
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script.js"></script>

    <div style="display: flex; flex-direction: row;">
        <div style="flex: 1;">
            <dx:ASPxDiagram ID="Diagram" runat="server" Width="100%" Height="600px"
                NodeDataSourceID="SqlDataSource2"
                OnNodeInserted="ASPxDiagram1_ItemInserted" Units="Px" SimpleView="True">
                <SettingsPage Width="21" Height="29.7" Orientation="Landscape" />
                <DefaultItemProperties Style="stroke:#ff0000" />
                <ClientSideEvents ItemDblClick="ItemDblClick" SelectionChanged="OnInsert"></ClientSideEvents>
                <Mappings>
                    <Node Key="ID" Type="Type" Height="Height" Width="Width" Text="Name" Top="PositionY" Left="PositionX" ImageUrl="PhotoUrl" Style="Style" />
                </Mappings>
                <SettingsToolbox>
                    <Groups>
                        <dx:DiagramToolboxGroup Category="Custom" CustomCategoryName="CategoryMachines" Title="Machines" DisplayMode="Texts" />
                    </Groups>
                </SettingsToolbox>
                <SettingsContextToolbox DisplayMode="Texts" />
            </dx:ASPxDiagram>


            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:myProjectDBConnectionString %>'
                SelectCommand="SELECT * FROM [Table_1] WHERE ([LayoutOid] = @LayoutOid) SELECT [LayoutWidth], [LayoutHeight] FROM [LayoutTable] WHERE ([Oid] = @LayoutOid) "
                DeleteCommand="DELETE FROM [Table_1] WHERE ([ID] = @ID)"
                UpdateCommand="UPDATE [Table_1] SET [Width] = @Width, [Height] = @Height,[PositionX] = @PositionX, [PositionY] = @PositionY WHERE ([ID] = @ID)"
                InsertCommand="UPDATE [Table_1] SET [LayoutOid] = @LayoutOidd, [RunningStatus] = 0, [Style] = 'stroke:#ff0000' WHERE ([Name] = @Name)">
                <DeleteParameters>
                    <asp:ControlParameter Name="ID" ControlID="HiddenField1" PropertyName="Value" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LayoutOid" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="ID" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="LayoutOid" Type="Int32"></asp:Parameter>
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Width"></asp:Parameter>
                    <asp:Parameter Name="Height"></asp:Parameter>
                    <asp:Parameter Name="PositionX"></asp:Parameter>
                    <asp:Parameter Name="PositionY"></asp:Parameter>
                    <asp:ControlParameter Name="ID" ControlID="HiddenField1" PropertyName="Value" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter Name="Name" ControlID="HiddenField2" PropertyName="Value" />
                    <asp:Parameter Name="LayoutOidd" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <div style="flex: 1; padding: 20px;">

            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" DataSourceID="SqlDataSource1" Theme="Moderno" EnableTheming="True">
                <Items>
                    <dx:LayoutItem FieldName="Code" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="170px" ID="ASPxFormLayout1_E1" CssClass="form-control"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Name" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxTextBox runat="server" Width="170px" ID="ASPxFormLayout1_E2" CssClass="form-control"></dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Info1" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo runat="server" Width="100%" Rows="8" CssClass="form-control" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem FieldName="Info2" ColSpan="1">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server">
                                <dx:ASPxMemo runat="server" Width="100%" Rows="8" CssClass="form-control" />
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>

                <SettingsItemCaptions Location="Top" />
            </dx:ASPxFormLayout>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:myProjectDBConnectionString %>' SelectCommand="SELECT [Code], [Name], [Info1], [Info2], [ID] FROM [Table_1] WHERE ([ID] = @ID)" DeleteCommand="DELETE FROM [Table_1] WHERE [ID] = @ID" InsertCommand="INSERT INTO [Table_1] ([Code], [Name], [Info1], [Info2]) VALUES (@Code, @Name, @Info1, @Info2)" UpdateCommand="UPDATE [Table_1] SET [Code] = @Code, [Name] = @Name, [Info1] = @Info1, [Info2] = @Info2 WHERE [ID] = @ID">
                <SelectParameters>
                    <asp:ControlParameter Name="ID" ControlID="HiddenField1" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
