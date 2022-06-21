from multiprocessing.spawn import prepare
import requests
import shutil
import sys
import os
os.system('clear')
#os.system('unzip *.zip')
#Descompresor en carpeta
os.system('for i in *.zip; do unzip "$i" -d "${i%%.zip}"; done')
#Directorio = os.system('ls -td -- */ | head -n 1 | cut -d'/' -f1')
# Buscador de carpeta reciente
all_subdirs = [d for d in os.listdir('.')
                 if os.path.isdir(d)]
Directorio = max(all_subdirs, key=os.path.getmtime)
#Junta las rutas de directorios
QE = os.getcwd ()
path = QE+'/'+Directorio 
os.chdir(path)
dirctory = os.getcwd()
print(f'Current working directory: After= {dirctory}')
print('Impresor ZPL Versión 0.1 Copy Left 2022 by MyR')
print ('Leyendo Formato')
file = open('Etiqueta de envio.txt')
zpl = file
# adjust print density (8dpmm), label width (4 inches), label height (6 inches), and label index (0) as necessary
url = 'http://api.labelary.com/v1/printers/8dpmm/labels/4x8/0/'
files = {'file' : zpl}
headers = {'Accept' : 'application/pdf'} # omit this line to get PNG images back
response = requests.post(url, headers = headers, files = files, stream = True)

if response.status_code == 200:
    response.raw.decode_content = True
    with open('label.pdf', 'wb') as out_file: # change file name for PNG images
        shutil.copyfileobj(response.raw, out_file)
    os.system('okular *.pdf')
    #Borra el zip descargado
    regresador = QE
    print(f'Current working directory: After= {QE}')
    os.chdir(regresador)
    print(regresador)
    os.system( 'rm *.zip')  
    
else:
    print('Error: ' + response.text)

