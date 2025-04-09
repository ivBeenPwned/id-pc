Function Get-Specifications {
    
    Get-WmiObject -ClassName win32_ComputerSystem -ErrorAction SilentlyContinue | 
        Format-Table @{Name="Hostname"; Expression={$_.Name}},
                      @{Name="Fabricante"; Expression={$_.Manufacturer}}
    
    Get-WmiObject -Class Win32_Baseboard | 
        Format-Table @{Name="Placa Mae"; Expression={$_.Product}},
                      @{Name="Serial"; Expression={$_.SerialNumber}},
                       @{Name="Capacidade Máxima de RAM"; Expression={[math]::round((Get-WmiObject -Class Win32_PhysicalMemoryArray).MaxCapacity/1MB,0)}},
                        @{Name="Quantidade de Slots RAM"; Expression={(Get-WmiObject -Class Win32_PhysicalMemoryArray).MemoryDevices}}
    
    Get-WmiObject -Class Win32_Processor | 
        Format-Table @{Name="Processador"; Expression={$_.Name}},
                      @{Name="Soquete"; Expression={$_.SocketDesignation}}
    
    Get-WmiObject -Class Win32_OperatingSystem | 
        Format-Table @{Name="Arquitetura OS"; Expression={$_.OSArchitecture}}
    
    Get-WmiObject -Class Win32_VideoController | 
        Format-Table @{Name="Placa de Video"; Expression={$_.Name}}
    
    Get-WmiObject -Class Win32_PhysicalMemory | 
        Format-Table @{Name="RAM Slot"; Expression={$_.BankLabel}},
                      @{Name="Tamanho (GB)"; Expression={[math]::round($_.Capacity/1GB,0)}},
                       @{Name="Megahertz"; Expression={$_.Speed}},
                        @{Name="Tipo DDR"; Expression={if ($_.SMBIOSMemoryType -eq 26){Write-Output "DDR4"}
                         elseif($_.SMBIOSMemoryType -eq 24){Write-Output "DDR3"}
                         elseif($_.SMBIOSMemoryType -eq 21){Write-Output "DDR2"}
                        else{}
                        }}                      
    
    Get-WmiObject -Class Win32_LogicalDisk |  
        Format-Table @{Name="Unidade"; Expression={$_.Name}},
                      @{Name="Livre (GB)"; Expression={[math]::round($_.FreeSpace/1GB, 0)}},
                       @{Name="Tamanho (GB)"; Expression={[math]::round($_.Size/1GB, 0)}}
    
    pause
}

Get-Specifications
