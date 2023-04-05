import psycopg2
from http.server import BaseHTTPRequestHandler, HTTPServer
import os
from dotenv import load_dotenv

DEFAULT_SERVER_PORT = 8080

try:
    # some code that might raise an exception
    conn = psycopg2.connect(
        host=os.getenv('POSTGRES_HOST'),
        dbname=os.getenv('POSTGRES_DB'),
        user=os.getenv('POSTGRES_USER'),
        password=os.getenv('POSTGRES_PASSWORD'),
        port=os.getenv('POSTGRES_PORT'),
    )
except Exception as e:
    # code to handle the exception
    print("An error occurred:", e)
    # code to handle the exception
# Set up database connection

# Define handler for HTTP requests
class MyHandler(BaseHTTPRequestHandler):
    
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write(b'Hello, World!')

# Set up web server
SERVER_PORT = int(os.getenv('PYTHON_PORT') or DEFAULT_SERVER_PORT)
httpd = HTTPServer(('0.0.0.0', SERVER_PORT), MyHandler)

print(f'Serving on localhost:{SERVER_PORT}')

# Start listening and handling requests
httpd.serve_forever()

# Close database connection when server shuts down
conn.close()