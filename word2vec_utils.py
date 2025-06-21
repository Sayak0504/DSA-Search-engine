import os, pickle, numpy as np
from gensim.models import Word2Vec
from gensim.utils import simple_preprocess
from sklearn.metrics.pairwise import cosine_similarity

def load_and_preprocess_documents(data_file):
    with open(data_file,'r',encoding='utf-8') as f:
        docs = f.readlines()
    return [simple_preprocess(doc, min_len=2, max_len=15)
            for doc in docs if doc.strip()]

def train_word2vec_model(docs, path='word2vec_model.bin'):
    model = Word2Vec(sentences=docs,
                     vector_size=300, window=10,
                     min_count=2, workers=4,
                     sg=1, epochs=500)
    model.save(path)
    return model

def document_to_vector(tokens, model):
    vecs = [model.wv[t] for t in tokens if t in model.wv]
    return np.mean(vecs,axis=0) if vecs else np.zeros(model.vector_size)
    
def precompute_document_vectors(docs, model):
    return np.array([document_to_vector(d, model) for d in docs])
    
def save_document_vectors(vectors, file='document_vectors.pkl'):
    pickle.dump(vectors, open(file,'wb'))
    
def load_document_vectors(file='document_vectors.pkl'):
    return pickle.load(open(file,'rb'))
