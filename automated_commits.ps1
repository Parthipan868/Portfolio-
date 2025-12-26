$totalCommits = 10
$intervalSeconds = 5  # Changed from 30 minutes to 5 seconds
$repoPath = $PSScriptRoot # Use the current script directory

Set-Location $repoPath

# Commit 1: The main changes to index.html
Write-Host "Processing Commit 1 of $totalCommits..."
git add index.html
git commit -m "Refactor: Update footer design, spacing, and styling"
git push origin main

for ($i = 2; $i -le $totalCommits; $i++) {
    Write-Host "Waiting $intervalSeconds seconds before next commit..."
    Start-Sleep -Seconds $intervalSeconds
    
    # Create/Update a dummy file to ensure there is something to commit
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "Deployment Log - Build $i - $timestamp" | Out-File -FilePath "deploy_log.txt" -Append -Encoding utf8
    
    Write-Host "Processing Commit $i of $totalCommits..."
    git add deploy_log.txt
    git commit -m "Chore: Update deployment log timestamp [$timestamp]"
    git push origin main
}

Write-Host "✅ Successfully completed $totalCommits commits with 30-minute intervals."
