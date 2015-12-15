
(provide 'setup-programming-python)

;; Jedi setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
