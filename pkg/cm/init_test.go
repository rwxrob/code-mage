package cm_test

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"

	"github.com/rwxrob/code-mage/pkg/cm"
)

func ExampleInitBashRC() {

	switch runtime.GOOS {
	case "darwin", "linux":
	default:
		return
	}

	oldhome := os.Getenv(`HOME`)
	file := filepath.Join(`testdata`, `.bashrc`)

	defer func() {
		os.Setenv(`HOME`, oldhome)
		os.Remove(file)
	}()

	os.Setenv(`HOME`, `testdata`)

	if err := cm.InitBashRC(); err != nil {
		fmt.Println(err)
	}

	buf, err := os.ReadFile(file)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(buf) == cm.BashRC)

	// Output:
	// true

}

func ExampleInitVimRC() {

	switch runtime.GOOS {
	case "darwin", "linux":
	default:
		return
	}

	oldhome := os.Getenv(`HOME`)
	file := filepath.Join(`testdata`, `.vimrc`)

	defer func() {
		os.Setenv(`HOME`, oldhome)
		os.Remove(file)
	}()

	os.Setenv(`HOME`, `testdata`)

	if err := cm.InitVimRC(); err != nil {
		fmt.Println(err)
	}

	buf, err := os.ReadFile(file)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(buf) == cm.VimRC)

	// Output:
	// true

}

/*
func ExampleInitVimPlugins() {

	switch runtime.GOOS {
	case "darwin", "linux":
	default:
		return
	}

	oldhome := os.Getenv(`HOME`)
	file := filepath.Join(`testdata`, `.vim`, `autoload`, `plug.vim`)

	defer func() {
		os.Setenv(`HOME`, oldhome)
		os.Remove(file)
	}()

	os.Setenv(`HOME`, `testdata`)

	if err := cm.InitVimPlugins(); err != nil {
		fmt.Println(err)
	}

	buf, err := os.ReadFile(file)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(buf) == cm.PlugVim)

	// Output:
	// true

}
*/

/*
func ExampleInitAlacritty() {

	switch runtime.GOOS {
	case "darwin", "linux":
	default:
		return
	}

	oldconfdir := os.Getenv(`XDG_CONFIG_HOME`)
	file := filepath.Join(`testdata`, `alacritty`, `alacritty.toml`)

	defer func() {
		os.Setenv(`XDG_CONFIG_HOME`, oldconfdir)
		os.Remove(file)
	}()

	err := os.Setenv(`XDG_CONFIG_HOME`, `testdata`)
	if err != nil {
		fmt.Println(err)
	}

	if err := cm.InitAlacritty(); err != nil {
		fmt.Println(err)
	}

	buf, err := os.ReadFile(file)
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println(string(buf) == cm.AlacrittyTOML)

	// Output:
	// true

}
*/
