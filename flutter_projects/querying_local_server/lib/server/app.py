from flask import Flask, jsonify, request
import sqlite3
from flask_cors import CORS
import mysql.connector


app = Flask(__name__)
CORS(app)

# Connect to MariaDB database
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="ondul",     
        password="o", 
        database="pay_app"
    )

@app.route('/accounts', methods=['GET'])
def det_accounts():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM accounts")
    all_accounts = cursor.fetchall()

    accounts = [
        {"account_id": row[0], "date_created": row[1], "date_updated": row[2], "lender_id": row[3], "borrower_id": row[4], "total": row[5], "available": row[6], "owed": row[7],} for row in all_accounts
    ]

    cursor.close()
    conn.close()

    return jsonify(accounts)


@app.route('/transactions', methods=['GET'])
def get_transactions():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM transactions")
    all_transactions = cursor.fetchall()

    transactions = [
        {"transaction_id": row[0], "account_id": row[1], "transaction_date": row[2], "transaction_type": row[3], "amount": row[4],} for row in all_transactions
    ]
    cursor.close()
    conn.close

    return jsonify(transactions)


@app.route('/users', methods=['GET', 'POST'])
def get_users():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    if request.method == 'GET':
        cursor.execute("SELECT user_id, user_name, phone_number, id_number, email FROM users")
        all_users = cursor.fetchall()

        # Transform the result into a list of dictionaries
        users = [
        {"user_id": row[0], "user_name": row[1], "phone_number": row[2], "id_number": row[3], "email": row[4],} for row in all_users
        ]
        cursor.close()
        conn.close()

        return jsonify(users)
    
    elif request.method == 'POST':
        new_user = request.get_json() # Get the user data from the request body (JSON)

        # Extract data fields from the request
        user_id = new_user.get('user_id')
        user_name = new_user.get('user_name')
        phone_number = new_user.get('phone_number')
        id_number = new_user.get('id_number')
        email = new_user.get('email')

        # Insert the new user into the database
        cursor.execute(
            "INSERT INTO users (user_id, user_name, phone_number, id_number, email) VALUES (%s, %s, %s, %s, %s)",
            (user_id, user_name, phone_number, id_number, email)
        )
        conn.commit()

        cursor.close()
        conn.close()
        
        return jsonify({'message': 'User added successfully!'}), 201
    


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)


