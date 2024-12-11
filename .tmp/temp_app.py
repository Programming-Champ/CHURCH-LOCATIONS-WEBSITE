from flask import Flask, render_template, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__, 
    template_folder='../templates',
    static_folder='../static'
)

# PostgreSQL Database Configuration
DB_USER = os.getenv('DB_USER')
DB_PASSWORD = os.getenv('DB_PASSWORD')
DB_HOST = os.getenv('DB_HOST')
DB_PORT = os.getenv('DB_PORT')
DB_NAME = os.getenv('DB_NAME')


app.config['SQLALCHEMY_DATABASE_URI'] = f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy
db = SQLAlchemy(app)

# Church Model
class Church(db.Model):
    __tablename__ = 'church'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    lat = db.Column(db.Float, nullable=False)
    long = db.Column(db.Float, nullable=False)
    county = db.Column(db.String(100))
    ward = db.Column(db.String(100))

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'lat': self.lat,
            'lng': self.long,
            'county': self.county,
            'ward': self.ward,
            'type': 'church'  
        }

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/locations')
def get_locations():
    try:
        # Query all churches from the database
        churches = Church.query.all()
        church_list = [church.to_dict() for church in churches]
        
        # Format response to match frontend expectations
        response_data = {
            'churches': church_list,
            'done_mission_sites': [],  
            'proposed_mission_sites': []
        }
        return jsonify(response_data)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Efficient endpoint for searching locations
@app.route('/api/search')
def search_locations():
    try:
        keyword = request.args.get('keyword', '').strip()
        print(keyword)
        if not keyword:
            return jsonify({'error': 'Keyword is required'}), 400

        # Use ILIKE for case-insensitive search
        results = Church.query.filter(Church.name.ilike(f"%{keyword}%")).all()
        
        # Transform results into dictionaries
        locations = [church.to_dict() for church in results]

        return jsonify({'locations': locations})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=8000)
