<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v16.1, Version=16.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
            &nbsp;<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1" ClientInstanceName="ASPxPivotGrid1"
                EnableCallBacks="false" OnPreRender="ASPxPivotGrid1_PreRender" OnPopupMenuCreated="ASPxPivotGrid1_PopupMenuCreated">
                <Fields>
                    <dxwpg:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0" FieldName="CategoryName"
                        Visible="false">
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="1" FieldName="ProductName"
                        Visible="false">
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldProductSales" Area="DataArea" AreaIndex="0" FieldName="ProductSales"
                        Visible="false">
                    </dxwpg:PivotGridField>
                    <dxwpg:PivotGridField ID="fieldShippedDate" Area="ColumnArea" AreaIndex="0" FieldName="ShippedDate"
                        Visible="false" GroupInterval="DateYear" UnboundFieldName="fieldShippedDate">
                    </dxwpg:PivotGridField>
                </Fields>
            </dxwpg:ASPxPivotGrid>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT * FROM [ProductReports]"></asp:AccessDataSource>
            <script type="text/javascript">
                ASPxPivotGrid1.getFieldListFields = function () {
                    return ASPxNavBar1.GetMainElement();
                };
            </script>
        </div>
    </form>
</body>
</html>
