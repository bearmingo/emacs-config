(provide 'setup-programming-cpp)

;; Set default style
(setq c-default-style "linux"
      c-basic-offset 4)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-common-hook 'my-c-code-common-hook)



