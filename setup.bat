@echo off
echo === AZ-Hackathon Word2Vec Setup ===

where conda >nul 2>nul
if %errorlevel% neq 0 (
    echo Error: Conda is not installed or not in PATH
    echo Please install Miniconda or Anaconda first
    exit /b 1
)

echo Conda found

set ENV_NAME=az-hackathon

conda env create -f environment.yml
conda activate %ENV_NAME%
pip install --upgrade pip
pip install -r requirements.txt

echo Setup completed successfully!
echo.
echo Next steps:
echo 1. conda activate %ENV_NAME%
echo 2. python setup_word2vec.py
echo 3. python app.py
