;;<Options>
(show-paren-mode 1)
(setq-default indent-tabs-mode nil
              tab-always-indent nil
              tab-width 2
              ring-bell-function 'ignore
              display-buffer-alist '(("*" (display-buffer-same-window)))
              display-line-numbers t
              line-number-mode t
              column-number-mode t
              size-indicator-mode t
              default-tramp-method "ssh"
              tramp-adb-connect-if-not-connected t
              dired-dwim-target t
              show-paren-style 'parenthesis)
(global-prettify-symbols-mode 1)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq-default sh-basic-offset 2
              ess-fancy-comments nil)
(setq scheme-program-name "chezscheme"
      make-backup-files nil
      initial-major-mode 'text-mode)
(setenv "TERM" "vt-100")

;;(defun my-icomplete-styles ()
;;  (setq-local completion-styles '(substring initials)))
;;(add-hook 'icomplete-minibuffer-setup-hook 'my-icomplete-styles)
;;(fido-vertical-mode 1)
;;(setq fido-mode t)
(auto-insert-mode)
(setq auto-insert 'umodified
      auto-insert-query nil)
(let ((dir "~/.emacs.d/templates/"))
  (setq auto-insert-directory dir)
  (mapc (lambda (x) (define-auto-insert (concat "\\." (substring  x 9)) x))
        (seq-filter (apply-partially #'string-prefix-p "template")
                    (directory-files dir))))
(setq whitespace-line-column 80
      whitespace-style '(face trailing lines))
(global-whitespace-mode t)
;;<Font>
;;(set-face-attribute 'default t :font "Unifont" :height 120)
(set-fontset-font "fontset-default" 'unicode "Code New Roman")
(set-face-attribute 'default nil :font "Code New Roman"
                    :height 140 :weight 'regular)
(set-face-attribute 'default t :font "Code New Roman"
                    :height 140 :weight 'regular)
(custom-set-faces
 '(default ((t (:inherit nil :height 140 :family "Code New Roman")))))
;;(set-face-attribute 'default nil :font "DejaVu Sans Mono" :height 110
;;:weight 'bold)
;;(set-face-attribute 'default nil :font "Unifont" :height 120)
;;</Font>

;;<Modeline>
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-time-mode 1)
(setq-default display-time-format "%A %d/%m/%y %T")
(setq-default fringe-mode nil)

(setq-default mode-line-format
							'("%e"
								"%* "
								"%l:"
								"%c"
								mode-line-front-space
								mode-line-frame-identification
								mode-line-buffer-identification
								"  "
								mode-line-modes
								"  "
								(vc-mode vc-mode)
								))

;;default
;;("%e" mode-line-front-space mode-line-mule-info mode-line-client eshell-command-running-string mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag
;;(vc-mode vc-mode)
;;"  " mode-line-modes mode-line-misc-info mode-line-end-spaces)

;;</Modeline>
;;</Options>


