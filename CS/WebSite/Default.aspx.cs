using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxPivotGrid;
using System.Collections.Generic;
using DevExpress.Web.ASPxNavBar;
using DevExpress.XtraPivotGrid.Localization;
using DevExpress.Web.ASPxPivotGrid.Html;
using DevExpress.XtraPivotGrid.Data;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {                
    }

    void FillNavBar(List<PivotGridField> hiddenFields) {
        NavBarGroup group0 = ASPxNavBar1.Groups[0];
        group0.Items.Clear();
        for(int i = 0; i < hiddenFields.Count; i++) {
            PivotGridField field = hiddenFields[i];
            NavBarItem item = group0.Items.Add(field.ToString());
            item.DataItem = field;
        }
        group0.ItemTextTemplate = new NavBarItemTemplate(ASPxPivotGrid1);
        group0.Expanded = true;
    }

    List<PivotGridField> GetHiddenFields(ASPxPivotGrid pivotGrid) {
        List<PivotGridField> res = new List<PivotGridField>();
        for(int i = 0; i < pivotGrid.Fields.Count; i++) {
            if(!pivotGrid.Fields[i].Visible)
                res.Add(pivotGrid.Fields[i]);
        }
        return res;
    }
    protected void ASPxPivotGrid1_PreRender(object sender, EventArgs e) {
        List<PivotGridField> hiddenFields = GetHiddenFields(ASPxPivotGrid1);
        FillNavBar(hiddenFields);
    }
    protected void ASPxPivotGrid1_PopupMenuCreated(object sender, PivotPopupMenuCreatedEventArgs e) {
        for(int i = e.Menu.Items.Count - 1; i >= 0; i--) {
            if(e.Menu.Items[i].Text == PivotGridLocalizer.GetString(PivotGridStringId.PopupMenuShowFieldList)) {
                e.Menu.Items.RemoveAt(i);
            }
        }
    }
}

public class NavBarItemTemplate : ITemplate {
    ASPxPivotGrid pivotGrid;

    public NavBarItemTemplate(ASPxPivotGrid pivotGrid) {
        this.pivotGrid = pivotGrid;
    }

    #region ITemplate Members
    public void InstantiateIn(Control container) {
        NavBarItemTemplateContainer c = (NavBarItemTemplateContainer)container;
        PivotGridField field = (PivotGridField)c.Item.DataItem;
        if(field == null) return;

        Table table = new Table();
        ScriptHelper helper = new ScriptHelper(pivotGrid);
        table.ID = helper.GetHeaderID(pivotGrid.Data.GetFieldItem(field));
        table.Attributes.Add("onmousedown", helper.GetHeaderMouseDown());
        TableRow row = new TableRow();
        table.Rows.Add(row);
        TableCell cell = new TableCell();
        row.Cells.Add(cell);
        cell.Text = field.ToString();
        c.Controls.Add(table);
    }
    #endregion
}
