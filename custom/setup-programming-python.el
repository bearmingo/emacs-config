
(provide 'setup-programming-python)

;; Jedi setting
(defun jedi-python-mode-hook()
  (message "hook python-mode")
  (add-to-list 'company-backends 'company-jedi)
  (global-set-key (kbd "C-c .") 'jedi:goto-definition)
  (global-set-key (kbd "C-c ,") 'jedi:goto-definition-pop-marker)
  (global-set-key (kbd "C-c d") 'jedi:show-doc)
  ; (define-key map (kbd "<C-tab>") 'jedi:comp)
  )

(add-hook 'python-mode-hook 'jedi-python-mode-hook)
