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

git-send -message "Added Matrix"
Write-Host "Done!" -ForegroundColor Green