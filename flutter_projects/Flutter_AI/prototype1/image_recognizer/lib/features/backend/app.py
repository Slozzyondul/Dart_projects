from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import cv2
import numpy as np
import os
from flask_mysqldb import MySQL
from flask_cors import CORS



app = Flask(__name__)
CORS(app)


mysql = MySQL(app)

# Directory to save uploaded images
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'o'
app.config['MYSQL_PASSWORD'] = 'ondul'
app.config['MYSQL_DB'] = 'image_db'

# Directory to save uploaded images
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


# Load YOLO
# net = cv2.dnn.readNet("yolov3.weights", "yolov3.cfg")
# layer_names = net.getLayerNames()
# output_layers = [layer_names[i[0] - 1] for i in net.getUnconnectedOutLayers()]

# # Load coco.names
# with open("coco.names", "r") as f:
#     classes = [line.strip() for line in f.readlines()]

# def detect_objects(image_path):
#     image = cv2.imread(image_path)
#     height, width, channels = image.shape

#     # Detecting objects
#     blob = cv2.dnn.blobFromImage(image, 0.00392, (416, 416), (0, 0, 0), True, crop=False)
#     net.setInput(blob)
#     outs = net.forward(output_layers)

#     class_ids = []
#     confidences = []
#     boxes = []
#     for out in outs:
#         for detection in out:
#             scores = detection[5:]
#             class_id = np.argmax(scores)
#             confidence = scores[class_id]
#             if confidence > 0.5:
#                 # Object detected
#                 center_x = int(detection[0] * width)
#                 center_y = int(detection[1] * height)
#                 w = int(detection[2] * width)
#                 h = int(detection[3] * height)

#                 # Rectangle coordinates
#                 x = int(center_x - w / 2)
#                 y = int(center_y - h / 2)

#                 boxes.append([x, y, w, h])
#                 confidences.append(float(confidence))
#                 class_ids.append(class_id)

#     indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
#     detected_objects = []
#     for i in range(len(boxes)):
#         if i in indexes:
#             label = str(classes[class_ids[i]])
#             detected_objects.append(label)

#     return detected_objects

# Ensure the upload folder exists
if not os.path.exists(UPLOAD_FOLDER):
    os.makedirs(UPLOAD_FOLDER)

@app.route('/upload', methods=['POST'])
def upload_image():
    if 'image' not in request.files:
        return jsonify({'error': 'No image part'}), 400
    
    file = request.files['image']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400
    
    if file:
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)
        
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO images (filepath) VALUES (%s)", [filepath])
        mysql.connection.commit()
        cursor.close()
        
        return jsonify({'message': 'Image uploaded successfully'}), 201
    
@app.route('/images', methods=['GET'])
def get_images():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM images")
    rows = cursor.fetchall()
    cursor.close()
    
    images = [{'id': row[0], 'filepath': row[1]} for row in rows]
    
    return jsonify(images), 200

@app.route('/search', methods=['GET'])
def search_objects():
    query = request.args.get('query')
    # Implement your search logic based on detected objects
    # Here we'll just return a dummy response
    results = ["image1.jpg", "image2.jpg"]  # Replace with actual search results
    return jsonify({"results": results})

if __name__ == '__main__':
    app.run(debug=True)
