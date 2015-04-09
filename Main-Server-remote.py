import serial
import sys
import time
import os
import win32com.client #incluso nel pacchetto pywin32
import urllib.request

#ser.write("y".encode('latin1'))


SERIALPORT = input("Inserire la porta seriale a cui e' connesso il dispositivo: ")
# Set up serial port
try:
    ser = serial.Serial(SERIALPORT, 9600)
except serial.SerialException:
    print('No device connected - exiting...')
    time.sleep(4)
    sys.exit()

'''
try: #cancelliamo il file dei comandi se non e' in uso.
 os.remove('C:\\xampp\\htdocs\\luce\\comando.txt')
except:
 pass
'''

print("### Light Module - Jupiter Home-System 1.4 ###\n")


print("In attesa di comandi dall'interfaccia web...")

#COMANDI
def esegui_cmd(comando):
  global ser
  global on
  
  if comando == "on":
     ser.write("m".encode('latin1'))
     print("Luce accesa! :)")
  elif comando == "off":
     ser.write("n".encode('latin1'))
     print("Luce spenta...!")
  else:
    print("Comando non riconosciuto...")

#LISTENING
id_code = 0000
while True:
  try:
    response = urllib.request.urlopen('http://www.roccomusolino.com/luce/comando.txt')
    x = response.read()
    x = x.decode("utf-8")
    if id_code != x[-4:]:
       cmd = x[0:x.index(" ")] #estrae dalla riga solo il comando
       esegui_cmd(cmd)
       id_code = x[-4:] #aggiorniamo con le 4 cifre dell'id finale (e' di tipo str)
  except:
    pass

#END
