function Add-CDSTypeDefinition {
	$cds = Get-Content $PSScriptRoot/CDS.cs -Raw
			
	Add-Type -TypeDefinition $cds
}
