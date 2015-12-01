;; Setup env for global command is in env path
;; For iMac because global is installed by Port
(when (eq system-type 'darwin)
  (setenv "PATH" (concat (getenv "PATH") ":/opt/local/bin"))
  (setq exec-path (append exec-path '("/opt/local/bin")))
  )


;; Add packages archives
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))

;; Startup pagckage manager.
(package-initialize)

;; Automatically install required packages
;; everytime emacs starts, it will automatically check if those packages are
;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar required/package
  '(
    ;; Autocomplete
    yasnippet
    auto-complete
    ;; themes
    airline-themes
    ;; navgative
    ecb
    ;; c++
    auto-complete-clang
    ))
(dolist (p required/package)
  (when (not (package-installed-p p))
  (package-install p)))


;; Add your modules path
(add-to-list 'load-path "~/.emacs.d/custom/")
;; Set extends filepaths
(add-to-list 'load-path (expand-file-name "~/.emacs.d/plugins/"))

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
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



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
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(yas-global-mode t)

;;
(require 'auto-complete-clang)

;;
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

;; Highlight pairs of parentheses and other characters
(show-paren-mode 1)
;(setq show-parent-delay 0)

;; auto close bracet insert
(electric-pair-mode 1)

;; Load custom modules
(require 'setup-faces)
(require 'setup-files)
(require 'setup-editing)
(require 'setup-convenience)


;; Language settings
(require 'setup-programming-cpp)
