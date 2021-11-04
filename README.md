# Instrucciones para descargar a los datos de predicción

Esta es la forma en como un cliente puede capturar los archivos NETCDF de los históricos de predicciones hidrometeorologicas, descargarlos y almacenearlos en un datalake, servidor de almacenamiento o sistema de archivos local.

# PowerShell Script

## Importar las herramientas de AWS S3 para PowerShell

1. Abrir PowerShell haceiendo click derecho en PowerShell y seleccionar `Run as Administrator`

2. Validar la [Política de Ejecución de Scripts](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.1)
```powershell
Get-ExecutionPolicy
```
3. Si la política de ejecución es `Restricted` cambiarla a `RemoteSigned`
```powershell
Set-ExecutionPolicy RemoteSigned
```
4. Importar las [Herramientas de AWS para PowerShell](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-windows.html)
```powershell
Install-Module -Name AWS.Tools.Installer -Force
Install-AWSToolsModule AWS.Tools.IdentityManagement -CleanUp -Force
Install-Module -Name AWS.Tools.S3 -Force
```
## Ajustar las credenciales de AWS

1. Usando las credenciales provistas crear un perfil
```powershell
Set-AWSCredential `
                 -AccessKey ********** `
                 -SecretKey ****************** `
                 -StoreAs PowerFramesProfile
```
## Crear un tarea cíclica

Deseamos correr cíclicamente [este script](DownloadNetcdf.ps1) ejecutando siguiente comando todos los días a las 17:00:
```powershell
.\DownloadNetcdf.ps1 (Get-Date -Format "yyyy-MM-dd") (Get-Location)
```
Para ello usaremos crearemos una tarea ejecutaando el [siguiente script](CreateDailyTaskScheduler.ps1).
```powershell
.\CreateDailyTaskScheduler.ps1
```
Si la tarea se creó correctamente obtendremos el siguiente resultado:
```text
TaskPath     TaskName                              State     
--------     --------                              -----
\            Descarga Pronósticos Power Frames     Ready
```

## Estructura del directorio destino
Todos los días a las 5 pm se crearía un nuevo sub-directorio tanto para el MPSR como para el SATD.
Por ejemplo para el 4 de noviembre la información se estructuraría de la siguiente forma:
```
.
├── README.md
├── DownloadNetcdf.ps1
├── CreateDailyTaskScheduler.ps1
├── mpsr
│   ├── 2021
|   |   ├── ...
|   |   ├── 11
|   |   |   ├── ...
|   |   |   ├── 04
|   |   |   |   ├── lat_lon
|   |   |   |   ├── out_2021-11-04_05.nc
|   |   |   |   ├── out_2021-11-04_06.nc
|   |   |   |   ├── ...
|   |   |   |   └── out_2021-11-06_05.nc
|   |   |   └── ...
|   |   └── ...
|   └── ...
└── satd
    ├── 2021
    |   ├── ...
    |   ├── 11
    |   |   ├── ...
    |   |   ├── 04
    |   |   |   ├── lat_lon
    |   |   |   ├── desl_2021-11-04_05.nc
    |   |   |   ├── desl_2021-11-04_06.nc
    |   |   |   ├── ...
    |   |   |   └── desl_2021-11-06_05.nc
    |   |   └── ...
    |   └── ...
    └── ...
```

## Contacto
[Equipo de Soporte](mailto:support@powerframes.co) \
[Power Frames SAS](https://www.powerframes.co)
