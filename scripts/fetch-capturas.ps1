$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$githubDir = Join-Path $repoRoot "recursos/capturas/github"
$overleafDir = Join-Path $repoRoot "recursos/capturas/overleaf"

New-Item -ItemType Directory -Force -Path $githubDir, $overleafDir | Out-Null

$assets = @(
    @{ Category = "github"; Name = "fork-button.png"; Url = "https://docs.github.com/assets/images/help/repository/fork-button.png" },
    @{ Category = "github"; Name = "repo-actions-settings.png"; Url = "https://docs.github.com/assets/images/help/repository/repo-actions-settings.png" },
    @{ Category = "github"; Name = "sync-fork-dropdown.png"; Url = "https://docs.github.com/assets/images/help/repository/sync-fork-dropdown.png" },
    @{ Category = "github"; Name = "pull-request-compare-pull-request.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/pull-request-compare-pull-request.png" },
    @{ Category = "github"; Name = "compare-across-forks-link.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/compare-across-forks-link.png" },
    @{ Category = "github"; Name = "choose-base-fork-and-branch.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/choose-base-fork-and-branch.png" },
    @{ Category = "github"; Name = "choose-head-fork-compare-branch.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/choose-head-fork-compare-branch.png" },
    @{ Category = "github"; Name = "pull-request-tabs-changed-files.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/pull-request-tabs-changed-files.png" },
    @{ Category = "github"; Name = "review-changes-button.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/review-changes-button.png" },
    @{ Category = "github"; Name = "merge-pull-request-options.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/merge-pull-request-options.png" },
    @{ Category = "github"; Name = "resolve-merge-conflicts-button.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/resolve-merge-conflicts-button.png" },
    @{ Category = "github"; Name = "mark-as-resolved-button.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/mark-as-resolved-button.png" },
    @{ Category = "github"; Name = "merge-conflict-commit-changes.png"; Url = "https://docs.github.com/assets/images/help/pull_requests/merge-conflict-commit-changes.png" },
    @{ Category = "overleaf"; Name = "create-new-github-repo.png"; Url = "https://3502988919-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FVetOkhFZmAC8QCQK0Pi7%2Fuploads%2FdilMSxaAGRS4rhrwEnC4%2FCreate_new_github.png?alt=media&token=7cd5984d-1be0-4bde-9122-bc413b30ab1d" },
    @{ Category = "overleaf"; Name = "overleaf-integrations-github.png"; Url = "https://3502988919-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FVetOkhFZmAC8QCQK0Pi7%2Fuploads%2F4MG7xg6UaiYqSSPHGg5f%2FProject_menu_github.png?alt=media&token=c82cdaf9-066d-4155-bf62-9ffaaef9372a" },
    @{ Category = "overleaf"; Name = "overleaf-project-menu-github.png"; Url = "https://3502988919-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FVetOkhFZmAC8QCQK0Pi7%2Fuploads%2FRYobYyUl40aT7Pyp5xKd%2FScreenshot%202025-12-03%20162330.png?alt=media&token=3c56c474-6e21-41b8-a9ad-8bfaa95a0198" },
    @{ Category = "overleaf"; Name = "overleaf-github-modal.png"; Url = "https://3502988919-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FVetOkhFZmAC8QCQK0Pi7%2Fuploads%2Fmym77M8gmKajsPqb3vdp%2FGithub_modal.png?alt=media&token=b6838cec-5b02-4969-b08a-e093a2eba3b0" },
    @{ Category = "overleaf"; Name = "overleaf-github-conflict.png"; Url = "https://3502988919-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FVetOkhFZmAC8QCQK0Pi7%2Fuploads%2FApF0BS4uugH3jzLDS2lm%2FGithub_merge.png?alt=media&token=8228ab48-30e1-4f7a-bbad-0d42b171489b" }
)

foreach ($asset in $assets) {
    $targetDir = if ($asset.Category -eq "github") { $githubDir } else { $overleafDir }
    $targetPath = Join-Path $targetDir $asset.Name
    Write-Host "Descargando $($asset.Name)..."
    Invoke-WebRequest -Uri $asset.Url -OutFile $targetPath -UseBasicParsing
}

$count = (Get-ChildItem -Path (Join-Path $repoRoot "recursos/capturas") -Recurse -File).Count
Write-Host "Listo. Archivos descargados: $count"
