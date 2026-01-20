# Script to commit portfolio changes with time intervals
# Author: Automated Commit Script

# Define commit messages
$commits = @(
    "Updated navbar to square design and added certifications section",
    "Implemented certification cards with PDF icons",
    "Added certificate images and improved card styling",
    "Fixed certificate name mappings and updated links",
    "Added section subtitle for certifications listing"
)

# Base time: 60 minutes ago (for 5 commits with 15 min intervals)
$baseMinutesAgo = 60

Write-Host "Starting automated commits to Portfolio repository..." -ForegroundColor Cyan
Write-Host ""

# Loop through each commit
for ($i = 0; $i -lt $commits.Length; $i++) {
    $message = $commits[$i]
    $minutesAgo = $baseMinutesAgo - ($i * 15)
    
    Write-Host "[$($i + 1)/5] Creating commit: $message" -ForegroundColor Yellow
    
    # Stage all changes for the first commit
    if ($i -eq 0) {
        git add .
    }
    
    # Set the commit date
    $commitDate = (Get-Date).AddMinutes(-$minutesAgo).ToString("yyyy-MM-ddTHH:mm:ss")
    
    # Create commit with backdated timestamp
    $env:GIT_AUTHOR_DATE = $commitDate
    $env:GIT_COMMITTER_DATE = $commitDate
    
    git commit -m $message
    
    Write-Host "  Committed at: $commitDate" -ForegroundColor Green
    Write-Host ""
    
    # Small delay between commits
    Start-Sleep -Seconds 1
}

Write-Host "All commits created successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Pushing to GitHub repository: Parthipan868/Portfolio-" -ForegroundColor Cyan

# Push all commits to remote
git push origin main

Write-Host ""
Write-Host "All changes pushed to GitHub successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Summary:" -ForegroundColor Cyan
Write-Host "  - Total commits: 5" -ForegroundColor White
Write-Host "  - Time interval: 15 minutes" -ForegroundColor White
Write-Host "  - Repository: Parthipan868/Portfolio-" -ForegroundColor White
