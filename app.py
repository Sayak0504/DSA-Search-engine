from flask import Flask, jsonify, render_template
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from word2vec_utils import *
import os

app = Flask(__name__)
app.config['SECRET_KEY']='your-secret-key'

# Initialize
docs = load_and_preprocess_documents("LC Data/final_data.txt")
model = (Word2Vec.load('word2vec_model.bin') 
         if os.path.exists('word2vec_model.bin')
         else train_word2vec_model(docs))
vectors = (load_document_vectors() 
           if os.path.exists('document_vectors.pkl')
           else precompute_document_vectors(docs, model))

class SearchForm(FlaskForm):
    search = StringField('Enter search term:')
    submit = SubmitField('Search')

def process_word2vec(query):
    tokens = simple_preprocess(query, min_len=2, max_len=15)
    qvec = document_to_vector(tokens, model)
    sims = cosine_similarity([qvec], vectors)[0]
    ranked = sims.argsort()[::-1]
    links = open("LC Data/final_links.txt").read().splitlines()
    return [links[i] for i in ranked if sims[i]>0][:100]

@app.route("/", methods=['GET','POST'])
def home():
    form = SearchForm()
    results=[]
    if form.validate_on_submit():
        results = process_word2vec(form.search.data)
    return render_template('sample.html', form=form, results=results)

@app.route("/<query>")
def api(query):
    return jsonify(process_word2vec(query))

if __name__=='__main__':
    app.run(debug=True)
