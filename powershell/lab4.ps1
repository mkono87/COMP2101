
$OsInfo = Get-CimInstance Win32_operatingsystem
$CPUInfo = Get-CimInstance win32_processor

function systeminfo{
    $SystemInfo =  Get-CimInstance Win32_computersystem
    write-host ("System Information")
    $SystemInfo 
}
$SystemInfo

function OS {
    $OsInfo = Get-CimInstance Win32_operatingsystem
    write-host ("Operating System Details")
    $CustomOSInfo = [PSCustomObject]@{
        'OS Edition' = $OsInfo.Caption
        'Build Version' = $OsInfo.Version
        'Installed On' = $OsInfo.InstallDate
        'Architecture' = $OsInfo.OSArchitecture
    }
$CustomOSInfo

}

function CPU {
write-host ("Processor Information")
$CustomCPUInfo = [PsCustomObject] @{
    'Model' = $CPUInfo.Name
    'Cores' = $CPUInfo.NumberofCores
    'L1 Cache Size' = $CPUInfo.L1CacheSize
    'L2 Cache Size' = $CPUInfo.L2CacheSize
    'L3 Cache Size' = $CPUInfo.L3CacheSize
    }
$CustomCPUInfo
}



systeminfo | Format-List Name,Model,Manufacturer,SystemType
Os | Format-List 
CPU | Format-List



cputest = @{
    'Model' = $CPUInfo.Name
    'Cores' = $CPUInfo.NumberofCores
    'L1 Cache Size' = $CPUInfo.L1CacheSize
    'L2 Cache Size' = $CPUInfo.L2CacheSize
    'L3 Cache Size' = $CPUInfo.L3CacheSize
}
Foreach ($value in $cputest){
    if ($null -eq $value){
        
    }
}