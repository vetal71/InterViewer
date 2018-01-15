"%~dp0..\SFX Tool\7z.exe" x "%~dp0WinUpackR.7z" -aoa -pPowerUser -o"%~dp0"
cmd /c start "" "%~dp0WinUpackR.exe" %*