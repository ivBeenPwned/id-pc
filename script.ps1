Function Get-Specifications {
    
    $Spacing=@{Name="|"; Expression={Write-Output "|"}}

    Get-WmiObject -ClassName win32_ComputerSystem -ErrorAction SilentlyContinue | 
        Format-Table @{Name="Hostname"; Expression={$_.Name}},$Spacing,
                      @{Name="Fabricante"; Expression={$_.Manufacturer}}
    
    Get-WmiObject -Class Win32_Baseboard | 
        Format-Table @{Name="Placa Mae"; Expression={$_.Product}},$Spacing,
                      @{Name="Serial"; Expression={$_.SerialNumber}},$Spacing,
                       @{Name="Max. RAM (GB)"; Expression={[math]::round((Get-WmiObject -Class Win32_PhysicalMemoryArray).MaxCapacity/1MB,0)}},$Spacing,
                        @{Name="Max. RAM (Slots)"; Expression={(Get-WmiObject -Class Win32_PhysicalMemoryArray).MemoryDevices}}
    
    Get-WmiObject -Class Win32_Processor | 
        Format-Table @{Name="Processador"; Expression={$_.Name}},$Spacing,
                      @{Name="Arquitetura"; Expression={(Get-WmiObject -Class Win32_OperatingSystem).OsArchitecture}},$Spacing,
                       @{Name="Soquete"; Expression={$_.SocketDesignation}}
    
    Get-WmiObject -Class Win32_VideoController | 
        Format-Table @{Name="Placa de Video"; Expression={$_.Name}}
    
    Get-WmiObject -Class Win32_PhysicalMemory | 
        Format-Table @{Name="RAM Slot"; Expression={$_.BankLabel}},$Spacing,
                      @{Name="Tamanho (GB)"; Expression={[math]::round($_.Capacity/1GB,0)}},$Spacing,
                       @{Name="Velocidade (Mhz)"; Expression={$_.Speed}},$Spacing,
                        @{Name="Tipo DDR"; Expression={if ($_.SMBIOSMemoryType -eq 26){Write-Output "DDR4"}
                         elseif($_.SMBIOSMemoryType -eq 24){Write-Output "DDR3"}
                         elseif($_.SMBIOSMemoryType -eq 21){Write-Output "DDR2"}
                        else{Write-Output "Indeterminado"}
                        }}                      
    
    Get-WmiObject -Class Win32_LogicalDisk |  
        Format-Table @{Name="Unidade"; Expression={$_.Name}},$Spacing,
                      @{Name="Espaço Livre (GB)"; Expression={[math]::round($_.FreeSpace/1GB, 0)}},$Spacing,
                       @{Name="Tamanho Total (GB)"; Expression={[math]::round($_.Size/1GB, 0)}},$Spacing,
                        @{Name="Tipo de disco"; Expression={(Get-PhysicalDisk).MediaType}}

    
    pause
}

Get-Specifications
