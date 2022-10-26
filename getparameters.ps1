function Get-Zkparameter {
    [CmdletBinding()]
    param (
        [string[]]$parameters
    )
    
    begin {
        
    }
    
    process {
        foreach ($parameter in $parameters) {
            $output = Get-Command -ParameterName $parameters -ErrorAction SilentlyContinue
            $obj = @{'ParameterName' = $parameter;
                     'ResultCount' = $output.count}
            Write-Output $obj
        }
    }
    
    end {
        
    }
}

Get-Zkparameter -parameters InterfaceIndex
