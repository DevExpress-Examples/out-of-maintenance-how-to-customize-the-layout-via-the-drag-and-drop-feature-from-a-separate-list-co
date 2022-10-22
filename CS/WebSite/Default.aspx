<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.11.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dxwpg" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="float: left;">
            <dx:ASPxPanel ID="dxpgCustFieldsFieldList" runat="server">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxNavBar ID="ASPxNavBar1" runat="server" ClientInstanceName="ASPxNavBar1" >
                            <Groups>
                                <dx:NavBarGroup Name="groupFields" Text="Hidden Fields" Expanded="False">
                                </dx:NavBarGroup>
                            </Groups>
                        </dx:ASPxNavBar>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
        </div>
        <div>
            &nbsp;<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="SqlDataSource1" ClientInstanceName="ASPxPivotGrid1"
                EnableCallBacks="False" OnPreRender="ASPxPivotGrid1_PreRender" OnPopupMenuCreated="ASPxPivotGrid1_PopupMenuCreated" ClientIDMode="AutoID" IsMaterialDesign="False">
                <Fields>
                    <dxwpg:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0"
                        Visible="false">
                        <DataBindingSerializable>
                            <dxwpg:DataSourceColumnBinding ColumnName="CategoryName" />
                        </DataBindingSerializable>
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="1"
                        Visible="false">
                        <DataBindingSerializable>
                            <dxwpg:DataSourceColumnBinding ColumnName="ProductName" />
                        </DataBindingSerializable>
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldProductSales" Area="DataArea" AreaIndex="0"
                        Visible="false">
                        <DataBindingSerializable>
                            <dxwpg:DataSourceColumnBinding ColumnName="ProductSales" />
                        </DataBindingSerializable>
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldShippedDate" Area="ColumnArea" AreaIndex="0"
                        Visible="false" GroupInterval="DateYear" UnboundFieldName="fieldShippedDate">
                        <DataBindingSerializable>
                            <dxwpg:DataSourceColumnBinding ColumnName="ShippedDate" GroupInterval="DateYear" />
                        </DataBindingSerializable>
                    </dxwpg:PivotGridField>
                </Fields>
                <OptionsData DataProcessingEngine="Optimized" />
            </dxwpg:ASPxPivotGrid>
            		    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [ProductReports]"></asp:SqlDataSource>
            <script type="text/javascript">
                ASPxPivotGrid1.getFieldListFields = function () {
                    return ASPxNavBar1.GetMainElement();
                };
            </script>
        </div>
    </form>
</body>
</html>
