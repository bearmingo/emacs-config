(provide 'setup-editing)

;; GROUP: Editing Basics
(setq global-mark-ring-max 5000		; Increase mark ring to contains 5000 entries
      mark-ring-max 5000		; Increase kill ring to contains 5000 entries
      mode-require-final-newline t	; Add a newline to end of file
      )

;; Default to 4 visible spaces to display a tab
(setq-default tab-width 4)

;; Set coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")

(prefer-coding-system 'utf-8)
(when (eq system-type 'windows-nt)
  (prefer-coding-system 'cp936))

(setq-default indent-tabs-mode nil)
(delete-selection-mode)
(global-set-key (kbd "RET") 'newline-and-indent)

;; GROUP: Editing -> Killing
(setq
 kill-ring-max 5000			; Increase kill-ring capacity
 kill-whole-line t			; if nil, kill whole line and move the next line up
 )

;; Show import whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda ()
			    (setq-local whitespace-style
					'(face
					  tabs
					  tab-mark
					  spaces
					  space-mark
					  trailing
					  indentation::space
					  indentation::tab
					  newline
					  newline-mark))
			    (whitespace-mode 1)))


(defun newline-above-current()
  "Add a line above current link vim O."
  (interactive)
  (progn (beginning-of-line)
         (open-line 1)
         (indent-according-to-mode)))

(defun newline-next-current()
  "Add a line next current link link vim o."
  (interactive)
  (progn (end-of-line)
         (newline-and-indent)))

(global-set-key (kbd "C-o") 'newline-next-current)
(global-set-key (kbd "C-S-o") 'newline-above-current)
