from flask import Flask, request, jsonify
import numpy as np

app = Flask(__name__)

# Assuming 'model' is your trained model

@app.route('/predict', methods=['POST'])
def predict():
    data = request.json['data']
    data = np.array(data).reshape(1, -1)  # Assuming data is a list
    prediction = model.predict(data)
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
    app.run(debug=True)
