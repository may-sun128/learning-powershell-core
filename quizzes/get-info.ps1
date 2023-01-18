# Namespace 

Get-CimInstance -Namespace 'Root' -Class '__Namespace'

# Classes in a Namespace 

Get-CimClass -Namespace 'root\CIMV2' | Where-Object { $_.CimClassName - like 'Win32' } | Sort-Object CimClassName