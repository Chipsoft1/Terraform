# Example PowerShell script
$outputPath = "C:\Users\beheerder\terraform-azure-windows\hello_world.txt"
"Hello, World!" | Out-File -FilePath $outputPath -Encoding utf8
