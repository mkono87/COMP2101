function Get-SystemInformation {
    param(
      [switch]$System,
      [switch]$Disks, 
      [switch]$Network
  )
      if ($System -eq $true) {
        Get-OS
        Get-Memory
        Get-GPU
    }
      if ($Disks -eq $true) {
        Get-Disk
    }
      if ($Network -eq $true) {
        Get-Net
    }

}