Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Collections.Generic
Imports DevExpress.Web.ASPxNavBar
Imports DevExpress.XtraPivotGrid.Localization
Imports DevExpress.Web.ASPxPivotGrid.Html
Imports DevExpress.XtraPivotGrid.Data

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub

	Private Sub FillNavBar(ByVal hiddenFields As List(Of PivotGridField))
		Dim group0 As NavBarGroup = ASPxNavBar1.Groups(0)
		group0.Items.Clear()
		For i As Integer = 0 To hiddenFields.Count - 1
			Dim field As PivotGridField = hiddenFields(i)
			Dim item As NavBarItem = group0.Items.Add(field.ToString())
			item.DataItem = field
		Next i
		group0.ItemTextTemplate = New NavBarItemTemplate(ASPxPivotGrid1)
		group0.Expanded = True
	End Sub

	Private Function GetHiddenFields(ByVal pivotGrid As ASPxPivotGrid) As List(Of PivotGridField)
		Dim res As New List(Of PivotGridField)()
		For i As Integer = 0 To pivotGrid.Fields.Count - 1
			If (Not pivotGrid.Fields(i).Visible) Then
				res.Add(pivotGrid.Fields(i))
			End If
		Next i
		Return res
	End Function
	Protected Sub ASPxPivotGrid1_PreRender(ByVal sender As Object, ByVal e As EventArgs)
		Dim hiddenFields As List(Of PivotGridField) = GetHiddenFields(ASPxPivotGrid1)
		FillNavBar(hiddenFields)
	End Sub
	Protected Sub ASPxPivotGrid1_PopupMenuCreated(ByVal sender As Object, ByVal e As PivotPopupMenuCreatedEventArgs)
		For i As Integer = e.Menu.Items.Count - 1 To 0 Step -1
			If e.Menu.Items(i).Text = PivotGridLocalizer.GetString(PivotGridStringId.PopupMenuShowFieldList) Then
				e.Menu.Items.RemoveAt(i)
			End If
		Next i
	End Sub
End Class

Public Class NavBarItemTemplate
	Implements ITemplate
	Private pivotGrid As ASPxPivotGrid

	Public Sub New(ByVal pivotGrid As ASPxPivotGrid)
		Me.pivotGrid = pivotGrid
	End Sub

	#Region "ITemplate Members"
	Public Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
		Dim c As NavBarItemTemplateContainer = CType(container, NavBarItemTemplateContainer)
		Dim field As PivotGridField = CType(c.Item.DataItem, PivotGridField)
		If field Is Nothing Then
			Return
		End If
		Dim table As New Table()
		Dim helper As New ScriptHelper(pivotGrid)
		table.ID = helper.GetHeaderID(pivotGrid.Data.GetFieldItem(field))
		table.ClientIDMode = ClientIDMode.AutoID
		table.Attributes.Add("onmousedown", helper.GetHeaderMouseDown())
		Dim row As New TableRow()
		table.Rows.Add(row)
		Dim cell As New TableCell()
		row.Cells.Add(cell)
		cell.Text = field.ToString()
		c.Controls.Add(table)
	End Sub
	#End Region
End Class
