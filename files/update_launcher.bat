@echo off
chcp 65001 >nul
title РћР±РЅРѕРІР»РµРЅРёРµ Heavy Rust Launcher
echo ========================================================
echo   РћР±РЅРѕРІР»РµРЅРёРµ Р»Р°СѓРЅС‡РµСЂР° Heavy Rust [SpaceWar AppID 480]
echo ========================================================
echo Р—Р°РєСЂС‹С‚РёРµ Р·Р°РїСѓС‰РµРЅРЅС‹С… РїСЂРѕС†РµСЃСЃРѕРІ Р»Р°СѓРЅС‡РµСЂР°...
taskkill /f /im HeavyRustLauncher.exe >nul 2>&1
timeout /t 1 /nobreak >nul

echo РќР°СЃС‚СЂРѕР№РєР° SpaceWar (AppID 480)...
attrib -h -r steam_appid.txt >nul 2>&1
echo 480> steam_appid.txt
if exist "RustClient_Data\Plugins\x86_64" (
    attrib -h -r "RustClient_Data\Plugins\x86_64\steam_appid.txt" >nul 2>&1
    echo 480> "RustClient_Data\Plugins\x86_64\steam_appid.txt"
)

echo Р—Р°РіСЂСѓР·РєР° СЃРІРµР¶РµР№ РІРµСЂСЃРёРё Р»Р°СѓРЅС‡РµСЂР°...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/heavyrust/heavyrust-updates/main/files/HeavyRustLauncher.exe', 'HeavyRustLauncher.exe.tmp')"

if exist "HeavyRustLauncher.exe.tmp" (
    attrib -h -r HeavyRustLauncher.exe >nul 2>&1
    del /f /q HeavyRustLauncher.exe >nul 2>&1
    move /y HeavyRustLauncher.exe.tmp HeavyRustLauncher.exe >nul 2>&1
    echo [РЈРЎРџР•РЁРќРћ] Р›Р°СѓРЅС‡РµСЂ РѕР±РЅРѕРІР»РµРЅ!
) else (
    echo [РћРЁРР‘РљРђ] РќРµ СѓРґР°Р»РѕСЃСЊ Р·Р°РіСЂСѓР·РёС‚СЊ С„Р°Р№Р» Р»Р°СѓРЅС‡РµСЂР°.
)

echo Р—Р°РїСѓСЃРє РѕР±РЅРѕРІР»РµРЅРЅРѕРіРѕ Р»Р°СѓРЅС‡РµСЂР°...
start "" "HeavyRustLauncher.exe"
timeout /t 2 >nul
exit