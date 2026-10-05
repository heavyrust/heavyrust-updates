$ErrorActionPreference = 'Stop'
Write-Host '=== Updating HeavyRust Client Updates on VDS ===' -ForegroundColor Cyan

$base = 'C:\inetpub\wwwroot\updates'
$files = "$base\files"
New-Item -ItemType Directory -Force -Path "$files\BepInEx\plugins", "$files\BepInEx\config" | Out-Null

Write-Host '1. Downloading manifest.json...' -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/manifest.json' -OutFile "$base\manifest.json" -UseBasicParsing

Write-Host '2. Downloading version.dll (Doorstop proxy)...' -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/files/version.dll' -OutFile "$files\version.dll" -UseBasicParsing

Write-Host '3. Downloading doorstop_config.ini...' -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/files/doorstop_config.ini' -OutFile "$files\doorstop_config.ini" -UseBasicParsing

Write-Host '4. Downloading clean HeavyMod.dll...' -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/files/BepInEx/plugins/HeavyMod.dll' -OutFile "$files\BepInEx\plugins\HeavyMod.dll" -UseBasicParsing

Write-Host '5. Downloading net.rust.heavymod.cfg...' -ForegroundColor Yellow
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/files/BepInEx/config/net.rust.heavymod.cfg' -OutFile "$files\BepInEx\config\net.rust.heavymod.cfg" -UseBasicParsing

Write-Host '6. Cleaning up duplicate or corrupted files...' -ForegroundColor Yellow
Remove-Item -Path "$files\BepInEx\plugins\HeavyRustBooster.dll" -Force -ErrorAction SilentlyContinue

Write-Host "`n=== VERIFICATION ===" -ForegroundColor Green
Get-Item "$files\BepInEx\plugins\HeavyMod.dll", "$files\version.dll", "$base\manifest.json" | Select-Object FullName, Length | Format-Table -AutoSize
Write-Host "`n[OK] HeavyMod updates deployed! All players will now get HeavyMod when launching the game." -ForegroundColor Green
