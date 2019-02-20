
enum Ensure
{
    Absent
    Present
}

[DscResource()]
class TestClassDscResource
{
    [DscProperty(Key)]
    [string]$Key

    [DscProperty(Mandatory)]
    [Ensure] $Ensure

    [DscProperty()]
    [String] $SomeString

    #TestClassDscResource(){Import-Module TestModule}

    [TestClassDscResource] Get()
    {
        ### Call some function
        Write-Verbose "Calling Foo ..."
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