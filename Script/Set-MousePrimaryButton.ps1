function Set-MousePrimaryButton ([bool] $leftHanded) {
	[CMS.Helper]::SwapMouseButtons($leftHanded)
}