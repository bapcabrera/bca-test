function Get-Test
{
    <#
    .SYNOPSIS
        Gets a message.
    .DESCRIPTION
        Gets a message.
    .PARAMETER Message
        A string containing the message.
    .EXAMPLE
        Get-Message -Message "My message"

        Description
        -----------
        This example will gets "My message".
    .OUTPUTS
        System.String
        Returns a string containing the message.
    .NOTES
        This is a test function.
    #>
    [CmdletBinding()]
    param (
        [Parameter(ParameterSetName = "FromMessage", Mandatory = $false)]
        [string] $Message = "Test"
    )

    return $Message
}