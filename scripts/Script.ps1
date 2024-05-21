# scripts/scriptT1.ps1
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force

# Your existing script content
$outputPath = "C:\hello_world.txt"
"Hello, World!" | Out-File -FilePath $outputPath -Encoding utf8
