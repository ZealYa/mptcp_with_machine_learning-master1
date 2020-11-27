import socket

class Interacter_socket():

    def __init__(self, host='', port=''):
        self.host = host
        self.port = port
        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)# ipv4 tcp
        self.s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.s.bind((self.host, self.port))
        self.conn = None
        self.addr = None

    def listen(self):
        print(str(self.host)+':'+str(self.port)+' is listening')
        self.s.listen(1)
        self.conn, self.addr = self.s.accept()
        #print('Connected by', self.addr)

    def recv(self):

        try:
            rcv_str = self.conn.recv(65536)
            if not rcv_str:
                return 'THIS BATCH IS END', True
            else:
                return rcv_str, False
        except socket.error:
            #print "Error while receive from socket"
            self.conn.close()
            return 'Socekt Error', True

    def send(self, string):
        self.conn.sendall(string.encode())

    def close(self):
        try:
            self.conn.close()
        except:
            print("Error while close socket")
