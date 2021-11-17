get-ciminstance win32_networkadapterconfiguration |
  Where-Object {$_.IPEnabled -eq 'true'} |
    format-table Description,index,IPAddress,DNSDomain,DNSHostName |
      more