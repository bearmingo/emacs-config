(provide 'setup-convenience)

;; hippie-expand replace dabbrev-expand
(global-set-key (kbd "M-/") 'hippie-expand) ; replace dabbrev-expand
(setq
 hippie-expand-try-functions-list
 '(try-expand-dabbrev			; Try to expand word 'dynamically', search the current buffer
   try-expand-dabbrev-all-buffers	; Try to expand word 'dynamically', search all other buffer
   try-expand-dabbrev-from-kill		; Try to expand word 'dynamically', search the kill ring
   try-complete-file-name-partially	; Try to complete text as a file name, as many characters as uniqeu
   try-complete-file-name		; Try to complete text as file name
   try-expand-all-abbrevs		; Try to expand word before point according to all abbrev tables.
   try-expand-list			; Try to complete the current line to an entire line in the buffer.
   try-expand-line                      ; Try to complete the current line to an entire line in the buffer. 
   try-complete-lisp-symbol-partially   ; Try to complete as an Emacs Lisp symbol, as many characters as unique.
   try-complete-lisp-symbol)            ; Try to complete word as an Emacs Lisp symbol.
 )

;; HL line
(global-hl-line-mode)

;; IBuffer
(setq ibuffer-use-other-window t)	; Always display ibuffer in another window

;; Linum
(add-hook 'prog-mode-hook 'linum-mode)	; Enable linum only in programming modes

;; Whitespace
;; Whenever you create useless whitespace, the whitespace is highlighted
(add-hook 'prog-mode-hook (lambda() (interactive) (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
;; (global-set-key (kbd "C-c w") 'whitespace-mode)
