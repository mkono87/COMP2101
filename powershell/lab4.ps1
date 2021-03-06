


# Generic System Information
function systeminfo{
    Write-host ("System Information")
    get-wmiobject -class win32_computersystem |  
    foreach { 
        new-object -TypeName psobject -Property @{ 
                    "Name" = $_.name
                    "Manufacturer" = $_.manufacturer 
                    "Model" = $_.model 
                    "System Type" = $_.systemtype 
                    "Status" = $_.status
        }
    }
}

systeminfo | format-list "Name","Manufacturer","Model","System Type","Status"

# Operating System Information
function OS {
    $OsInfo = Get-WMIobject -Class Win32_operatingsystem
    write-host ("Operating System Details")
    $CustomOSInfo = [PSCustomObject]@{
        'OS Edition' = $OsInfo.Caption
        'Build Version' = $OsInfo.Version
        'Installed On' = $OsInfo.InstallDate
        'Architecture' = $OsInfo.OSArchitecture

    }
$CustomOSInfo
}
OS | Format-list

# Processor Information
function CPU {
write-host ("Processor Information")
Get-CimInstance win32_processor | 
foreach {
    new-object -TypeName psobject -Property @{
        "L1Cache(Mb)"= if ($_.L1CacheSize) {$_.L1CacheSize}
        else {"Data Unavailable"}       
        "L2Cache(Mb)"= if ($_.L2CacheSize) {$_.L2CacheSize}
        else {"Data Unavailable"}
        "L3Cache(Mb)"= if ($_.L3CacheSize) {$_.L3CacheSize}
        else {"Data Unavailable"}
        "Name" = $_.Name
        "Core Count" = $_.NumberOfCores

    }
  }| Format-List  Name,"Core Count","L1Cache(Mb)","L2Cache(Mb)","L3Cache(Mb)"
} 





#Memory Interformation
function memory{
$totalcapacity = 0 
Write-host ("Memory Information")
get-wmiobject -class win32_physicalmemory |  
foreach { 
    new-object -TypeName psobject -Property @{ 
                Manufacturer = $_.manufacturer 
                "Speed(MHz)" = $_.speed 
                "Size(GB)" = $_.capacity/1gb 
                Bank = $_.banklabel 
                Slot = $_.devicelocator 
    } 
    $totalcapacity += $_.capacity/1gb

} | 
ft -auto Manufacturer, "Size(GB)", "Speed(MHz)", Bank, Slot 
"Total RAM: ${totalcapacity}GB "
}

memory | format-table



function diskinfo{
Write-Host ("Disk Information")
$diskdrives = Get-CIMInstance CIM_diskdrive

foreach ($disk in $diskdrives) {
    $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
    foreach ($partition in $partitions) {
          $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
          foreach ($logicaldisk in $logicaldisks) {
                   new-object -typename psobject -property @{Manufacturer=$disk.Caption
                                                             Location=$partition.deviceid
                                                             Drive=$logicaldisk.deviceid
                                                             "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                             "Free Space(GB)" =$logicaldisk.FreeSpace  / 1gb -as [int]
                                                             "% Free"  = [Math]::round((($logicaldisk.freespace/$logicaldisk.size) * 100))
                                                             }
           }
        }
    }
}
diskinfo | Format-Table Manufacturer,Drive,"Size(GB)","Free Space(GB)","% Free"



function netinfo{
Write-Host ("Network Interface Information")
    get-ciminstance win32_networkadapterconfiguration |
  Where-Object {$_.IPEnabled -eq 'True'} |
    Add-Member -MemberType AliasProperty -Name DNSServer -Value DNSServerSearchOrder -PassThru |
      Add-Member -MemberType AliasProperty -Name SubnetMask -Value IPSubnet -PassThru |
        Select-Object Description,index,IPAddress,SubnetMask,DNSServer,DNSDomain |
          Format-table -AutoSize
}
netinfo | Format-Table




function GPU {
    Write-Host("Graphics Information")
    $GpuInfo = Get-WMIobject -Class Win32_videocontroller
    foreach ($device in $GpuInfo){
        new-object -typename psobject -property @{
            "Vendor"=$device.AdapterCompatibility
            "Model"=$device.Caption
            "Resolution"="$($device.CurrentHorizontalResolution) X $($device.CurrentVerticalResolution)"

        }
    }    
}

GPU | Format-List


