from flask import Flask, render_template, jsonify
import os

app = Flask(__name__, 
    template_folder='../templates',
    static_folder='../static'
)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/locations')
def get_locations():
    # Temporary mock data for testing
    mock_data = {
        'churches': [
            {'name': 'Test Church 1', 'lat': -26.2041, 'long': 28.0473},
            {'name': 'Test Church 2', 'lat': -26.1945, 'long': 28.0307}
        ],
        'done_mission_sites': [
            {'name': 'Mission Site 1', 'lat': -26.1052, 'long': 28.0560},
            {'name': 'Mission Site 2', 'lat': -26.2345, 'long': 28.1234}
        ],
        'proposed_mission_sites': []
    }
    return jsonify(mock_data)

if __name__ == '__main__':
    app.run(debug=True, port=8000)
