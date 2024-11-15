# Simple python server based on flask  
# Handles HTTP POST requests via normal body or json
# Exposes /upload path
# Runs on port 80, can be customized in app.run(host='0.0.0.0', port=80)

from flask import Flask, request

app = Flask(__name__)
collected_data = []

@app.route('/upload', methods=['POST'])
def upload():
    # Try to parse JSON payload first
    if request.is_json:
        data = request.get_json()
    else:
        # Fall back to raw data or form data
        data = request.data.decode('utf-8') or request.form.to_dict(flat=False)

    collected_data.append(data)
    print(f"Received: {data}")
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
