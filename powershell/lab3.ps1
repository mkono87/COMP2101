get-ciminstance win32_networkadapterconfiguration |
  Where-Object {$_.IPEnabled -eq 'True'} |
    Add-Member -MemberType AliasProperty -Name DNSServer -Value DNSServerSearchOrder -PassThru |
      Add-Member -MemberType AliasProperty -Name SubnetMask -Value IPSubnet -PassThru |
        Select-Object Description,index,IPAddress,SubnetMask,DNSServer,DNSDomain |
          Format-table -AutoSize
          

