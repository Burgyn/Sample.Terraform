param (
    [string]$workspace = "dev"
)

Write-Output "*********** Create or select workspace"

if ($null -ne (terraform workspace list | Select-String -Pattern $workspace)) {
    Write-Output "Switch to workspace $workspace"
    terraform workspace select "$workspace" -no-color
}
else {
    Write-Output "Create new workspace $workspace"
    terraform workspace new "$workspace" -no-color
}