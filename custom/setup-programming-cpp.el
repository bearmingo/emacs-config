(provide 'setup-programming-cpp)

;; Set default style
(setq c-default-style "linux"
      c-basic-offset 4)

;; Load and initialize plugins for c++
;; ==================================================
;; auto complete fro clang
;; -------------------------------
(require 'auto-complete-clang)

(add-hook 'c-mode-common-hook '(lambda ()

          ;; ac-omni-completion-sources is made buffer local so
          ;; you need to add it to a mode hook to activate on
          ;; whatever buffer you want to use it with.  This
          ;; example uses C mode (as you probably surmised).

          ;; auto-complete.el expects ac-omni-completion-sources to be
          ;; a list of cons cells where each cell's car is a regex
          ;; that describes the syntactical bits you want AutoComplete
          ;; to be aware of. The cdr of each cell is the source that will
          ;; supply the completion data.  The following tells autocomplete
          ;; to begin completion when you type in a . or a ->

          (add-to-list 'ac-omni-completion-sources
                       (cons "\\." '(ac-source-semantic)))
          (add-to-list 'ac-omni-completion-sources
                       (cons "->" '(ac-source-semantic)))

          ;; ac-sources was also made buffer local in new versions of
          ;; autocomplete.  In my case, I want AutoComplete to use
          ;; semantic and yasnippet (order matters, if reversed snippets
          ;; will appear before semantic tag completions).

          (setq ac-sources '(ac-source-semantic ac-source-yasnippet))
          ))



;; Setup env for global command is in env path
;; For iMac because global is installed by Port
(when (eq system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
  (setq exec-path (append exec-path '("/opt/local/bin")))
  )


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-common-hook 'my-c-code-common-hook)



