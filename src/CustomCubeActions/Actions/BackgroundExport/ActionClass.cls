Class CustomCubeActions.Actions.BackgroundExport.ActionClass Extends %DeepSee.KPI [ Language = objectscript ]
{

XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi
xmlns="http://www.intersystems.com/deepsee/kpi"
 name="BackgroundExport">
<action name="ExportToExcel"/>
<action name="ExportToPDF"/>
</kpi>
}

ClassMethod %OnDashboardAction(pAction As %String, pContext As %ZEN.proxyObject) As %Status
{
	Set tSC=$$$OK

    If pAction="ExportToExcel" {
        Set tSC=##class(CustomCubeActions.Actions.BackgroundExport.Methods).ExportToExcel(pAction,.pContext)
    } ElseIf pAction="ExportToPDF" {
        Set tSC=##class(CustomCubeActions.Actions.BackgroundExport.Methods).ExportToPDF(pAction,.pContext)
    }

	Quit tSC
}

}
