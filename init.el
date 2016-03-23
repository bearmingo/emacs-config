;; Add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")

;;
;; Packages
;;

;; load all subdirectories to load path
;; (let ((default-directory "~/.emacs.d/packages/"))
;;   (normal-top-level-add-subdirs-to-load-path))

;; ecb settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes
   (quote
    ("beeb5ac6b65fcccfe434071d4624ff0308b5968bf2f0c01b567d212bcaf66054" default)))
 '(ecb-layout-window-sizes nil)
 '(ecb-options-version "2.40")
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; English fonts
(set-face-attribute
 'default nil :font "Monaco 11")
 ;; Chinese fonts
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft Yahei" :size 14)))
                    
;; Load custom modules
(require 'setup-plugins)
(require 'setup-faces)
(require 'setup-files)
(require 'setup-editing)
(require 'setup-convenience)


;; Language settings
(require 'setup-programming-cpp)
(require 'setup-programming-python)
(require 'setup-programming-chromium)
