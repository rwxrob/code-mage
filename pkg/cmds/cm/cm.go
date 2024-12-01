package cm

import (
	"github.com/rwxrob/bonzai"
	"github.com/rwxrob/bonzai/cmds/help"
	"github.com/rwxrob/bonzai/comp"
	"github.com/rwxrob/code-mage/pkg/cmds/cm/fun"
	"github.com/rwxrob/code-mage/pkg/cmds/cm/quick"
)

var Cmd = &bonzai.Cmd{
	Name:  `cm`,
	Alias: `code-mage`,
	Short: `code-mage cli assistant`,
	Cmds:  []*bonzai.Cmd{help.Cmd, quick.Cmd, fun.Cmd},
	Comp:  comp.Cmds,
	Long: `
		Code Mage assistant {{aka .}} is designed to help you setup
		(initialize) your first terminal-based personal development
		environment using Alacritty terminal, bash command shell, and vim
		text editor.

		# WARNING

		Many of these commands are destructive, meaning they will destroy
		existing configurations and files. Use of the command line is
		powerful and a certain amount of caution is expected. This command
		is no different.
	`,
}
