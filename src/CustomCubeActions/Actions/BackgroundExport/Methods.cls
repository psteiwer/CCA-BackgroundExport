Class CustomCubeActions.Actions.BackgroundExport.Methods
{

ClassMethod ExportToExcel(pAction, ByRef pContext) As %Status
{
    Set tSC=$$$OK

    Set tFilters=pContext.filters
    Set tFilterNames=""
    Set tFilterValues=""
    Set tFilter=$O(tFilters.%data(""))
    While tFilter'="" {
        // TODO: Transform spec and key into display values
        Set tFilterNames=tFilterNames_$select(tFilterNames'="":$C(10),1:"")_tFilter
        Set tFilterValues=tFilterValues_$select(tFilterValues'="":$C(10),1:"")_tFilters.%data(tFilter)
        Set tFilter=$O(tFilters.%data(tFilter))
    }

    Set tFile=pContext.cubeName_$h_".xls"
    Set tFilterNames=##class(%DeepSee.Utils).%CreateParameterNonce(tFilterNames)
    Set tFilterValues=##class(%DeepSee.Utils).%CreateParameterNonce(tFilterValues)

    Job ##class(CustomCubeActions.Actions.BackgroundExport.Methods).ExportToExcelInternal(tFile,pContext.mdx,tFilterNames,tFilterValues)

    Quit tSC
}

ClassMethod ExportToExcelInternal(pFile, pMDX, pFilterNames, pFilterValues) As %Status
{
    Set tSC=$$$OK

    Set tParms("MDX")=pMDX
    Set tParms("FILTERNAMES")=pFilterNames
    Set tParms("FILTERVALUES")=pFilterValues
    Set tParms("SHOWDATE")=1
    Set tSC=##class(%DeepSee.Utils).%ExportExcelToFile(pFile,.tParms)

    Quit tSC
}

ClassMethod ExportToPDF(pAction, ByRef pContext) As %Status
{
    Set tSC=$$$OK

    Set tFilters=pContext.filters
    Set tFilterNames=""
    Set tFilterValues=""
    Set tFilter=$O(tFilters.%data(""))
    While tFilter'="" {
        // TODO: Transform spec and key into display values
        Set tFilterNames=tFilterNames_$select(tFilterNames'="":$C(10),1:"")_tFilter
        Set tFilterValues=tFilterValues_$select(tFilterValues'="":$C(10),1:"")_tFilters.%data(tFilter)
        Set tFilter=$O(tFilters.%data(tFilter))
    }

    Set tFile=pContext.cubeName_$h_".pdf"
    Set tFilterNames=##class(%DeepSee.Utils).%CreateParameterNonce(tFilterNames)
    Set tFilterValues=##class(%DeepSee.Utils).%CreateParameterNonce(tFilterValues)

    Job ##class(CustomCubeActions.Actions.BackgroundExport.Methods).ExportToPDFInternal(tFile,pContext.mdx,tFilterNames,tFilterValues)

    Quit tSC
}

ClassMethod ExportToPDFInternal(pFile, pMDX, pFilterNames, pFilterValues) As %Status
{
    Set tSC=$$$OK

    Set tParms("MDX")=pMDX
    Set tParms("FILTERNAMES")=pFilterNames
    Set tParms("FILTERVALUES")=pFilterValues
    Set tSC=##class(%DeepSee.Utils).%ExportPDFToFile(pFile,.tParms)

    Quit tSC
}

}
