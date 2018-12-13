
#! python
# ##################################################
# python script
# Auto descarga Arduino + ch340 driver
# version="0.0.1"
#
# HISTORY:
#
# * DATE 13/12/2018 - v0.0.1
# Genaro Pennone
# ##################################################

import wget
import os
print('Instalando Arduino IDE')
url = 'https://downloads.arduino.cc/arduino-1.8.8-windows.exe'
urlCH340 = 'http://www.wch.cn/downloads/file/65.html'
wget.download(url)
print(' ')#Ejecutar
print('Instalando Arduino')
os.system('arduino-1.8.8-windows.exe')
print('Instalando Controlador')
wget.download(urlCH340)
os.system('CH341SER.EXE')
if os.path.exists("arduino-1.6.5-r5-windows.exe"):
    os.remove('arduino-1.6.5-r5-windows.exe')
if os.path.exists("CH341SER.EXE"):
    os.remove('CH341SER.EXE')
print(' Instalación terminada. Adiós...')
print('')
