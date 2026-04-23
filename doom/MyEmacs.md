# Emacs Cheatsheet 

This is a cheatsheet for my own personal Emacs setup. 

File loc: /home/discovery/Documents/cheat/personal/MyEmacs.md 

To load this cheatsheet:          Ctrl-x M-c (or Tools->Load Cheatsheet)

Note: M = Alt, C = Ctrl

# Basic stuff

Save                              Ctrl-x Ctrl-s
Load/Open                         Ctrl-x Ctrl-f
Undo                              Ctrl-x u (or Ctrl-z in CUA-Mode)
Highlight all text                Ctrl-x h 
Show directory listing            Ctrl-x d 
Cancel a command                  Ctrl-g 
Replace                           M-% (M-SHIFT-5) then press y
Search/Find                       Ctrl-s (Then repeat to go to next occurence)
Indent                            Select text then press TAB
Delete word forward               M-d
Delete word backward              M-del 


# Buffers

Split screen vertically           Ctrl-x 2
Split screen horizontally         Ctrl-x 3
Revert to single screen           Ctrl-x 1
Hide the current screen           Ctrl-x 0
Move to the next screen           Ctrl-x o
Kill the current buffer           Ctrl-x k
Select a buffer                   Ctrl-x b
Run lisp command                  Ctrl-x Ctrl-e (after the code)

# Navigation (back, forward)

Character                         Ctrl-b, Ctrl-f
Word                              M-b, M-f
Line                              Ctrl-p, Ctrl-n 
Sentence                          M-a, M-e 
Paragraph                         M-{, M-} 
Function                          Ctrl-M-a, Ctrl-M-e
Line (very useful!)               Ctrl-a, Ctrl-e
Goto line number                  M-x goto-line 


# My own tools

Delete a whole line               M-9 
Assemble C64 ASM                  Ctrl-c Ctrl-a 
Open a shell                      M-x vterm 
Quit a process in shell           Ctrl-q Ctrl-c (This is very important!)
Load this cheatsheet              Ctrl-x M-c (or Tools->Load Cheatsheet)


# Basic toggles 

Toggle line wrap                  M-x visual-line-mode 
Word wrap                         M-x toggle-word-wrap
Spell checking                    M-x flyspell-mode
Line numbers                      M-x linum-mode 

# Other 

Compile                           M-x compile 
List packages                     M-x package-list-packages 


# Line numbers

To add line numbers and enable moving to a line with Ctrl-l:

(global-set-key "\C-l" 'goto-line)
(add-hook 'find-file-hook (lambda () (linum-mode 1)))
