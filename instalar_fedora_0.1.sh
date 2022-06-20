#bin bash!
#RPM fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install okular
# sudo dnf install wget git curl
mkdir ZPL_MELI_Printer
cd ZPL_MELI_Printer
touch zpl_impresor_etiquetas_mercado_libre.py
touch LEEME.txt
touch Etiqueta" "de" "envio.txt
touch imprimir.sh
clear
echo "Programas actualizados"
#_______________________________________________________________
(
cat << 'EOF' 
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

EOF
) >> zpl_impresor_etiquetas_mercado_libre.py
echo "Creando script en Python"
#_______________________________________________________________
(
cat << 'EOF' 

Script que convierte lenguaje ZPL a PDF para etiquetas de mercado libre
en GNU/linux. Sirve cuando tienes impresora Gprinter y no traduce el ZPL.
Tengo la impresora termica GP-1324P. La etiqueta esta ajustada con CUPS
Y este script lo convierte a Pdf y abre okular. Utiliza la api
" http://api.labelary.com "
Se ejecuta abre la etiqueta y borra el zip descargado.

Para que funcione:

0.- GNU/Linux o Python 3, Hay un script de instalación en Fedora
Solo en fedora ejecuta en terminal "sh instalar_fedora_0.1.sh".
1.- Asegurate de que tu navegador tenga la opción de elegir carpeta donde descargar. En Chrome es Cambiando la 'opción' en "configuración" 
después "configuración avanzada" y después Descargas eleccionar la opción 
" Preguntar ubicación antes de descargar "
2.- Descarga el archivo ZIP de mercado libre en esta carpeta o donde este el archivo " zpl_impresor_etiquetas_mercado_libre.py "
3.- ejecuta como programa el archivo "imprimir.sh" o
en terminal linux ejecuta:
python zpl_impresor_etiquetas_mercado_libre.py
4.- Cierra los pdf abiertos
5.- Para volver a imprimir el mismo archivo solo busca la carpeta 
6.- Para imprimir otro descarga el zip en la ubicación de imprimir.sh y "zpl_impresor_etiquetas_mercado_libre.py"

Notas: El script solito borra los zip files. 

MyR 2022

EOF
) >> LEEME.txt
echo "Creando LEEME.txt "
#_______________________________________________________________
(
cat << 'EOF' 
^XA
^MCY
^CI28
^LH5,15
^FX  HEADER  ^FS
^FX  Logo_Meli  ^FSNADA^FS
^FO120,20^A0N,24,24^FH^FDRemitente #0000000^FS
^FO120,43^A0N,24,24^FB550,2,0,L^FH^FDREMITENTE XYZ^FS
^FO120,90^A0N,24,24^FB550,2,0,L^FH^FDEjemplo, MX-MEX- 54030^FS
^FO120,120^A0N,24,24^FDVenta: 20000^FS
^FO250,117^A0N,27,27^FD000000000000000000^FS
^FX LAST CLUSTER  ^FS
^FO20,150^GB210,45,45^FS
^FO20,156^A0N,45,45^FB210,1,0,C^FR^FDXEM1^FS
^FX END LAST CLUSTER  ^FS
^FO480,150^GB330,40,40^FS
^FO410,160^A0N,22,22
^FB460,1,0,C^FR^FH^FD AGENCIA X^FS
^FX  Shipment_Number_Bar_Code  ^FS
^FO230,210^BZ3,,0^BZN,160,N,N,N^FD>:41450097421^FS
^FO95,385^A0N,30,30^FZ390,1,0,R^FD414500^FS
^FO488,381^A0N,35,35^FB400,1,0,L^FD97421^FS
^FX  END_HEADER  ^FS
^FX  CUSTOM_DATA  ^FS
^FX  CUSTOM_DATA  ^FS
^FO0,750^A0N,175,175^FB630,1,0,R^FDSGD2^FS
^FO670,800^A0N,48,48^FB200,1,0,L^FD22:00^FS
^FO0,1000^A0N,28,28^FB533,1,0,R^FDXEM1 > XXXX > ^FS
^FO538,995^A0N,40,40^FDA5_1^FS
^FO0,1080^A0N,40,40^FB820,1,0,C^FDSAB 18/06/2022^FS
^FO0,1130^A0N,40,40^FB820,1,0,C^FDCP: 00000^FS
^FO0,1350^GB850,0,2^FS
^FX  END CUSTOM_DATA  ^FS
^FX  RECEIVER ZONE  ^FS
^FO30,1365^A0N,26,26^FB600,2,0,L^FH^FD Destino Cliente (Seudonimocliente)^FS
^FO30,1415^A0N,26,26^FB600,2,0,L^FH^FDDomicilio: XXXXXXX, XXXXXX, XXXXX^FS
^FO29,1414^A0N,26,26^FH^FDDomicilio:^FS
^FO30,1475^A0N,26,26^FDCP: 00000^FS
^FO29,1474^A0N,26,26^FDCP: 00000^FS
^FO30,1505^A0N,26,26^FB600,1,0,L^FH^FDColonia: XXXXXXXXX^FS
^FO31,1505^A0N,26,26^FB600,1,0,L^FDColonia:^FS
^FO30,1534^A0N,26,26^FB600,5,0,L^FH^FDReferencia: Referencia: XXXXXXXXXX^FS
^FO29,1533^A0N,26,26^FDReferencia:^FS
^FX  QR Code  ^FS
^FO650,1395^BY2,2,0^BQN,2,5^FDLA,{"id":"0000000000","t":"lm"}^FS
^BO650,1535^GB105,40,40^FS
^FO000,1540^A0N,35,35
^FB105,1,0,C^BR^FDC^FS
^FX  END_FOOTER  ^FS
^XZ
EOF
) >> Etiqueta" "de" "envio.txt
zip samplefileprint Etiqueta" "de" "envio.txt
echo "Creando archivos de ejemplo e imprimir.sh "

#_______________________________________________________________
(
cat << 'EOF' 
python zpl_impresor_etiquetas_mercado_libre.py
EOF
) >> imprimir.sh

if [ -f "imprimir.sh" ]
then
  chmod 755 imprimir.sh
  # Make the generated file executable.
else
  echo "Problem in creating file: \"$OUTFILE\""
fi
echo "Instalación terminada "
echo "Script hecho por Carlos MyR Copyleft 2022"


