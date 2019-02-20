function Get-Foo
{
    Write-Verbose "I'm the foo"
    Write-Output "foo"
}

Export-ModuleMember -Function *