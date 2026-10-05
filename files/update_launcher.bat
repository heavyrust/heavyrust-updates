@echo off
chcp 65001 >nul
title Обновление Heavy Rust Launcher
echo ========================================================
echo   Обновление лаунчера Heavy Rust [SpaceWar AppID 480]
echo ========================================================
echo Закрытие запущенных процессов лаунчера...
taskkill /f /im HeavyRustLauncher.exe >nul 2>&1
timeout /t 1 /nobreak >nul

echo Настройка SpaceWar (AppID 480)...
attrib -h -r steam_appid.txt >nul 2>&1
echo 480> steam_appid.txt
if exist "RustClient_Data\Plugins\x86_64" (
    attrib -h -r "RustClient_Data\Plugins\x86_64\steam_appid.txt" >nul 2>&1
    echo 480> "RustClient_Data\Plugins\x86_64\steam_appid.txt"
)

echo Загрузка свежей версии лаунчера с сервера VDS (5.83.140.94)...
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $wc = New-Object Net.WebClient; $wc.DownloadFile('http://5.83.140.94/HeavyRustLauncher.exe', 'HeavyRustLauncher.exe.tmp')"

if exist "HeavyRustLauncher.exe.tmp" (
    attrib -h -r HeavyRustLauncher.exe >nul 2>&1
    del /f /q HeavyRustLauncher.exe >nul 2>&1
    move /y HeavyRustLauncher.exe.tmp HeavyRustLauncher.exe >nul 2>&1
    echo [УСПЕШНО] Лаунчер обновлен!
) else (
    echo [ОШИБКА] Не удалось загрузить файл лаунчера.
)

echo Запуск обновленного лаунчера...
start "" "HeavyRustLauncher.exe"
timeout /t 2 >nul
exit