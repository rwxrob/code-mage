# Code-Mage coding assistant

This is the code for the `cm` assistant installed and used in the book:

<https://rwxrob.github.io/books/code-mage>

Run the install script to install and configure a terminal personal development environment for any Mac, Windows, or Linux machine:

Mac, Linux:

```sh
bash -c $(curl -fsSL "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/install.bash")
```

Windows:

```powershell
& ([scriptblock]::Create((iwr 'https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/install.ps1')))
```

Or, install Podman Desktop, clone the repo, and build an image instead.

```sh
build image
```
