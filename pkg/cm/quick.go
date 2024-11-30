package cm

func QuickRefShell() string {
	return `
clear - clear the screen                pwd - print working (current) dir
ls - list stuff here                    ls -l - list stuff with permissions
ls -l hi - list hi's permissions        ls -a - list all, even hidden
mkdir bin - make a bin dir              mkdir -p go/src/robmuh - create many dirs
touch hello - create empty hello file   w - show what users are on and doing
cd bin - change to bin dir              cd .. - change dir to parent
cd - change current dir to home         cd ~bob - change dir to bob's home
cd -  - change most recent dir          passwd - change your password
mv hello bin - move into bin/           cp hi bin - copy hi to bin/hi
rm hello - remove file hello            rm -r foo - remove foo and all in
mv hello hello1 - rename to hello1      chmod +x hello - make executable
history - show your command history     history | more - page history (q=quit)
find . | more - show dirs and subdirs   tree - show dirs and subdirs (pretty)
which ls - see which ls is run          type path - see what path command is
echo $PATH - print PATH env var         path - show prettier path
<ctrl>-[ - same as <esc>                <ctrl>-c - cancel something running
tmux a - begin using tmux               vi hello - edit the hello file
./hello - run hello (outside bin)       hello - run hello (if hello in bin)
colors - show solarized colors table    exit - exit tmux or ssh or terminal

(vi) hjkl - move around, } - next paragraph, :5 - line 5, G - end of file
(vi) tp - to p, ctp - change to p, cw - change word, ea - ins after word
(vi) <ctrl>-[ - COMMAND mode, u - undo, . - repeat, 5. - repeat 5 times,
(vi) i - insert here, I - insert start of line, A - add to line, x - delete
(vi) o - add line, yy/dd - yank (copy)/delete line, p - paste, c - change
(vi) :w - write, :r - read, :wq|ZZ|:x- write and quit, :q! - force quit
(vi) >>/<< - indent/outdent, /word - find, n - find next, N - find previous
`
}

func QuickRefVim() string {
	return `
hjkl - move around, } - next paragraph, :5 - line 5, G - end of file
tp - to p, ctp - change to p, cw - change word, ea - ins after word
<ctrl>-[ - COMMAND mode, u - undo, . - repeat, 5. - repeat 5 times,
i - insert here, I - insert start of line, A - add to line, x - delete
o - add line, yy/dd - yank (copy)/delete line, p - paste, c - change
:w - write, :r - read, :wq|ZZ|:x- write and quit, :q! - force quit
>>/<< - indent/outdent, /word - find, n - find next, N - find previous
`
}
