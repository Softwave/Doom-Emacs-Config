;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Load files in DOOM folder
(add-to-list 'load-path "~/.config/doom/")

(add-to-list 'custom-theme-load-path "~/.doom.d/themes/")


;; Enabling cua mode
(cua-mode 1)
(setq cua-enable-cua-keys t)
;; Some other stuff
(global-font-lock-mode 1)

;; Enable menu bar
(menu-bar-mode 1)
(after! doom
  (tool-bar-mode 1))
(setq tool-bar-style 'text)
(scroll-bar-mode 1)
;;(tab-bar-mode 1)

;;(setq doom-fallback-font "monospace")


;; GitHub Copilot Config
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-idle-delay 0.5)
  (add-to-list 'copilot-disable-predicates
               (lambda () (derived-mode-p 'org-mode 'text-mode)))
  (map! :map copilot-completion-map
        "<tab>" #'copilot-accept-completion
        "TAB" #'copilot-accept-completion
        "C-<tab>" #'copilot-accept-completion-by-word
        "C-f" #'copilot-accept-completion
        "M-n" #'copilot-next-completion
        "M-p" #'copilot-previous-completion))

(use-package! gh-copilot-chat
  :after (request org markdown-mode)
  :config
  (setq copilot-chat-frontend 'markdown)) ; or 'markdown

;; (global-set-key (kbd "C-c C-o") #'copilot-mode)
;; (global-set-key (kbd "C-c C-c") #'copilot-complete)

;; ;; Copilot Keybindings
;; (map! :leader
;;       :desc "Copilot chat" "c c" #'copilot-chat) ;; Ctrl-c c c to enter chat
;; (global-set-key (kbd "C-c C-o") #'copilot-mode) ;; Ctrl-c ctrl-o to toggle copilot mode
;; (keymap-set copilot-completion-map "C-f" #'copilot-accept-completion)

;; My personal keybindings
(global-set-key (kbd "M-9") 'kill-whole-line) ;; Delete whole line on alt-9

;; Force toolbar
(add-hook 'after-init-hook
          (lambda ()
            (tool-bar-mode 1)
            (menu-bar-mode 1)
            (scroll-bar-mode 1)))


;; Disable the bolding and italic modern font stuff
(setq doom-themes-enable-bold nil
      doom-themes-enable-italic nil)

;; Set the theme 
;;(setq doom-theme 'spaceworm92)
;(setq doom-theme 'Spaceworm92)
(setq doom-theme 'softwave)


;; LSP Mode
(after! lsp-mode
  (setq lsp-semantic-tokens-enable t))

;; Basic indent settings
(setq c-basic-offset 4)
(setq-default tab-width 4)
(setq c-default-style "bsd")
(setq indent-tabs-mode nil) ;; or t if you prefer tabs

;; Colorful mode for color codes
(use-package! colorful-mode
  :hook (prog-mode . colorful-mode))

;; C/C++ Mode 
;;(after! cc-mode
;;  (setq c-default-style "bsd") ;; closest built-in to Allman
;;  (setq c-basic-offset 4))

;; Scroll in company mode
;; Enable mouse wheel scrolling in company mode popup
(with-eval-after-load 'company
  (define-key company-active-map (kbd "<mouse-4>") #'company-select-previous)
  (define-key company-active-map (kbd "<mouse-5>") #'company-select-next)
  (define-key company-active-map (kbd "<wheel>-up") #'company-select-previous)
  (define-key company-active-map (kbd "<wheel>-down") #'company-select-next))
(pixel-scroll-precision-mode 1)
;; Fix auto scroll stuff 
(setq auto-hscroll-mode nil)
;;
(setq hscroll-margin 0)
(setq hscroll-step 1)
(setq scroll-conservatively 101)
(setq scroll-margin 3)
(after! company
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1))
(setq-default truncate-lines t)
(after! company
  (setq company-tooltip-limit 200))

(after! company
  (setq company-transformers '(company-sort-by-occurrence)))

;; Colourful mode
(use-package! colorful-mode
  :hook (prog-mode . colorful-mode))




;; Nyan mode
(nyan-mode)
(nyan-toggle-wavy-trail)
;;(setq nyan-wavy-trail t nyan-minimum-window-width 1 nyan-bar-length 12)
;;(setq nyan-bar-length 24)
(setq nyan-bar-length 48)
(nyan-start-animation)
(setq nyan-minimum-window-width 0)

(use-package! whitespace
  :config
  (setq
    global-whitespace-mode nil))

;; Which function
;; No indent thingies
(setq whitespace-style nil)

;; Fonts 
(run-with-idle-timer
 0.5 nil
 (lambda ()
   (set-frame-font "Mx437 IBM BIOS-2y-12" nil t)
   ;;(set-frame-font "-ibm-ega-normal-r-normal--14-100-96-96-c-90-iso10646-1" nil t)
   (setq whitespace-style nil)
   (global-whitespace-mode -1)))



;; Disable font scaling
(setq-default text-scale-mode-amount 0)

;; GLSL Mode
(use-package! glsl-mode
  :mode ("\\.glsl\\'" "\\.frag\\'" "\\.vert\\'" "\\.fs\\'" "\\.vs\\'"))

;; KickAssembler Mode for Commodore 64 programming
(add-to-list 'load-path "~/.config/doom/lisp")
(require 'kickasm-mode)

(defun my-assemble-to-prg ()
  "Assemble the current buffer into a .prg file using Kick Assembler."
  (interactive)
  (let* ((source-file (buffer-file-name))
         (output-file (concat (file-name-sans-extension source-file) ".prg"))
         (command (format "%s %s -o %s -vicesymbols -debugdump"
                          kickasm-command
                          source-file
                          output-file)))
    (compile command)
    (message "Assembling to %s..." output-file)))
(define-key global-map (kbd "C-c C-a") 'my-assemble-to-prg)

;; Set the assemble command
(setq kickasm-command "java -jar /home/discovery/Apps/KickAssembler/KickAss.jar")

;; Emacs Cheatsheet
;; Load cheatsheet
(defun my-load-cheat ()
  "Load and display the cheatsheet"
  (interactive)
  (find-file "/home/discovery/.config/doom/MyEmacs.md"))
(global-set-key (kbd "C-x M-c") 'my-load-cheat)
;; Add menu item to tools menu
(define-key-after
  global-map
  [menu-bar tools my-load-cheat]
  '("Load Cheatsheet" . my-load-cheat)
  'compile)

;; Reset font command
;;(defun reset-font-orig ()
;;  "Resets the font if something's gone wrong"
;;  (interactive)
;;  (set-frame-font "Mx437 IBM BIOS-2y-12" nil t))
;;(define-key-after
;;  global-map
;;  [menu-bar tools reset-font-org]
;;  '("Reset Font" . reset-font-orig)
;;  'compile)


;; Modeline colours
(provide 'modeline-stuff)
;;; modeline-stuff.el ends here
(after! doom-modeline
  (setq doom-modeline-check-icon nil)
  (custom-set-faces!
    '(doom-modeline-info :foreground "light green") ;; light green (PaleGreen)
    '(doom-modeline-buffer-modified :foreground "indian red") ;; your indian red
    '(doom-modeline-buffer-file :foreground "#ffffff")
    '(doom-modeline-buffer-path :foreground "#cccccc")
    '(doom-modeline-buffer-modification-icon :foreground "medium purple")
    '(doom-modeline-mode :foreground "#cccccc")))

(custom-set-faces!
  '(mode-line :background "#000000" :foreground "#dddddd")
  '(mode-line-inactive :background "#111111" :foreground "#888888"))

;; Just get rid of modeline icons, it doesn't match our awesome retro aesthetic, yo
(setq doom-modeline-icon nil)

;; Make vterm respond to Ctrl-c Ctrl-c
(after! vterm
  (map! :map vterm-mode-map
        :i "C-c C-c" #'vterm-send-C-c
        :i "C-c"     #'vterm-send-C-c))
;; Disable copilot in VTerm
;; (after! vterm
;;   (add-hook 'vterm-mode-hook (lambda () (copilot-mode -1))))

;;
;; Disable current line highlight everywhere
(remove-hook 'prog-mode-hook #'hl-line-mode)
(remove-hook 'text-mode-hook #'hl-line-mode)
(remove-hook 'conf-mode-hook #'hl-line-mode)

(global-hl-line-mode -1)

(custom-set-faces!
  '(hl-line :background nil))


;; Don't yell at me when I wanna leave lol
(setq confirm-kill-emacs nil)

;; Silence annoying warnings
;; Later on if we need it we can add
;; '(add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2))' to it
;; but for now just shut it up
(add-to-list 'warning-suppress-types '(copilot))

