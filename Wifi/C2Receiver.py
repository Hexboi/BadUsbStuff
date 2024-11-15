# Simple python server based on flask  
# Handles HTTP POST requests
# Exposes /upload path
# Runs on port 80, can be customized in app.run(host='0.0.0.0', port=80)

from flask import Flask, request

app = Flask(__name__)
collected_data = []

@app.route('/upload', methods=['POST'])
def upload():
    data = request.data.decode('utf-8')
    collected_data.append(data)
    print(f"Received: {data}")
    return '', 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
