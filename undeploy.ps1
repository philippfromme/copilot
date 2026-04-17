<#
.SYNOPSIS
    Removes symlinks created by deploy.ps1.

.DESCRIPTION
    Removes only symlinks that point back into this repo. Does not touch files
    that were placed manually or by other tools.

.PARAMETER WhatIf
    Preview what would be removed without making changes.

.EXAMPLE
    .\undeploy.ps1
    .\undeploy.ps1 -WhatIf
#>

[CmdletBinding(SupportsShouldProcess)]
param()

$ErrorActionPreference = "Stop"

$ToolkitDir = $PSScriptRoot
$SkillsDir  = "$env:USERPROFILE\.copilot\skills"
$PromptsDir = "$env:APPDATA\Code\User\prompts"

$removed = 0
$skipped = 0

function Remove-SymlinkIfOurs {
    param(
        [string]$Path
    )

    if (-not (Test-Path $Path)) {
        return
    }

    $item = Get-Item $Path -Force
    if ($item.LinkType -ne "SymbolicLink") {
        Write-Host "  [skip] Not a symlink: $Path" -ForegroundColor DarkGray
        $script:skipped++
        return
    }

    # Only remove if it points back into this toolkit repo
    $resolvedTarget = $item.Target
    if (-not $resolvedTarget.StartsWith($ToolkitDir, [System.StringComparison]::OrdinalIgnoreCase)) {
        Write-Host "  [skip] Symlink points elsewhere: $Path -> $resolvedTarget" -ForegroundColor DarkGray
        $script:skipped++
        return
    }

    if ($PSCmdlet.ShouldProcess($Path, "Remove symlink")) {
        Remove-Item $Path -Force -Recurse
        Write-Host "  [removed] $Path" -ForegroundColor Yellow
        $script:removed++
    }
}

# ── Skills ───────────────────────────────────────────────────────────────────

Write-Host "`nSkills in $SkillsDir" -ForegroundColor Cyan
$skillsSource = Join-Path $ToolkitDir "skills"
if (Test-Path $skillsSource) {
    foreach ($skill in Get-ChildItem $skillsSource -Directory) {
        $target = Join-Path $SkillsDir $skill.Name
        Remove-SymlinkIfOurs -Path $target
    }
}

# ── Instructions ─────────────────────────────────────────────────────────────

Write-Host "`nInstructions in $PromptsDir" -ForegroundColor Cyan
$instructionsSource = Join-Path $ToolkitDir "instructions"
if (Test-Path $instructionsSource) {
    foreach ($file in Get-ChildItem $instructionsSource -Filter "*.instructions.md") {
        $target = Join-Path $PromptsDir $file.Name
        Remove-SymlinkIfOurs -Path $target
    }
}

# ── Prompts ──────────────────────────────────────────────────────────────────

Write-Host "`nPrompts in $PromptsDir" -ForegroundColor Cyan
$promptsSource = Join-Path $ToolkitDir "prompts"
if (Test-Path $promptsSource) {
    foreach ($file in Get-ChildItem $promptsSource -Filter "*.prompt.md") {
        $target = Join-Path $PromptsDir $file.Name
        Remove-SymlinkIfOurs -Path $target
    }
}

# ── Summary ──────────────────────────────────────────────────────────────────

Write-Host "`n--- Summary ---" -ForegroundColor Cyan
Write-Host "  Removed: $removed"
Write-Host "  Skipped: $skipped"
Write-Host "`nDone." -ForegroundColor Green
