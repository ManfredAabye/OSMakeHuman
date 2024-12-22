@echo off

@REM OSMakeHuman/
@REM ├── MakeHuman/
@REM ├── buildscripts/
@REM │   └── download_assets_git.py
@REM │   └── (weitere Skripte)
@REM └── build_makehuman.bat

:: Hauptverzeichnis und Unterverzeichnisse
set BASE_DIR=%~dp0
set SOURCE_DIR=%BASE_DIR%MakeHuman
set BUILDSCRIPTS_DIR=%BASE_DIR%buildscripts
set ASSETS_DIR=%BUILDSCRIPTS_DIR%\makehuman-assets

:: In das Quellverzeichnis wechseln
if not exist "%SOURCE_DIR%" (
    echo Quellverzeichnis "%SOURCE_DIR%" nicht gefunden. Bitte sicherstellen, dass es existiert.
    exit /b
)
cd %SOURCE_DIR%

:: Python-Installation überprüfen
python --version >nul 2>&1
if errorlevel 1 (
    echo Python ist nicht installiert oder nicht in PATH. Bitte Python 3.6 oder höher installieren.
    exit /b
)

:: Python-Abhängigkeiten installieren
echo Installiere Python-Abhängigkeiten...
pip install -r requirements.txt

:: In das Verzeichnis "buildscripts" wechseln
if not exist "%BUILDSCRIPTS_DIR%" (
    echo Verzeichnis "%BUILDSCRIPTS_DIR%" nicht gefunden. Bitte sicherstellen, dass es existiert.
    exit /b
)
cd %BUILDSCRIPTS_DIR%

:: Assets klonen
if not exist "%ASSETS_DIR%" (
    echo Klone MakeHuman-Assets in "%ASSETS_DIR%"...
    git clone https://github.com/makehumancommunity/makehuman-assets.git "%ASSETS_DIR%"
) else (
    echo Assets-Verzeichnis "%ASSETS_DIR%" existiert bereits. Überspringe Klonen...
)

:: Zurück ins Quellverzeichnis wechseln
cd %SOURCE_DIR%

:: Assets herunterladen
echo Lade zusätzliche Assets herunter...
python ../buildscripts/download_assets_git.py

:: Optional: Modelle und Proxies kompilieren
echo Kompiliere Modelle und Proxies...
python compile_models.py
python compile_proxies.py
python compile_targets.py

:: MakeHuman starten
echo Starte MakeHuman...
python makehuman.py

:: Zurück ins Hauptverzeichnis wechseln
cd %BASE_DIR%

echo MakeHuman wurde erfolgreich gestartet.
pause
