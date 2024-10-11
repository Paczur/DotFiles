;;<PackageOptions>
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(require 'use-package)

(setq use-package-always-defer t
      use-package-always-ensure t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;;</PackageOptions>

;;<Packages>
;;<Languages>
(use-package scala-mode
	:interpreter
	("scala" . scala-mode))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package haskell-mode)
(use-package racket-mode)
;;</Languages>

;;<Evil>
(use-package evil
  :demand t
  :init (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-redo)
  (setq evil-move-beyond-eol t)
  :custom (evil-shift-width 2)
  :config
  (evil-set-initial-state 'term-mode 'emacs)
  (define-key evil-insert-state-map (kbd "C-l") (lambda () (interactive) (insert "λ")))
	(evil-mode 1))


(use-package evil-collection
	:after evil
	:ensure t
	:config
	(evil-collection-init))

(use-package evil-cleverparens)
;;</Evil>

;;<Misc>
(use-package modus-themes
  :ensure
  :init
  (setq modus-themes-slanted-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region 'no-extend)

  ;; Load the theme files before enabling a theme
  (modus-themes-load-themes)
  :config
  ;; Load the theme of your choice:
  (modus-themes-load-vivendi))

(use-package smartparens)
(use-package aggressive-indent)
(use-package shx)

;;<PackageConfig>
(require 'haskell-mode)
(setq haskell-interactive-popup-errors nil)

(require 'aggressive-indent)
(aggressive-indent-global-mode 1)

(add-hook 'smartparens-enabled-hook #'evil-cleverparens-mode)

(require 'smartparens)
(require 'smartparens-config)
(setq smartparens-global-mode t)
;;</PackageConfig>
;;</Misc>
;;</Packages>
