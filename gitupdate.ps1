function git-push {
    param (
        [string]$repo,
        [string]$branch,
        [string]$origin = 'origin'
    )

    Write-Host "Pushing $repo repo to branch $branch in $origin" -ForegroundColor Blue
    git push --set-upstream $origin $branch
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
    Write-Host "Commiting with message:" -ForegroundColor Blue
    Write-Host "`t`t$message" -ForegroundColor DarkBlue
    git commit -m $message
    Write-Host "Pushing to origin..." -ForegroundColor Blue
    git-push . -branch master -origin origin
    Write-Host "Pushing to github..." -ForegroundColor Blue
    git-push . -branch master -origin gh
}

git pull

git-add ./README.md
git-add ./gitupdate.ps1
git-add ./.gitignore
git-add ./ollama/docker-compose.yaml
git-add ./ollama/.env
git-add ./gitea/docker-compose.yml
git-add ./bitwarden
git-add ./gitea/docker-compose.yml
git-add ./irc/docker-compose.yml
git-add ./plex/docker-compose.yml
git-add ./navidrome/docker-environment.yml
git-add ./nextcloud/docker.services.config.env
git-add ./nextcloud/docker-compose.yml
git-add ./nginx-proxy-manager/docker-compose.yml
git-add ./torrent/docker-compose.yml
git-add ./irc/docker-compose.yml
git-add ./gotenberg/docker-compose.yml
git-add ./s-pdf/docker-compose.yml
git-add ./portainer/docker-compose.yml
git-add ./portainer/.env
git-add ./adguard/docker-compose.yml
git-add ./adguard/.env
git-add ./font-awesome
git-send -message "Added adguard and portainer"
Write-Host "Done!" -ForegroundColor Green