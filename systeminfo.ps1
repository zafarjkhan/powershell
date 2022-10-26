#Created comments!
function Get-SystemInfo {
    [CmdletBinding()]
    param (
        [string[]] $ComputerName,
        [string] $ErrorLog
    )
    
    begin {
        Write-Output "Log name is $ErrorLog"    
    }
    
    process {
        foreach ($computer in $ComputerName) {
            $os = Get-WmiObject   -Class Win32_OperatingSystem `
                                  -ComputerName $computer
            $comp = Get-WmiObject -Class Win32_ComputerSystem `
                                  -ComputerName $computer
            $bios = Get-WmiObject -Class Win32_BIOS `
                                  -ComputerName $computer
            $props = @{'ComputerName' = $computer;
                       'OSVersion' = $os.version;
                       'SPVersion' = $os.servicepackmajorversion;
                       'BIOSSerial'= $bios.serialnumber;
                       'Manufactor'= $comp.manufacturer;
                       'Model' = $comp.model}
            $obj = New-Object -TypeName psobject -Property $props
            Write-Output $obj
        }
    }
    
    end {
        
    }
}



Get-SystemInfo -ComputerName localhost,localhost -ErrorLog error.txt