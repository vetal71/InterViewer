@echo off
"%~dp0..\..\scripts\wget.exe" -q -O- -nH --tries=1 -nd -U"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)" "http://sourceforge.net/projects/innounp/files/latest/download?source=files"|find "href=""http://downloads.sourceforge.net"|"%~dp0..\..\scripts\wget.exe" -q --content-disposition -F -i- -nH -N --tries=1 -nd -U"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)" -P "%~dp0."
"%~dp0..\SFX Tool\7z.exe" x "%~dp0inno*.rar" -y "innounp.exe" -o"%~dp0"
del "%~dp0inno*.rar"