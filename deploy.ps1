<#
.SYNOPSIS
    Deploys Copilot customizations by symlinking files to the locations VS Code expects.

.DESCRIPTION
    Symlinks skills, instructions, and prompts from this repo into:
      - Skills:       ~\.copilot\skills\
      - Instructions:  %APPDATA%\Code\User\prompts\
      - Prompts:       %APPDATA%\Code\User\prompts\

    Requires Developer Mode enabled on Windows (Settings > For Developers).
    Run with -WhatIf to preview changes without applying them.

.PARAMETER WhatIf
    Preview what would be done without making changes.

.EXAMPLE
    .\deploy.ps1
    .\deploy.ps1 -WhatIf
#>

[CmdletBinding(SupportsShouldProcess)]
param()

$ErrorActionPreference = "Stop"

$ToolkitDir = $PSScriptRoot
$SkillsDir  = "$env:USERPROFILE\.copilot\skills"
$PromptsDir = "$env:APPDATA\Code\User\prompts"

$linked = 0
$skipped = 0
$errors = 0

function New-SymlinkSafe {
    param(
        [string]$Path,
        [string]$Target,
        [switch]$IsDirectory
    )

    if (Test-Path $Path) {
        $item = Get-Item $Path -Force
        if ($item.LinkType -eq "SymbolicLink" -and $item.Target -eq $Target) {
            Write-Host "  [skip] Already linked: $Path" -ForegroundColor DarkGray
            $script:skipped++
            return
        }

        if ($PSCmdlet.ShouldProcess($Path, "Remove existing item")) {
            Remove-Item $Path -Force -Recurse
        }
    }

    if ($PSCmdlet.ShouldProcess("$Path -> $Target", "Create symlink")) {
        try {
            if ($IsDirectory) {
                New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force | Out-Null
            } else {
                New-Item -ItemType SymbolicLink -Path $Path -Target $Target -Force | Out-Null
            }
            Write-Host "  [link] $Path -> $Target" -ForegroundColor Green
            $script:linked++
        }
        catch {
            Write-Host "  [FAIL] $Path : $_" -ForegroundColor Red
            $script:errors++
        }
    }
}

# ── Ensure target directories exist ──────────────────────────────────────────

foreach ($dir in @($SkillsDir, $PromptsDir)) {
    if (-not (Test-Path $dir)) {
        if ($PSCmdlet.ShouldProcess($dir, "Create directory")) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
            Write-Host "Created: $dir" -ForegroundColor Yellow
        }
    }
}

# ── Skills (each subfolder -> ~\.copilot\skills\<name>) ─────────────────────

Write-Host "`nSkills -> $SkillsDir" -ForegroundColor Cyan
$skillsSource = Join-Path $ToolkitDir "skills"
if (Test-Path $skillsSource) {
    foreach ($skill in Get-ChildItem $skillsSource -Directory) {
        $target = Join-Path $SkillsDir $skill.Name
        New-SymlinkSafe -Path $target -Target $skill.FullName -IsDirectory
    }
} else {
    Write-Host "  No skills/ directory found, skipping." -ForegroundColor DarkGray
}

# ── Instructions (*.instructions.md -> prompts folder) ──────────────────────

Write-Host "`nInstructions -> $PromptsDir" -ForegroundColor Cyan
$instructionsSource = Join-Path $ToolkitDir "instructions"
if (Test-Path $instructionsSource) {
    foreach ($file in Get-ChildItem $instructionsSource -Filter "*.instructions.md") {
        $target = Join-Path $PromptsDir $file.Name
        New-SymlinkSafe -Path $target -Target $file.FullName
    }
} else {
    Write-Host "  No instructions/ directory found, skipping." -ForegroundColor DarkGray
}

# ── Prompts (*.prompt.md -> prompts folder) ──────────────────────────────────

Write-Host "`nPrompts -> $PromptsDir" -ForegroundColor Cyan
$promptsSource = Join-Path $ToolkitDir "prompts"
if (Test-Path $promptsSource) {
    foreach ($file in Get-ChildItem $promptsSource -Filter "*.prompt.md") {
        $target = Join-Path $PromptsDir $file.Name
        New-SymlinkSafe -Path $target -Target $file.FullName
    }
} else {
    Write-Host "  No prompts/ directory found, skipping." -ForegroundColor DarkGray
}

# ── Summary ──────────────────────────────────────────────────────────────────

Write-Host "`n--- Summary ---" -ForegroundColor Cyan
Write-Host "  Linked:  $linked"
Write-Host "  Skipped: $skipped (already up to date)"
if ($errors -gt 0) {
    Write-Host "  Errors:  $errors" -ForegroundColor Red
    Write-Host "`nHint: Symlinks require Developer Mode. Enable it in Windows Settings > For Developers." -ForegroundColor Yellow
} else {
    Write-Host "`nDone. Restart VS Code to pick up changes." -ForegroundColor Green
}
