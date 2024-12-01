package cm

import (
	_ "embed"
	"path/filepath"
	"runtime"

	"github.com/rwxrob/bonzai/futil"
	"github.com/rwxrob/bonzai/run"
)

const DARWIN_BASH_SHELL = `
[terminal.shell]
program = "/opt/homebrew/bin/bash"
`

const BASH_SHELL = `
[terminal.shell]
program = "bash"
`

//go:embed files/bashrc
var BashRC string

//go:embed files/vimrc
var VimRC string

//go:embed files/plug.vim
var PlugVim string

//go:embed files/alacritty.toml
var AlacrittyTOML string

func InitBash() error {
	dir, err := futil.UserHomeDir()
	if err != nil {
		return err
	}
	return futil.Overwrite(filepath.Join(dir, `.bashrc`), BashRC)
}

func InitVimRC() error {
	dir, err := futil.UserHomeDir()
	if err != nil {
		return err
	}
	return futil.Overwrite(filepath.Join(dir, `.vimrc`), VimRC)
}

func InitVimPlugins() error {
	dir, err := futil.UserHomeDir()
	if err != nil {
		return err
	}
	vimdir := filepath.Join(dir, `.vim`, `autoload`)
	if err := futil.CreateDir(vimdir); err != nil {
		return err
	}
	file := filepath.Join(vimdir, `plug.vim`)
	if err := futil.Overwrite(file, PlugVim); err != nil {
		return err
	}
	return run.Exec("vim", "+PlugInstall", "+GoInstallBinaries", "+qall")
}

func InitVim() error {
	if err := InitVimRC(); err != nil {
		return err
	}
	return InitVimPlugins()
}

func InitAlacritty() error {
	dir, err := futil.UserConfigDir()
	if err != nil {
		return err
	}
	confdir := filepath.Join(dir, `alacritty`)
	if err := futil.CreateDir(confdir); err != nil {
		return err
	}
	file := filepath.Join(confdir, `alacritty.toml`)
	if err := futil.Overwrite(file, AlacrittyTOML); err != nil {
		return err
	}
	var shell string
	switch runtime.GOOS {
	case `darwin`:
		shell = DARWIN_BASH_SHELL
	default:
		shell = BASH_SHELL
	}
	return futil.Append(file, shell)
}
