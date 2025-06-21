#!/usr/bin/env python3
from word2vec_utils import *
import time, os

if not os.path.exists("LC Data/final_data.txt"):
    raise FileNotFoundError("final_data.txt missing")

docs = load_and_preprocess_documents("LC Data/final_data.txt")
print(f"Documents: {len(docs)}")

start = time.time()
model = train_word2vec_model(docs)
print(f"Model trained in {time.time()-start:.2f}s")

vectors = precompute_document_vectors(docs, model)
save_document_vectors(vectors)
print(f"Vectors shape: {vectors.shape}")
