# Stephans' dotfiles for Windows

This repository is used to setup my Windows 10 workstation they way I like. With all programs installed that are needed for my daily development tasks.

> **Note:** You must have your execution policy set to unrestricted (or at least in bypass) for this to work. To set this, run `Set-ExecutionPolicy Unrestricted` from a PowerShell running as Administrator.

## Use with git

It's preferred to use git to get all the files on your local machine.

```ps
git clone https://github.com/svrooij/dotfiles-windows.git ~\dotfiles-windows ; cd ~\dotfiles-windows ; .\bootstrap.ps1
```

## Git-free install

To install these dotfiles from PowerShell without Git:

```bash
iex ((new-object net.webclient).DownloadString('https://raw.github.com/svrooij/dotfiles-windows/master/setup/install.ps1'))
```

To update later on, just run that command again.

## Update

Most applications are installed by Winget, the `components\03-winget-pacakges.json` file has a list of packages that should be installed.

Update the package list with current installed applications. `winget export -o .\components\03-winget-packages.json`.

### VS Code Extensions

List all vscode extensions `code --list-extensions` and save to `components\10-vscode-extensions.txt`

## Thanks to

- [@jayharris](https://github.com/jayharris) for his [dotfiles-windows](https://github.com/jayharris/dotfiles-windows) repo, where the setup script and the repository setup is modeled to.
