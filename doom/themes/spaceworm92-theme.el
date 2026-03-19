(deftheme spaceworm92
  "Retro Spaceworm92 theme (modernized for Doom)")

(custom-theme-set-faces
 'spaceworm92

 ;; Base
 '(default ((t (:background "#000000" :foreground "#e0e0e0"))))
 '(cursor ((t (:background "#ffffff"))))

 ;; Selection / highlight
 '(region ((t (:background "#800040" :foreground "#ffffff"))))
 '(highlight ((t (:background "#202020"))))
 '(hl-line ((t (:background "#101010"))))

 ;; Mode line
 '(mode-line ((t (:background "#5956c8" :foreground "#ffffff" :box nil))))
 '(mode-line-inactive ((t (:background "#101010" :foreground "#888888" :box nil))))

 ;; Minibuffer
 '(minibuffer-prompt ((t (:foreground "#87cefa"))))

 ;; Syntax highlighting
 '(font-lock-comment-face ((t (:foreground "indian red"))))
 '(font-lock-keyword-face ((t (:foreground "indian red")))) ;; reddish
 '(font-lock-function-name-face ((t (:foreground "indian red")))) ;; green
 '(font-lock-variable-name-face ((t (:foreground "indian red")))) ;; yellow
 '(font-lock-type-face ((t (:foreground "cornflower blue")))) ;; cyan
 '(font-lock-string-face ((t (:foreground "cornflower blue"))))
 '(font-lock-negation-char-face ((t (:foreground "medium orchid"))))
 '(font-lock-preprocessor-face ((t (:foreground "#919191"))))
 '(font-lock-constant-face ((t (:foreground "medium purple")))) ;; PURPLE numbers
 '(font-lock-builtin-face ((t (:foreground "cornflower blue"))))

 ;; Preprocessor / macros (important for C)
 '(font-lock-preprocessor-face ((t (:foreground "#ff79c6"))))

 ;; Fringe / UI
 '(fringe ((t (:background "#000000"))))

 ;; Line numbers (if enabled)
 '(line-number ((t (:foreground "#444444" :background "#000000"))))
 '(line-number-current-line ((t (:foreground "#ffffff" :background "#000000"))))
 )

(provide-theme 'spaceworm92)
