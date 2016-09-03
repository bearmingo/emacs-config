(provide 'setup-programming-cpp)

;; Set default style
(setq c-default-style "linux"
      c-basic-offset 4)

;; Load and initialize plugins for c++
;; ==================================================
;; auto complete fro clang
;; -------------------------------

;; Setup env for global command is in env path
;; For iMac because global is installed by Port
(when (eq system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
  (setq exec-path (append exec-path '("/opt/local/bin")))
  )


(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)




