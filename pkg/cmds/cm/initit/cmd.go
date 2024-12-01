package initit

import (
	"github.com/rwxrob/bonzai"
	"github.com/rwxrob/bonzai/comp"
	"github.com/rwxrob/code-mage/pkg/cm"
)

var Cmd = &bonzai.Cmd{
	Name:  `init`,
	Short: `initialize new personal dev environment`,
	Comp:  comp.Cmds,
	Cmds:  []*bonzai.Cmd{AlacrittyCmd, BashCmd, VimCmd, AllCmd},
	Def:   AllCmd,
}

var AlacrittyCmd = &bonzai.Cmd{
	Name:   `alacritty`,
	Short:  `initialize alacritty with bash and gruvbox-material`,
	NoArgs: true,
	Do: func(*bonzai.Cmd, ...string) error {
		return cm.InitAlacritty()
	},
}

var VimCmd = &bonzai.Cmd{
	Name:   `vim`,
	Short:  `initialize vim with gruvbox-material for go dev`,
	NoArgs: true,
	Do: func(*bonzai.Cmd, ...string) error {
		return cm.InitVim()
	},
}

var BashCmd = &bonzai.Cmd{
	Name:   `bash`,
	Short:  `initialize bash for go dev`,
	NoArgs: true,
	Do: func(*bonzai.Cmd, ...string) error {
		return cm.InitBash()
	},
}

var AllCmd = &bonzai.Cmd{
	Name:   `all`,
	Short:  `initialize vim, bash, alacritty`,
	Comp:   comp.Cmds,
	NoArgs: true,
	Do: func(*bonzai.Cmd, ...string) error {
		if err := cm.InitAlacritty(); err != nil {
			return err
		}
		if err := cm.InitBash(); err != nil {
			return err
		}
		if err := cm.InitVim(); err != nil {
			return err
		}
		return nil
	},
}
