# Get-Test

Type: Function

Module: [Bca.Test](../ReadMe.md)

Gets a message.
## Description
Gets a message.
## Syntax
### FromMessage
```powershell
Get-Test [-Message <string>] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Get-Message -Message "My message"
```
This example will gets "My message".
## Parameters
### `-Message`
A string containing the message.

| | |
|:-|:-|
|Type:|String|
|Default value:|Test|
|Parameter sets:|FromMessage|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

## Outputs
**System.String**

Returns a string containing the message.
## Notes
This is a test function.
