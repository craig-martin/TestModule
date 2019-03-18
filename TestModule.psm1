
function Get-Foo
{
    Write-Verbose "I'm the foo"
    Write-Output "foo"

    [Device]::Find()
}

<#
#Get function definition files.
$Public = @(Get-ChildItem -Path $PSScriptRoot\Functions\*.ps1 -ErrorAction SilentlyContinue)

#Dot source the files
Foreach ($import in @($Public))
{
	Try {
		. $import.fullname
	} Catch {
		Write-Error -Message "Failed to import function $($import.fullname): $_"
	}
}

# Export all the functions
Export-ModuleMember -Function $Public.Basename -Alias *
#>

class Device {
    [string]$Brand
    [string]$Model
    [string]$VendorSku

    [string]ToString(){
        return ("{0}|{1}|{2}" -f $this.Brand, $this.Model, $this.VendorSku)
    }

    static [void]Find(){write-host "Lost."}
}