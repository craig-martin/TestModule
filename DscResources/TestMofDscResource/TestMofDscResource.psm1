#Import-Module MimSyncDsc
function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Key
	)
    Write-Verbose "Calling Foo ..."
        
        Get-Foo     

    $outputObject = @{
		Key  = 'the key'
        SomeString         = 'Listen, do you smell somestring?'        
    }

    Write-Output $outputObject
}

function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Key,

		[parameter(Mandatory = $true)]
		[System.String]
		$SomeString,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)
    Write-Warning "You're all set."
}

function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[System.String]
		$Key,

		[parameter(Mandatory = $true)]
		[System.String]
		$SomeString,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)
        Write-Verbose "Calling Foo ..."
        Write-Verbose "$(Get-Foo)"

    
        return $true
}

Export-ModuleMember -Function *-TargetResource