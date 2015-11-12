(provide 'setup-files)

(setq large-file-warning-threshold 100000000) ; Size in bytes

;; Backup
(defvar backup-directory "~/.emacs-backups")
(if (not (file-exists-p backup-directory))
    (make-directory backup-directory t))
(setq
 make-backup-files t			; Backup a file the first name it is saved
 backup-directory-alist `((".*" . , backup-directory)) ; Save backup file in ./.emacs-backups
 backup-by-copying t				       ; Copy the current file into backup directory
 version-control t				       ; Version numbers for backup files
 delete-old-versions t				       ; Delete unnecessary versions
 kept-old-versions 6				       ; oldest versions to keep when a new numbered backup is made (default: 2)
 kept-new-versions 9				       ; Newest versions to keep when a new numbered backup is made (default: 2)
 auto-save-default t				       ; Auto-save every buffer visits a file
 auto-save-timeout 20				       ; Number of seconds idle time before auto-save (default: 30)
 auto-save-interval 200				       ; Number of keystrokes between auto-saves (default 300)
 )


;; Dired

;; Automatically refresh dired buffer on changes
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; If it is not Windows, use the following listing switches
;; (when (not (eq system-type 'windows-nt))
;;   (setq dired-listing-switches "-lha --group-directories-first"))
