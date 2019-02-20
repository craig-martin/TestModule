
enum Ensure
{
    Absent
    Present
}

[DscResource()]
class SecondTestClassDscResource
{
    [DscProperty(Key)]
    [string]$Key

    [DscProperty(Mandatory)]
    [Ensure] $Ensure

    [DscProperty()]
    [String] $SomeString    

    [SecondTestClassDscResource] Get()
    {
        ### Call some function
        Write-Verbose "Calling Foo from foo.psm1 this time ..."
        Get-Foo     

        $this.Key        = 'the key'
        $this.SomeString = 'the string'        
        $this.Ensure     = [Ensure]::Present        

        return $this
    }

    [void] Set()
    {
        Write-Warning "You're all set"
    }

    [bool] Test()
    {
        ### Call some function
        Write-Verbose "Calling Foo ..."
        Get-Foo     

        return $true
    }
}