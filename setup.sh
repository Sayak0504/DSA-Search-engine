#!/usr/bin/env bash
# AZ-Hackathon Word2Vec Search Engine Setup Script
# This script automates environment setup for the Flask application

set -e  # Exit immediately if a command exits with a non-zero status
set -u  # Treat unset variables as an error

echo "=== AZ-Hackathon Word2Vec Setup ==="
echo "Starting automated environment setup..."

# Check if conda is available
if ! command -v conda &> /dev/null; then
    echo "Error: Conda is not installed or not in PATH"
    echo "Please install Miniconda or Anaconda first"
    exit 1
fi

echo "✓ Conda found"

# Environment name
ENV_NAME="az-hackathon"

echo "Checking for existing environment: $ENV_NAME"

# Check if environment already exists
if conda env list | grep -q "^$ENV_NAME\s"; then
    echo "Environment '$ENV_NAME' already exists"
    read -p "Do you want to update it? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Updating environment from environment.yml..."
        conda env update -f environment.yml -n $ENV_NAME
    else
        echo "Skipping environment update"
    fi
else
    echo "Creating new environment from environment.yml..."
    conda env create -f environment.yml
fi

echo "Activating environment: $ENV_NAME"
source $(conda info --base)/etc/profile.d/conda.sh
conda activate $ENV_NAME

echo "Installing/updating pip dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "Verifying key package installations..."
python -c "import flask; print(f'Flask: {flask.__version__}')" || {
    echo "Error: Flask installation failed"
    exit 1
}

python -c "import gensim; print(f'Gensim: {gensim.__version__}')" || {
    echo "Error: Gensim installation failed"  
    exit 1
}

python -c "import sklearn; print(f'Scikit-learn: {sklearn.__version__}')" || {
    echo "Error: Scikit-learn installation failed"
    exit 1
}

echo "✓ All packages verified successfully"

echo "Checking project data files..."

# Verify required data files exist
if [[ ! -f "LC Data/final_data.txt" ]]; then
    echo "Warning: LC Data/final_data.txt not found"
    echo "Please ensure your document corpus is available"
fi

if [[ ! -f "LC Data/final_links.txt" ]]; then
    echo "Warning: LC Data/final_links.txt not found"
    echo "Please ensure your link file is available"
fi

# Check if Word2Vec model exists
if [[ -f "word2vec_model.bin" && -f "document_vectors.pkl" ]]; then
    echo "✓ Word2Vec model and vectors found"
else
    echo "Word2Vec model not found. You'll need to train it."
    echo "Run: python setup_word2vec.py after setup completes"
fi

echo ""
echo "=== Setup completed successfully! ==="
echo ""
echo "Next steps:"
echo "1. Activate environment: conda activate $ENV_NAME"
echo "2. Train Word2Vec model (if needed): python setup_word2vec.py"
echo "3. Start application: python app.py"
echo "4. Visit: http://localhost:5000"
