# Instruciones para acceder a los archivos NETCDF históricos

Esta es la forma en como un cliente puede capturar los archivos NETCDF de los históricos de predicciones hidrometeorologicas, descargarlos y almacenearlos en un datalake, servidor de almacenamiento o sistema de archivos local.

# PowerShell

## Importar las herramientas de AWS para PowerShell

1. Abrir PowerShell y "Run as Administrator" haciendo click derecho en PowerShell

2. Validar y cambiar la póliticas de ejecude scripts
```
Get-ExecutionPolicy
```
3. Si la politica de ejecución es "Restricted" cambiarla a "Unrestricted"
```
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```
4. Importar las herramientas de AWS para PowerShell
```
Import-Module AWSPowerShell
```
## Conectarse con AWS S3 usando PowerShell

```
SET AWS_ACCESS_KEY_ID="provided-access-key-id"
SET AWS_ACCESS_SECRET_KEY="="provided-access-secret-key"
```
```
Set-AWSCredential -AccessKey ${AWS_ACCESS_KEY_ID} –SecretKey ${AWS_ACCESS_SECRET_KEY} -StoreAs PowerFramesProfile
```

```
Set-AWSCredential -ProfileName PowerFramesProfile
```

## Unix
