function Add-CMSTypeDefinition {
	$cms = Get-Content $PSScriptRoot/CMS.cs -Raw
			
	Add-Type -IgnoreWarnings -TypeDefinition $cms
}
