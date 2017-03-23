#!/usr/bin/python

import socket
import sys

#usage: ./escaner.py [host] [inicio] [fin]

target = sys.argv[1]	#lista de argumentos sys.argv
rango1 = sys.argv[2]	#numero de parametros len(sys.arv)
rango2 = sys.argv[3]
my_socket = socket.socket();
protocolname = 'tcp'


#if rango1 < 0 or rango2 > 65535:
#       print "rango invalido"  


try:
	
	socket.inet_aton(target)
	
	for puerto in range (int(rango1), int(rango2)):
		
			try:
				my_socket.connect((target,puerto))
				print "Port: %s => service: %s STATE: LISTEN" %(puerto, socket.getservbyport(puerto, protocolname))
				my_socket.close()
		
			except:
				try:
					print "Port: %s => service: %s STATE: CLOSED" %(puerto, socket.getservbyport(puerto, protocolname))
				except:
					print "Port: %s => service: Servicio no Encontrado " %(puerto)
        				continue

except socket.error:
	
	print "la ip introducida es invalida"
