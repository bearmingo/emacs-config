
(provide 'setup-programming-python)

;; Jedi setting
;; This require `company-jedi` package
(defun my/jedi-mode-setup-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/jedi-mode-setup-hook)
(setq jedi:complete-on-dot t)
