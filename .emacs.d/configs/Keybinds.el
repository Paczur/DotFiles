;;<Keybinds>
;;<Helper>
(setq mod "s-")
(defun key (k)
  (kbd (concat mod k)))

(require 'exwm)
(require 'exwm-config)
(defun bind (k w)
  (define-key exwm-mode-map (key k) w)
  (global-set-key (key k) w))
(defun unbind (k)
  (define-key exwm-mode-map (kbd k) nil)
  (global-unset-key (kbd k)))
;;</Helper>

;;<Buffers>
(defun x-user-buffer (func)
  (let ((i 0))
    (progn (funcall func)
	   (while (< i (length (buffer-list)))
	     (if (not (user-buffer-q))
		 (progn  (funcall func)
			 (setq i (1+ i)))
	       (setq i (+ 100 (length (buffer-list)))))))))

(defun previous-user-buffer ()
  (interactive)
  (x-user-buffer #'previous-buffer))

(defun next-user-buffer ()
  (interactive)
  (x-user-buffer #'next-buffer))

(defun user-buffer-q ()
  (interactive)
  (let ((buffer (buffer-name)))
    (or
     (not (string-equal "*" (substring buffer 0 1)))
     (string-equal "*Racket REPL*" buffer)
     (string-equal "*scheme*" buffer)
     (string-equal "*shx*" (substring buffer 0 5))
     (string-equal "*Man " (substring buffer 0 5))
     (string-equal "*sbt*" (substring buffer 0 5))
     (string-equal "*EXWM" (substring buffer 0 5))
     (string-equal "*WoMan " (substring buffer 0 7))
     (string-equal "*eshell*" (substring buffer 0 8)))))


(defun select-window-with-buffer (name)
  (select-window (get-buffer-window name)))

(defun buffer-exists (name)
  (not (equal (get-buffer name) nil)))

(defun window-exists (buffer-name)
  (not (equal (get-buffer-window buffer-name) nil)))

(defmacro compile-buffer (buffer command mode &optional again after-everything)
  (let ((split (if (= mode 1) '(split-window-vertically) '(split-window-horizontally)))
        (move (if (= mode 1) '(windmove-down) '(windmove-right)))
        (amove (if (= mode 1) '(windmove-up) '(windmove-left))))
    `(if (and (buffer-exists ,buffer) (window-exists ,buffer))
         (let ((current-buffer (buffer-name)))
				   (select-window-with-buffer ,buffer)
				   (switch-to-buffer current-buffer)
				   ,command
           (select-window-with-buffer current-buffer)
           ,again
           (select-window-with-buffer ,buffer)
           ,after-everything)
       (progn ,split
              ,move
		          ,command
              ,amove
              ,again
              ,move
              ,after-everything))))

(defmacro compile-def (map buffer command &optional again after-everything)
  `(progn (define-key ,map (kbd "<f5>") (lambda () (interactive) (compile-buffer ,buffer ,command 0 ,again ,after-everything)))
          (define-key ,map (kbd "<f6>") (lambda () (interactive) (compile-buffer ,buffer ,command 1 ,again ,after-everything)))))

;;</Buffers>

;;<Global>
;;(unbind "C-c")
;;(bind "r" 'dmenu)
;;(bind "f" 'exwm-layout-toggle-fullscreen)
(bind "v" 'split-window-vertically)
(bind "b" 'split-window-horizontally)
(bind "h" 'windmove-left)
(bind "l" 'windmove-right)
(bind "k" 'windmove-up)
(bind "j" 'windmove-down)
(bind "Q" 'kill-current-buffer)
(bind "q" 'delete-window)
;;(bind "RET" (lambda () (interactive) (start-process-shell-command "xterm" "*xterm*" "xterm -ti v340")))
(bind "H" 'previous-user-buffer)
(bind "J" 'previous-user-buffer)
(bind "K" 'next-user-buffer)
(bind "L" 'next-user-buffer)
(bind "w" 'shrink-window)
(bind "s" 'enlarge-window)
(bind "a" 'shrink-window-horizontally)
(bind "d" 'enlarge-window-horizontally)
(global-unset-key (kbd "C--"))
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;;</Global>

;;<ModeSpecific>
(require 'racket-mode)
(compile-def racket-mode-map "*Racket REPL*" (racket-run-and-switch-to-repl))

(require 'scala-mode)
(require 'sbt-mode)
(compile-def scala-mode-map (concat "*sbt*<" (sbt:find-root) ">") (sbt-do-run))

(require 'xscheme)
(compile-def scheme-mode-map "*scheme*" (run-scheme "chezscheme") (xscheme-send-buffer))
(define-key scheme-mode-map (kbd "<f4>") 'xscheme-send-region)
(define-key scheme-mode-map (kbd "<f3>") 'xscheme-send-next-expression)

(require 'mpc)
(define-key mpc-mode-map "a" 'mpc-playlist-add)
(define-key mpc-mode-map "d" 'mpc-playlist-delete)
(define-key mpc-mode-map "p" 'mpc-playlist)
;;</ModeSpecific>



;;<Modes>
;;(define-minor-mode resize-mode
;;	"Toggle resize mode."
;;	:lighter " resize"
;;	:keymap
;;	(let ((map (make-sparse-keymap)))
;;		(define-key map (key "w") 'shrink-window)
;;		(define-key map (key "s") 'enlarge-window)
;;		(define-key map (key "a") 'shrink-window-horizontally)
;;		(define-key map (key "d") 'enlarge-window-horizontally)
;;		map))
;;</Modes>
;;</Keybinds>
