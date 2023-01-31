# Get Scripting
# Building Tools: Gathering Information 

# Namespace 

Get-CimInstance -Namespace 'Root' -Class '__Namespace'

# Classes in a Namespace 

Get-CimClass -Namespace 'root\CIMV2' | Where-Object { $_.CimClassName - like 'Win32' } | Sort-Object CimClassName

# Common Classes 

Set-CimClass -Namespace 'root\CIM32' -ClassName Win32_OperatingSystem 
Set-CimClass -Namespace 'root\CIM32' -ClassName Win32_PhysicalMemory 

# Properties in classes
Get-CimClass -Namespace 'root\CIM32' -ClassName Win32_PhysicalMemory | Select-Object -ExpandProperty -CimClassProperties

# Finding Instances of a Class 
Get-CimInstance -ClassName Win32_OperatingSystem
Get-CimInstance -ClassName Win32_PhysicalMemory
