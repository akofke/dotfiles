;;; init.el --- emacs init file

; do these first to prevent flashing on startup
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path (concat user-emacs-directory "init"))

;;; package.el setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; use-package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq use-package-always-ensure t)

;;; misc ui settings
(set-frame-font "GohuFont 14")

(blink-cursor-mode -1)

(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)
(show-paren-mode t)
(global-hl-line-mode t)

; Use Shift-arrowkeys to move between windows
(windmove-default-keybindings)

(setq custom-file (concat user-emacs-directory "init/custom.el")
      inhibit-splash-screen t
      make-backup-files nil)

;;; packages

(use-package evil
  :config
  (evil-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(use-package powerline
  :config
  (powerline-evil-center-color-theme)
  (setq powerline-default-separator 'wave))

(use-package powerline-evil)

(use-package magit)
(use-package evil-magit)

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t
	  undo-tree-visualizer-diff t)))

(use-package ido
  :config
  (ido-mode 1))

(use-package smex
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands))
  :config
  (smex-initialize))

(use-package which-key
  :diminish (which-key-mode)
  :config
  (which-key-mode))

;;; themes
(use-package solarized-theme :defer)
(use-package color-theme-sanityinc-tomorrow :defer)
(use-package dracula-theme :defer)

(load-theme 'dracula t)

(provide 'init)

;;; init.el ends here
