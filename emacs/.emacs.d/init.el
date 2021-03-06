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
  (package-install'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq use-package-always-ensure t)

;;; general ui settings
;; (when (find-font (font-spec :name "Gohufont"))
;;   (set-frame-font "GohuFont 14"))

(add-to-list 'default-frame-alist
	     '(font . "Fira Code 14"))

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
(setq scroll-conservatively most-positive-fixnum)

(setq sentence-end-double-space nil)

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

(electric-pair-mode 1)

(use-package evil
  :config
  (evil-mode 1))

(use-package evil-surround
  :config (global-evil-surround-mode 1))

(use-package rainbow-delimiters
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

(use-package rainbow-mode)

(use-package powerline
  :disabled t
  :config
  (powerline-default-theme)
  (setq powerline-default-separator 'wave))

(use-package spaceline-config
  :ensure spaceline
  :config
  (setq powerline-default-separator 'wave
	spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-helm-mode)
  (spaceline-spacemacs-theme)
  )

(use-package magit)
(use-package evil-magit)

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t
	  undo-tree-visualizer-diff t)))

;; (use-package ido
;;   :config
;;   (ido-mode 1)
;;   (ido-everywhere 1))

;; (use-package ido-ubiquitous
;;   :config
;;   (ido-ubiquitous-mode 1))

;; (use-package ido-vertical-mode
;;   :config
;;   (ido-vertical-mode 1))

(use-package helm
  :diminish helm-mode
  :config
  (require 'helm-config)

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)

  (setq helm-M-x-fuzzy-match t)

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
  (helm-autoresize-mode 1)
  (helm-mode 1))

(use-package company
  :diminish company-mode
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 2)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package emmet-mode
  :defer t
  :init
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package recentf
  :config
  (recentf-mode t)
  (global-set-key (kbd "C-x C-r") 'recentf-open-files))

;; (use-package smex
;;   :bind (("M-x" . smex)
;; 	 ("M-X" . smex-major-mode-commands))
;;   :config
;;   (smex-initialize))

(use-package which-key
  :diminish (which-key-mode)
  :config
  (which-key-mode))

(use-package smartparens
  :bind
  (([S-tab] . sp-up-sexp)
   ([backtab] . sp-up-sexp))
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package haskell-mode)

(use-package neotree
  :config
  (setq neo-theme 'arrow
	neo-window-fixed-size nil)
  (global-set-key [f8] 'neotree-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))

(use-package org)

(use-package web-mode
  :mode ("\\.js\\'"
	 "\\.html\\'"
	 "\\.html.*\\'")
  :init
  (setq web-mode-enable-current-element-highlight t)
  :config
  (setq web-mode-enable-auto-pairing t
	web-mode-enable-auto-closing t
	web-mode-enable-auto-expanding t)
  (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
  (add-hook 'web-mode-hook
	    (lambda ()
	      (if (equal web-mode-content-type "jsx")
		  (js2-minor-mode))))
  (set-face-attribute 'web-mode-html-tag-face nil :weight 'bold)
  (set-face-attribute 'web-mode-current-element-highlight-face nil
		      :underline t :background 'unspecified)
  (set-face-attribute 'web-mode-html-attr-name-face nil :slant 'italic))


(use-package rust-mode)

(use-package elixir-mode)

(use-package js2-mode
  :config
  
  (setq js2-highlight-level 3))

(use-package json-mode)

(use-package groovy-mode)

;;; themes
(use-package dracula-theme :disabled)
(use-package gruvbox-theme :disabled)
(use-package apropospriate-theme
  :config
  (setq apropospriate-mode-line-height 1.0))
(use-package color-theme-sanityinc-tomorrow)
(use-package doom-themes)
(use-package flatland-theme)

(load-theme 'sanityinc-tomorrow-night)
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box)

(require 'platform-specific)
(provide 'init)

(server-start)

;;; init.el ends here
