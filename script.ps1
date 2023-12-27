Invoke-Command -ComputerName HC-DC12 -ScriptBlock {
    clear
    $ip = Read-Host -Prompt "Digite o IP"
    
    if ($ip -like "192.168.*") {
    }
    elseif ($ip -like "HC*") {
    }
    else {
        Continue
    }
    
    Get-WmiObject -ComputerName $ip -ClassName win32_ComputerSystem -ErrorAction SilentlyContinue | 
        Format-Table @{Name="Hostname"; Expression={$_.Name}}
    
    Test-Connection -ComputerName $ip -Count 1 -ErrorAction SilentlyContinue | 
        Format-Table @{Name="Endereco IP"; Expression={$_.IPV4Address}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_Baseboard | 
        Format-Table @{Name="PLACA MAE"; Expression={$_.Product}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_Processor | 
        Format-Table @{Name="Processador"; Expression={$_.Name}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_OperatingSystem | 
        Format-Table @{Name="Arquitetura OS"; Expression={$_.OSArchitecture}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_VideoController | 
        Format-Table @{Name="Placa de Video"; Expression={$_.Name}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_PhysicalMemory | 
        Format-Table @{Name="RAM Slot"; Expression={$_.BankLabel}},
                      @{Name="Tamanho (GB)"; Expression={[math]::round($_.Capacity/1GB,0)}}
    
    Get-WmiObject -ComputerName $ip -Class Win32_LogicalDisk | 
        Where-Object { $_.DeviceID -like '*C*' } | 
        Format-Table @{Name="Disco"; Expression={$_.Name}},
                      @{Name="Livre (GB)"; Expression={[math]::round($_.FreeSpace/1GB, 0)}},
                      @{Name="Tamanho (GB)"; Expression={[math]::round($_.Size/1GB, 0)}}
    
    pause
}
