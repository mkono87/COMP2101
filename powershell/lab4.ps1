


# Generic System Information
function systeminfo{
    $SystemInfo =  Get-WmiObject Win32_computersystem
    write-host ("System Information")
    $SystemInfo 
}
systeminfo | Format-List

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
# Processor Information
function CPU {
write-host ("Processor Information")
Get-CimInstance win32_processor | 
foreach {
    new-object -TypeName psobject -Property @{
        L1Cache= if ($_.L1CacheSize) {$_.L1CacheSize}
        else {"Not Available"}       
        L2Cache= if ($_.L2CacheSize) {$_.L2CacheSize}
        else {"Not Available"}
        L3Cache= if ($_.L3CacheSize) {$_.L3CacheSize}
        else {"Not Available"}

    }}| Format-List Name,NumberOfCores,L1Cache,L2Cache,L3Cache
} 



CPU



#Memory Interformation

$totalcapacity = 0 
Write-host ("Memory Information")
get-wmiobject -class win32_physicalmemory |  
foreach { 
    new-object -TypeName psobject -Property @{ 
                Manufacturer = $_.manufacturer 
                "Speed(MHz)" = $_.speed 
                "Size(MB)" = $_.capacity/1gb 
                Bank = $_.banklabel 
                Slot = $_.devicelocator 
    } 
    $totalcapacity += $_.capacity/1gb

} | 
ft -auto Manufacturer, "Size(MB)", "Speed(MHz)", Bank, Slot 
"Total RAM: ${totalcapacity}GB "














# systeminfo | Format-List Name,Model,Manufacturer,SystemType
# Os | Format-List



