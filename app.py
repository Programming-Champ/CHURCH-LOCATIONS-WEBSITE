from flask import Flask, request, jsonify, render_template
from flask_cors import CORS
import psycopg2
import gspread
from oauth2client.service_account import ServiceAccountCredentials

app = Flask(__name__)
CORS(app)

# Google Sheets setup
SCOPE = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
CREDS = ServiceAccountCredentials.from_json_keyfile_name('G:/GIS/ChurchWebsite/sda-church-locations-2b37c1dbe79b.json', SCOPE)
CLIENT = gspread.authorize(CREDS)
SHEET = CLIENT.open('SDA CHURCH LOCATIONS').sheet1  # Adjust the sheet name as necessary

def get_db_connection():
    conn = psycopg2.connect(
        host='localhost',
        database='SDA_CHURCHES',
        user='postgres',
        password='password'
    )
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/locations', methods=['GET'])
def get_locations():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Query for churches, done mission sites, proposed mission sites
    cursor.execute('SELECT name, lat, long FROM churches')
    churches = cursor.fetchall()
    cursor.execute('SELECT name, lat, long FROM done_mission_sites')
    done_mission_sites = cursor.fetchall()
    cursor.execute('SELECT name, lat, long FROM proposed_mission_sites')
    proposed_mission_sites = cursor.fetchall()

    # Format the data
    response_data = {
        'churches': [{'name': name, 'lat': lat, 'long': long} for name, lat, long in churches],
        'done_mission_sites': [{'name': name, 'lat': lat, 'long': long} for name, lat, long in done_mission_sites],
        'proposed_mission_sites': [{'name': name, 'lat': lat, 'long': long} for name, lat, long in proposed_mission_sites]
    }

    cursor.close()
    conn.close()

    return jsonify(response_data)

@app.route('/suggest/county', methods=['GET'])
def suggest_county():
    search_term = request.args.get('q', '').strip().lower()
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT DISTINCT county_name FROM county WHERE county_name ILIKE %s LIMIT 4", (f'%{search_term}%',))
    suggestions = [row[0] for row in cur.fetchall()]
    cur.close()
    conn.close()
    return jsonify(suggestions)

@app.route('/suggest/conference', methods=['GET'])
def suggest_conference():
    search_term = request.args.get('q', '').strip().lower()
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT DISTINCT conference_name FROM conference WHERE conference_name ILIKE %s LIMIT 4", (f'%{search_term}%',))
    suggestions = [row[0] for row in cur.fetchall()]
    cur.close()
    conn.close()
    return jsonify(suggestions)

@app.route('/submit', methods=['POST'])
def submit_form():
    data = request.json
    print("Received data:", data)  # Log the received data

    # Validate required fields
    required_fields = ['email', 'name', 'churchName', 'conference', 'county']
    if not all(field in data and data[field] for field in required_fields):
        print("Missing required fields")  # Log missing fields
        return jsonify({"status": "error", "message": "Missing required fields."}), 400

    try:
        # Prepare data for Google Sheets
        row_data = [
            data['email'], 
            data['name'], 
            data['churchName'], 
            data['conference'], 
            data['county'], 
            data.get('location', ''), 
            data.get('evangelistName', ''), 
            data.get('startDate', ''), 
            data.get('endDate', ''), 
            data.get('nearbyChurches', '')
        ]

        print("Appending to Google Sheets:", row_data)  # Log data to be appended
        # Append row to Google Sheets
        SHEET.append_row(row_data)
        
        return jsonify({"status": "success", "data": data})
    except Exception as e:
        print("Error while saving data:", e)  # Log the error
        return jsonify({"status": "error", "message": "Failed to save data."}), 500


@app.route('/search', methods=['GET'])
def search_churches():
    query = request.args.get('q', '').lower()
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Query for church names and counties with fuzzy matching on the input query
    cursor.execute("""
        SELECT name, county FROM churches
        WHERE LOWER(name) LIKE %s
        LIMIT 4
    """, (f'%{query}%',))
    suggestions = cursor.fetchall()

    # Format the suggestions as JSON
    response_data = [{'name': name, 'county': county} for name, county in suggestions]

    cursor.close()
    conn.close()

    return jsonify(response_data)

if __name__ == '__main__':
    app.run(debug=True)
