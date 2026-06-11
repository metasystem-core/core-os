$raw = $input | Out-String
try {
    $data = $raw | ConvertFrom-Json
    $prompt = $data.prompt
    $session = if ($data.session_id) { $data.session_id } else { "unknown" }
} catch {
    $prompt = $raw.Trim()
    $session = "unknown"
}

if (-not $prompt -or $prompt.Trim() -eq "") { exit 0 }

$log_dir = Join-Path $PSScriptRoot "..\logs"
if (-not (Test-Path $log_dir)) { New-Item -ItemType Directory -Path $log_dir -Force | Out-Null }

$log_file = Join-Path $log_dir "session_inputs.log"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$entry = "[$timestamp] session=$session`n$($prompt.Trim())`n---"
Add-Content -Path $log_file -Value $entry -Encoding UTF8
