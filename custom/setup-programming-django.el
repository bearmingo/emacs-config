(provide 'setup-programming-django)

;; Javascript
(defun django-javascript-mode-hook()
  (setq indent-tabs-mode t
        tab-width 2                     ; 2 space for tab
        js-indent-level 2               ; 2 space for indent
        ))

(add-hook 'javascript-mode-hook 'django-javascript-mode-hook)


;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(defun django-web-mode-hook()
  "Hook for web-mode."
  (setq web-mode-markup-indent-offset 2)
  )

(add-hook 'web-mode-hook 'django-web-mode-hook)
