#Requires -RunAsAdministrator
param (
[string]$Gpu
)

# Prints the script's help message.
function Print-Help {
    Write-Output "GPUReset - This script will reset (disable and re-enable) the specified GPU."
    Write-Output "Must be run as an Admin!"
    Write-Output ""
    Print-Usage
}

function Print-Usage {
    Write-Output "Usage: GPUReset.ps1 -Gpu ['intel'|'nvidia']"
}

# Disables and re-enables the Intel(R) UHD Graphics 630 GPU
function Reset-IntelGPU {
    Disable-PnpDevice -InstanceId 'PCI\VEN_8086&DEV_3E9B&SUBSYS_229F17AA&REV_00\3&11583659&0&10'-Confirm:$false;
    Enable-PnpDevice -InstanceId 'PCI\VEN_8086&DEV_3E9B&SUBSYS_229F17AA&REV_00\3&11583659&0&10'-Confirm:$false;
}

# Disables and re-enables the NVIDIA Quadro T2000 GPU
function Reset-NvidiaGPU {
    Disable-PnpDevice -InstanceId 'PCI\VEN_10DE&DEV_1FB8&SUBSYS_229F17AA&REV_A1\4&3254C708&0&0008' -Confirm:$false;
    Enable-PnpDevice -InstanceId 'PCI\VEN_10DE&DEV_1FB8&SUBSYS_229F17AA&REV_A1\4&3254C708&0&0008' -Confirm:$false;
}

if ($Gpu -eq "intel"){
    Reset-IntelGPU
} ElseIf ($Gpu -eq "nvidia") {
    Reset-NvidiaGPU
} Else {
    Write-Output "GPU argument was invalid."
    Print-Usage
}
