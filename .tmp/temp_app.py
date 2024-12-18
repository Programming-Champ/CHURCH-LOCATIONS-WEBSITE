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
    address = db.Column(db.String(200), nullable = True)
    phone = db.Column(db.String(100), nullable = True)
    members = db.Column(db.Integer, nullable = True)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'lat': self.lat,
            'lng': self.long,
            'county': self.county,
            'ward': self.ward,
            'address': self.address,
            'phone': self.phone,
            'members': self.members,
            'type': 'church'  
        }

class ProposedChurchUpdate(db.Model):
    __tablename__ = 'church_update'
    
    id = db.Column(db.Integer, primary_key=True)
    church_id = db.Column(db.Integer)
    name = db.Column(db.String(255), nullable=False)
    lat = db.Column(db.Float, nullable=False)
    long = db.Column(db.Float, nullable=False)
    county = db.Column(db.String(100))
    ward = db.Column(db.String(100))
    address = db.Column(db.String(200), nullable = True)
    phone = db.Column(db.String(100), nullable = True)
    members = db.Column(db.Integer, nullable = True)
    approval_status = db.Column(db.Integer, default = 0) # 0 - pending, 1 - approved

    def to_dict(self):
        return {
            'id': self.id,
            'church_id': self.church_id,
            'name': self.name,
            'lat': self.lat,
            'lng': self.long,
            'county': self.county,
            'ward': self.ward,
            'address': self.address,
            'phone': self.phone,
            'members': self.members,
            'type': 'church'  
        }

# # Function to load data from CSV and insert into the database
# def load_church_data_from_csv(csv_file):
#     # Read the CSV file into a DataFrame
#     df = pd.read_csv(csv_file)

#     # Iterate through each row in the DataFrame and add it to the database
#     with app.app_context():  # Ensure the Flask app context is available
#         for index, row in df.iterrows():
#             church = Church(
#                 id=row['id'], 
#                 name=row['Name'], 
#                 lat=row['Lat'], 
#                 long=row['Long'], 
#                 county=row['County'], 
#                 ward=row['Ward']
#             )
#             db.session.add(church)
        
#         # Commit all the changes to the database
#         db.session.commit()
#         print(f"{len(df)} records inserted into the database.")

# load_church_data_from_csv("../SDA_KENYA.csv")

# Call the function with your CSV file
# load_church_data_from_csv('church_data.csv')


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

@app.route('/api/church/update', methods=['GET', 'POST', 'PUT'])
def update_church_details():
    if request.method == 'PUT':
        data = request.json
        print(data)

        # This is temporary. To be approved by an admin before it's applied
        church = Church.query.filter_by(id = data['id']).first()
        if not church:
            return jsonify({'error': 'Church not found'}), 404
        church.name = data['name']
        church.lat = data['lat']
        church.long = data['lng']
        church.members = data['members']
        church.phone = data['phone']
        church.address = data['address']
        church.approval_status = 0 # pending state

        # create a proposed change that will be applied later
        new_proposed_church_update = ProposedChurchUpdate(church_id = data['id'], name=data['name'], lat=data['lat'], long=data['lng'],
                                                          members = data['members'], phone=data['phone'], address=data['address'], county=church.county,
                                                          ward=church.ward)
        db.session.add(new_proposed_church_update)

        db.session.commit()
        return jsonify({'message': "success"}), 201

if __name__ == '__main__':
    app.run(debug=True, port=8000)
