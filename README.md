# Code-Mage coding assistant

This is the code for the `cm` assistant installed and used in the book:

<https://rwxrob.github.io/books/code-mage>

## Podman container

This repo can be used to build a Go development container image as well. Clone it locally and build it for your computer. This will ensure you get the latest of everything.

```sh
gh repo clone rwxrob/code-mage mycopy
cd mycopy
build image
build run
```

Then later ...

```sh
build attach
```

To just remove the `coding` container:

```sh
build rm
```

And this will remove the container and the image if you want build a new one from the latest:

```sh
build clean
```

To clean everything, rebuild, and rerun (useful when testing changes):

```sh
build init
```

Make sure any work you do within the persistent container is saved with `git`/`gh` since it is *not* saved when the container is removed eventually.
