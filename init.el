


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(inhibit-startup-screen t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (defadvice package-compute-transaction
  (before package-compute-transaction-reverse (package-list requirements) activate compile)
    "reverse the requirements"
    (setq requirements (reverse requirements))
    (print requirements))
;;enables smart tab
(define-key read-expression-map [(tab)] 'hippie-expand)

(defun hippie-unexpand ()
  (interactive)
  (hippie-expand 0))

(define-key read-expression-map [(shift tab)] 'hippie-unexpand)

;;get rid of annoyance
(put 'overwrite-mode 'disabled t)
;;use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;;Or set the title bar to show file name if available, buffer name otherwise
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;Additional ‘C-c LETTER’ key bindings for useful commands
  (global-set-key "\C-cg" 'goto-line)
  (global-set-key "\C-cG" 'goto-char)
  (global-set-key "\C-cw" 'delete-region) ; ala C-w and M-C-w
  (global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

;;Display or insert the current date and time

  (defun date (&optional insert)
    "Display the current date and time.
  With a prefix arg, INSERT it into the buffer."
    (interactive "P")
    (funcall (if insert 'insert 'message)
             (format-time-string "%a, %d %b %Y %T %Z" (current-time))))
;;save money on wrist surgery bills
(global-set-key "\C-b" 'compile)
(setq compile-command "catkin build")

;;emacs fun
(defconst animate-n-steps 3) 
  (defun emacs-reloaded ()
    (animate-string (concat ";; Initialization successful, welcome to "
  			  (substring (emacs-version) 0 16)
			  ".")
		  0 0)
    (newline-and-indent)  (newline-and-indent))
  (add-hook 'after-init-hook 'emacs-reloaded)  

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;;colortheme
(add-to-list 'load-path "~/.emacs.d/google")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(require 'color-theme)
(require 'color-theme-solarized)
(load-theme 'solarized t)
(color-theme-initialize)
(color-theme-solarized-dark)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
