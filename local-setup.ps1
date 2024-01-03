if (Get-Command git)
{
    write-host "git already installed"
}
else
{
    write-host "installing git"
    winget install -e --id Git.Git --accept-source-agreements --accept-package-agreements
}

Install-PackageProvider -Name NuGet -Force 
dotnet add package NuGet.CommandLine --version 6.8.0 
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
Add-PoshGitToProfile -AllHosts

if (Get-Command code)
{
    write-host "code already installed"
}
else
{
    write-host "installing code"
    winget install -e --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements
}

if (git config --global user.email -Pattern "rodas.huerobruce@gmail.com")
{   
    write-host "git email already configurated"
}
else
{   
    write-host "configuring git email"
    git config --global user.email "rodas.huerobruce@gmail.com"
}

if (git config --global user.name -Pattern "Huero Bruce Rodas")
{   
    write-host "git name is already configured"
}
else
{   write-host "configuring git name"
    git config --global user.name "Huero Bruce Rodas"
}