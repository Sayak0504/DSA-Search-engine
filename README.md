# Code Engine

## About

Code Engine - an efficient platform for you to search famous coding problems given a query topic. This is designed to help problem solvers enhance their learning experience and help them find relevant problems at their doorstep.

This search engine is designed with the help of the TF-IDF Algorithm.

**Key Tech Stacks used in this project:**
1. Python (for scraping problems' data, TF-IDF Implementation)
2. Flask (Framework for our back-end server)
3. HTML/CSS for Front-end Development

## Files

1. **LC Data**: Contains the dataset used in the project on which the algorithm is applied. It includes data for 1000+ LeetCode problems, with potential scalability for further optimization.
2. **Templates Folder**: Contains the HTML/CSS code that serves the front-end view of the site.
3. **app.py**: The root file, containing the Flask app that serves the back-end server.

## Installation

1. Clone the repository 
   ```bash
   git clone https://github.com/banerjee-sarnab/AZ-Hackathon.git
   ```
2. Change to the project directory
   ```bash
   cd AZ-Hackathon
   ```
3. Install dependencies
   ```bash
   pip install flask flask-wtf gunicorn
   ```

## Usage

1. Run the application 
   ```bash
   python app.py
   ```
2. Open a web browser and navigate to ```http://localhost:5000``` to access the application
