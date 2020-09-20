Describe "Module" {
    It "Import Module" {
        try
        {
            Import-Module (Join-Path $PSScriptRoot Bca.Test.psd1) -Force
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
    }
    
    It "Command Check" {
        $Commands = Get-Command -Module Bca.Test
        $Commands.Count | Should -BeGreaterThan 0
    }
}

Describe "Functions" {
    It "Get-Test" {
        try
        {
            $Test = Get-Test
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should -Be $true
        $Test | Should -BeExactly "Test"
    }
}
