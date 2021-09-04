$pacjageJsonPath = "$PSScriptRoot/package.json"
$packageJson = Get-Content -Raw -Path $pacjageJsonPath | ConvertFrom-Json
$projectName = $packageJson.name

$dockerCommand = '-f ./docker-compose.yml'

$dockerCommand = $dockerCommand + " -p $projectName";
$dockerCommand = $dockerCommand + ' up --build'

Write-Host "`nRunning" $dockerCommand -ForegroundColor Green

try {
  Start-Process -FilePath "docker-compose" -Wait -ArgumentList $dockerCommand -WorkingDirectory $PSScriptRoot -NoNewWindow
} finally {
}