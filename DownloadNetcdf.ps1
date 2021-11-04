$date      = $args[0]
$localPath = $args[1]

$dateArray = $date.Split("-")

$year  = $dateArray[0]
$month = $dateArray[1]
$day   = $dateArray[2]

$bucketName = 'datalake.mpsr.powerframes.co'

$prefixMPSR = ('wrf/' + $year + '/' + $month + '/' + $day)
$listObjectsMPSR = Get-S3Object -BucketName $bucketName -KeyPrefix $prefixMPSR
foreach ($object in $listObjectsMPSR) { 
    $localFileName = $object.Key.Substring(15)
    $localSubpath = ($localPath + '\mpsr\' + $year + '\' + $month + '\' + $day)
    $localFilePath = Join-Path $localSubpath $localFileName
    Copy-S3Object -BucketName $bucketName -Key $object.Key -LocalFile $localFilePath
}

$prefixSATD = ('wrf-mpd/' + $year + '/' + $month + '/' + $day)
$listObjectsSATD = Get-S3Object -BucketName $bucketName -KeyPrefix $prefixSATD
foreach ($object in $listObjectsSATD) {
    $localFileName = $object.Key.Substring(19)
    $localSubpath = ($localPath + '\satd\' + $year + '\' + $month + '\' + $day)
    $localFilePath = Join-Path $localSubpath $localFileName
    Copy-S3Object -BucketName $bucketName -Key $object.Key -LocalFile $localFilePath
}