# Script_ZPL_Mercado_libre_Impresora

**Script que convierte lenguaje ZPL a PDF para etiquetas de mercado libre
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
**

