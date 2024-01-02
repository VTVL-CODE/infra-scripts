if (Get-Command git)
{
    write-host "git already installed"
}
else
{
    write-host "installing git"
    winget install -e --id Git.Git --accept-source-agreements --accept-package-agreements
}

if (Get-Command code)
{
    write-host "code already installed"
}
else
{
    write-host "installing code"
    winget install -e --id Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements
}

git config --global user.email "rodas.huerobruce@gmail.com"
git config --global user.name "Huero Bruce Rodas"