package quick

import (
	"github.com/rwxrob/bonzai"
	"github.com/rwxrob/bonzai/term"
	"github.com/rwxrob/code-mage/pkg/cm"
)

var Cmd = &bonzai.Cmd{
	Name:  `quick`,
	Alias: `q`,
	Short: `one-screen cli quick reference`,
	Do: func(*bonzai.Cmd, ...string) error {
		term.Print(cm.QuickRef())
		return nil
	},
}
