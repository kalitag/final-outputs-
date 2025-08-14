@echo off
echo Installing Enhanced Telegram Product Bot Dependencies...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://python.org
    pause
    exit /b 1
)

echo Python found. Installing required packages...
echo.

REM Upgrade pip first
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install all packages from requirements.txt
echo Installing all required packages...
python -m pip install --force-reinstall -r requirements.txt

REM Verify installation
echo.
echo Verifying installation...
python -c "import telegram; print('✓ python-telegram-bot installed successfully')" 2>nul || echo "✗ python-telegram-bot installation failed"
python -c "import requests; print('✓ requests installed successfully')" 2>nul || echo "✗ requests installation failed"
python -c "import bs4; print('✓ beautifulsoup4 installed successfully')" 2>nul || echo "✗ beautifulsoup4 installation failed"
python -c "import PIL; print('✓ Pillow installed successfully')" 2>nul || echo "✗ Pillow installation failed"

echo.
echo ================================
echo Installing Tesseract OCR Engine...
echo ================================
echo.

REM Check if Tesseract is already installed
tesseract --version >nul 2>&1
if errorlevel 1 (
    echo Tesseract OCR not found in PATH
    echo Please download and install Tesseract OCR from:
    echo https://github.com/UB-Mannheim/tesseract/wiki
    echo.
    echo After installation, make sure it's added to your PATH
    echo or installed to: C:\Program Files\Tesseract-OCR\
) else (
    echo ✓ Tesseract OCR is already installed
)

echo.
echo ================================
echo Installation completed!
echo ================================
echo.
echo Next steps:
echo 1. Get your bot token from @BotFather on Telegram
echo 2. Edit config.json and add your bot token
echo 3. Run the bot using: run_bot.bat
echo.
pause
