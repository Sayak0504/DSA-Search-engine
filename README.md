# Code Engine

## About

Code Engine - an efficient platform for you to search famous coding problems given a query topic. This is designed to help problem solvers enhance their learning experience and help them find relevant problems at their doorstep.

A semantic search engine built with Flask and a custom-trained Word2Vec model. This project enables users to perform intelligent, context-aware searches over a document corpus, returning the most relevant results based on semantic similarity rather than simple keyword matching.

## Features


1. Semantic Search: Uses Word2Vec embeddings for understanding context and synonyms.

2. Custom Model: Trained on your own document corpus for domain-specific relevance.

3. Flask Web Interface: User-friendly search form and API endpoint.

4. Fast Results: Precomputed document vectors enable rapid similarity search.

5. Easy Setup: Automated environment and dependency installation scripts.

**Key Tech Stacks used in this project:**
1. Python 3.11+
The primary programming language for all backend, data processing, and machine learning components.

2. Flask
A lightweight Python web framework used to build the search engine’s web interface and API endpoints.

3. Gensim
For training and utilizing Word2Vec models, enabling semantic understanding and vectorization of text data.

4. scikit-learn
Used for computing cosine similarity between query and document vectors, as well as for other machine learning utilities.

5. NLTK (Natural Language Toolkit)
For advanced text preprocessing, including tokenization and stopword removal.

6. NumPy
Provides efficient numerical operations and array handling, crucial for vector computations.

7. Conda
Environment and dependency management to ensure reproducibility and smooth scientific Python development.

8. Jinja2 & WTForms
(Via Flask) For HTML templating and form handling in the web interface.



## Directory Structure

AZ-Hackathon/
├── LC Data/
│   ├── final_data.txt
│   └── final_links.txt
├── app.py
├── word2vec_utils.py
├── setup_word2vec.py
├── document_vectors.pkl
├── word2vec_model.bin
├── requirements.txt
├── environment.yml
├── setup.sh
├── setup.bat
├── sample.html
└── README.md


## Files

This section provides a brief description of the key files and their roles in the Word2Vec-based Flask Search Engine project:

1. app.py: The main Flask application file that initializes the web server, loads the Word2Vec model and document vectors, handles search queries, and renders the web interface.

2. word2vec_utils.py: Contains utility functions for loading and preprocessing documents, training the Word2Vec model, computing document vectors, and saving/loading these vectors.

3. setup_word2vec.py: A setup script to train the Word2Vec model on the document corpus and precompute document vectors. It automates the initial model training and vector preparation.

4. document_vectors.pkl: A pickle file storing the precomputed document vectors for fast similarity calculations during search.

5. word2vec_model.bin: The saved Word2Vec model file trained on the document corpus.

6. LC Data/final_data.txt: The text corpus file containing one document per line, used for training the Word2Vec model.

7. LC Data/final_links.txt: A file containing URLs or links corresponding to each document in final_data.txt, used to return search results.

8. requirements.txt: Lists all Python package dependencies required to run the project.

9. environment.yml: Conda environment specification file to create a reproducible environment with all necessary packages.

10. setup.sh and setup.bat: Shell and batch scripts to automate environment setup and dependency installation on Unix-like and Windows systems respectively.

11. sample.html: The HTML template used by Flask to render the search form and display search results.

12. README.md: Project documentation including setup instructions, usage, and technical details.

These files collectively enable the training, deployment, and usage of the semantic search engine powered by Word2Vec embeddings.



## Installation

1. Clone the repository 
   ```bash
   git clone https://github.com/Sayak0504/DSA-Search-engine.git
   ```
2. Change to the project directory
   ```bash
   cd DSA-Search-engine
   ```
3. Setup Environment
   ```bash
   bash setup.sh
   ```
4.  Train the Word2Vec Model (if not already present)
   ```bash
   conda activate az-hackathon
   python setup_word2vec.py
   ```

## Usage

1. Run the application 
   ```bash
   python app.py
   ```
2. Open a web browser and navigate to ```http://localhost:5000``` to access the application

## Customization

1. Corpus: Place your documents (one per line) in LC Data/final_data.txt.

2. Links: Ensure LC Data/final_links.txt contains a corresponding link for each document.

3. Model Parameters: Adjust vector size, window, min_count, and epochs in setup_word2vec.py as needed.

## Dependencies
Python 3.11+

Flask

Gensim

scikit-learn

NLTK

NumPy

(See requirements.txt and environment.yml for complete list)