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
}
