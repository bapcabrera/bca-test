try
{
    # Importing Localized Data if present (fallback to en-US)
    if (Test-Path (Join-Path $PSScriptRoot LocalizedData))
    {
        $global:LocalizedData = Import-LocalizedData -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) -ErrorAction SilentlyContinue
        if (!$?) { $global:LocalizedData = Import-LocalizedData -UICulture en-US -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) }
    }

    # Gets public and private function definition files.
    $Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
    $Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

    # Dot source the files
    foreach ($File in @($Public + $Private))
    {
        try
        {
            . $File.FullName
        }
        catch
        {
            Write-Error $_
        }
    }

    Export-ModuleMember -Function $Public.BaseName -Variable * -Alias *
}
catch 
{
    Write-Error $_
}