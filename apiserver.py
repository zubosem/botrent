import http.server
import socketserver
import os
from dotenv import load_dotenv

DEFAULT_SERVER_PORT = 8080

class MyServer(http.server.SimpleHTTPRequestHandler):
    
    def do_GET(self):

        print(self.path)
        
        if self.path == '/':
            #self.path = '/home/furas/test/index.html'
            self.path = './desktop/formdailyactivities/index.html'
            
            print('original  :', self.path)
            print('translated:', self.translate_path(self.path))
            
            try:
                f = open(self.path, 'rb')
            except OSError:
                self.send_error(404, "File not found")
                return None

            ctype = self.guess_type(self.path)
            fs = os.fstat(f.fileno())
            
            self.send_response(200)
            self.send_header("Content-type", ctype)
            self.send_header("Content-Length", str(fs[6]))
            self.send_header("Last-Modified",
                self.date_time_string(fs.st_mtime))
            self.end_headers()            
            
            try:
                self.copyfile(f, self.wfile)
            finally:
                f.close()
                
        else:
            # run normal code
            print('original  :', self.path)
            print('translated:', self.translate_path(self.path))
            super().do_GET()
    
# --- main ---

handler_object = MyServer

SERVER_PORT = int(os.getenv('PYTHON_INTERNAL_PORT') or DEFAULT_SERVER_PORT)

print(f'Starting: http://localhost:{SERVER_PORT}')

my_server = None

try:
    socketserver.TCPServer.allow_reuse_address = True
    my_server = socketserver.TCPServer(("", SERVER_PORT), handler_object)
    my_server.serve_forever()
except KeyboardInterrupt:
    print('Stoped by "Ctrl+C"')
finally:
    print('Closing')
    my_server.server_close()