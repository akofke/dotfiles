;;;; init.el --- emacs init file

;; do these first to prevent flashing on startup
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; set garbage collection threshold to 20 MB
(setq gc-cons-threshold (* 20 1024 1024))

(add-to-list 'load-path (concat user-emacs-directory "config"))

;; move "custom" settings to its own file 
(setq custom-file (concat user-emacs-directory "custom.el")
      custom-safe-themes t)
(load custom-file t)

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

;;; general ui settings
(when (find-font (font-spec :name "Gohufont"))
  (set-frame-font "GohuFont 14"))

(blink-cursor-mode -1)

(global-linum-mode t)
(column-number-mode t)
(line-number-mode t)
(show-paren-mode t)
(setq show-paren-delay 0.0)
(global-hl-line-mode t)

;; Use Shift-arrowkeys to move between windows
(windmove-default-keybindings)

;; focus the help window when I open it
(setq help-window-select t)

;;; emacs annoyances
(setq inhibit-splash-screen t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; mouse scroll one line at a time
(setq mouse-wheel-follow-mouse 't) ; scroll the window under mouse
(setq scroll-step 1) ; kb scroll one line at a time

;; follow symlinks (in order to use vc functionality). Not sure if this is
;; what I want
(setq vc-follow-symlinks t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; general keybindings
(defun my/open-init-file ()
  "Open the init file"
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c i") 'my/open-init-file)


;;; packages

(use-package evil
  :config
  (evil-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(use-package powerline
  :config
  (use-package powerline-evil)
  (powerline-default-theme)
  (setq powerline-default-separator 'wave))


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
  (ido-mode 1)
  (ido-everywhere 1))

(use-package ido-ubiquitous
  :config
  (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :config
  (ido-vertical-mode 1))

(use-package recentf
  :config
  (recentf-mode t)
  (global-set-key (kbd "C-x C-r") 'recentf-open-files))

(use-package smex
  :bind (("M-x" . smex)
	 ("M-X" . smex-major-mode-commands))
  :config
  (smex-initialize))

(use-package which-key
  :diminish (which-key-mode)
  :config
  (which-key-mode))

(use-package haskell-mode)

(use-package neotree
  :config
  (setq neo-theme 'arrow)
  (global-set-key [f8] 'neotree-toggle))

(use-package web-mode)

;;; themes
(use-package solarized-theme :defer)
(use-package color-theme-sanityinc-tomorrow :defer)
(use-package dracula-theme :defer)
(use-package gruvbox-theme :defer)
(use-package darktooth-theme :defer)
(use-package creamsody-theme :defer)
(use-package doom-themes :defer)
(use-package apropospriate-theme :defer)

(load-theme 'apropospriate-dark t)

(require 'platform-specific)
(provide 'init)

;;; init.el ends here
