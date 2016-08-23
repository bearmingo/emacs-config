;; Configure plugins

(provide ' setup-plugins)

;; Put downloaded plugins by handle at '.emacs.d/plugins/', so add this
;; path to load-path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))

;; load all subdirectories to load path
(let ((default-directory "~/.emacs.d/plugins/"))
  (normal-top-level-add-subdirs-to-load-path))

;; Initialized package manage, so I can use this to install plugins
;; ==============================================================
;; Add packages archives
(require 'package)
;; There are some problems using the https location with Emacs on Windows.
;; There is currently no know easy fix for this. You can still use MELPA
;; by using the non-SSL location by replacing https with http
(if (eq system-type 'windows-nt)
    (add-to-list 'package-archives
         '("mepla" . "http://melpa.org/packages/"))
  (add-to-list 'package-archives
           '("mepla" . "https://melpa.org/packages/")))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-achives
           '("gnu" . "http://elpa.gnu.org/packages")))

;; Startup pagckage manager.
(package-initialize)

;; Automatically install required packages
;; everytime emacs starts, it will automatically check if those packages are
;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar required/package
  '(
    yasnippet                           ; template engine
    auto-complete                       ; auto complete
    airline-themes                      ; themes
    ecb                                 ; navgation
    auto-complete-clang                 ; c++
    markdown-mode
    ggtags
    ))
(dolist (p required/package)
  (when (not (package-installed-p p))
    (package-install p)))


;; Load or initialize commen plugins
;; =============================================================================

;; ggtags package
(add-hook 'c-model-common-hook
          (lambda ()
            (when (dervied-mode-p 'c-mode 'c++mode 'java-mode 'asm-mode)
              (ggtabs-mode 1))))

(add-hook 'dired-mode-hook 'ggtags-mode)


;; Open auto complete default
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/elpa/auto-complete-20150618.1949/dict/")


;; yasnippet
;; -----------------------------------------------------------------------------
;; (require 'yasnippet)
;; (yas-global-mode t)

;; company
;; ----------------------------------
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; markdown-mode.el
;; -----------------------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; gyp-model
;; -----------------------------------------------------------------------------
(require 'gyp)

