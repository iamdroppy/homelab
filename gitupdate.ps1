function git-push {
    param (
        [string]$repo,
        [string]$branch,
        [string]$origin = 'origin'
    )

    Write-Host "Pushing $repo repo to branch $branch in $origin" -ForegroundColor Blue
    git push --set-upstream $origin $branch
    Write-Host "Done!" -ForegroundColor Green
}

function git-add {
    param (
        [string[]]$files
    )

    if ($null -ne $files) {    
        Write-Host "Adding $($files -join ', ') files to git..." -ForegroundColor Blue
        git add $files
    }
    else {
        Write-Host "Error - no files specified." -ForegroundColor Red
    }
}

function git-send {
    param (
        [string] $message
    )
    Write-Host "Commiting with message:\n$message" -ForegroundColor Blue
    git commit -m $message
    Write-Host "Pushing to origin..." -ForegroundColor Blue
    git-push . -branch master -origin origin
    Write-Host "Pushing to github..." -ForegroundColor Blue
    git-push . -branch master -origin gh
    Write-Host "Done!" -ForegroundColor Green
}

git-add ./README.md
git-add ./gitupdate.ps1
git-add ./.gitignore
git-add ./ollama/docker-compose.yml
git-add ./ollama/.env
git-add ./gitea/docker-compose.yml
git-add ./bitwarden
git-add ./irc/docker-compose.yml
git-add ./plex/docker-compose.yml
git-add ./navidrome/docker-environment.yml
git-add ./nextcloud/docker.services.config.env
git-add ./nextcloud/docker-compose.yml
git-add ./nginx-proxy-manager/docker-compose.yml
git-send -message "Update"