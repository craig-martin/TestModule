
Describe 'Finding DSC Resources'{
    $dscResources = Get-DscResource -Module TestModule
    
    @(
        'SecondTestClassDscResource'
        'TestClassDscResource'
        'TestMofDscResource'
    ) | ForEach-Object {
        It "$PSItem DSC resource is found" {        
            $dscResources.Name -contains  $PSItem | Should Be True
        
        }
    }
}

Describe 'Invoking DSC Resources Directly'{
    
    It "Invoking Get on TestMofDscResource" {        
        $dscResult = Invoke-DscResource -Name TestMofDscResource -Method Get -ModuleName TestModule -Property @{Key = 'foo'; SomeString = 'hey'; Ensure = 'Present'} -Verbose
        
        $dscResult.key | Should Be 'the key'
    }

    It "Invoking Get on TestClassDscResource" {        
        $dscResult = Invoke-DscResource -Name TestClassDscResource -Method Get -ModuleName TestModule -Property @{Key = 'foo'; SomeString = 'hey'; Ensure = 'Present'} -Verbose
        
        $dscResult.key | Should Be 'the key'
    }

    It "Invoking Get on SecondTestClassDscResource" {        
        $dscResult = Invoke-DscResource -Name SecondTestClassDscResource -Method Get -ModuleName TestModule -Property @{Key = 'foo'; SomeString = 'hey'; Ensure = 'Present'} -Verbose
        
        $dscResult.key | Should Be 'the key'
    }

}

Describe 'Using DSC Resources in the Local Configuration Manager'{
    It 'TestMofDscResource' {
        Configuration ConfigUsingTestMofDscResource 
        { 
            Import-DscResource -ModuleName TestModule

            Node (hostname) 
            { 
                TestMofDscResource sampleTestMofDscResource
                {
                    Key         = 'foo'
                    SomeString  = 'scripted'
                    Ensure      = 'Present'                    
                }
            }
        } 

        ConfigUsingTestMofDscResource -OutputPath "$env:TEMP\ConfigUsingTestMofDscResource"
        Start-DscConfiguration       -Path "$env:TEMP\ConfigUsingTestMofDscResource" -Force -Wait -Verbose 

        Test-DscConfiguration | Should Be True
    }

    It 'TestClassDscResource' {
        Configuration ConfigUsingTestClassDscResource 
        { 
            Import-DscResource -ModuleName TestModule

            Node (hostname) 
            { 
                TestClassDscResource sampleTestClassDscResource
                {
                    Key         = 'foo'
                    SomeString  = 'scripted'
                    Ensure      = 'Present'                    
                }
            }
        } 

        ConfigUsingTestClassDscResource -OutputPath "$env:TEMP\ConfigUsingTestClassDscResource"
        Start-DscConfiguration       -Path "$env:TEMP\ConfigUsingTestClassDscResource" -Force -Wait -Verbose 

        Test-DscConfiguration | Should Be True
    }

    It 'SecondTestClassDscResource' {
        Configuration ConfigUsingSecondTestClassDscResource 
        { 
            Import-DscResource -ModuleName TestModule

            Node (hostname) 
            { 
                SecondTestClassDscResource sampleSecondTestClassDscResource
                {
                    Key         = 'foo'
                    SomeString  = 'scripted'
                    Ensure      = 'Present'                    
                }
            }
        } 

        ConfigUsingSecondTestClassDscResource -OutputPath "$env:TEMP\ConfigUsingSecondTestClassDscResource"
        Start-DscConfiguration       -Path "$env:TEMP\ConfigUsingSecondTestClassDscResource" -Force -Wait -Verbose 

        Test-DscConfiguration | Should Be True
    }
}
