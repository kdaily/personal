(add-to-list 'load-path "/var/opt/emacs/elisp/")

;; general lisp files for emacs        
(require 'cl)

;; Zeller's version of orgmode
;; (add-to-list 'load-path "/var/opt/emacs/elisp/org-mode/lisp")

;; Standard version of orgmode
;; (setq load-path (cons "/var/preserve/src/org-7.7/lisp" load-path))
(setq load-path (cons "/var/preserve/src/org-7.9.1/lisp" load-path))

(require 'org-latex)

;;; go-to-char
(require 'go-to-char)

;;; find file at point
(require 'ffap)
;; rebind C-x C-f and others to the ffap bindings (see variable ffap-bindings)
(ffap-bindings)
;; C-u C-x C-f finds the file at point
(setq ffap-require-prefix t)

; ------                              
;; Python
;; Write TAB as 4 spaces.
;; ------

(setq python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil) )))

(autoload 'python-mode "/var/opt/emacs/elisp/python-mode.el-6.0.2/python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(autoload 'markdown-mode "/var/opt/emacs/elisp/markdown-mode" "Markdown Mode." t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.[Rr]md\\'" . markdown-mode))

;; ;; Pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")

;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path /var/opt/emacs/elisp/Pymacs/"))

;; emacs-for-python 
(load-file "/var/opt/emacs/elisp/emacs-for-python/epy-init.el")

; end python
; set column mode on                
(column-number-mode)

;;to set background color to black                              
(set-background-color "black")
(set-foreground-color "white")

(set-default-font "9x15")
(set-mouse-color "white")
(set-cursor-color "white")

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; mouse wheel support     
(mwheel-install)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; Require a final newline in a file, to avoid confusing some tools    
(setq require-final-newline t)

;; force pretty text modes
(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode t)

;; insure that the delete keys work correctly   
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; default to unified diffs
(setq diff-switches "-u")

; set default window size (largest possible height on
; my 1400x1050 thinkpad t60 display
;(add-to-list 'default-frame-alist '(height . 65))
;(add-to-list 'default-frame-alist '(width . 80))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "English")
 '(ergoemacs-mode-used "5.8.0")
 '(ergoemacs-theme nil)
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
; '(org-agenda-files (quote ("/mnt/NIH_HOME/DailyKm/CompLabNotebook/notebook.org" "/mnt/NIH_HOME/DailyKm/LabNotebook/LabNotebook.org")))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t))

;; org-mode stuff
(setq org-export-odt-preferred-output-format "doc")
(setq org-export-odt-convert-process "unoconv")

;; (setq org-agenda-files (list "~/or/agenda.org"))
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(global-set-key "\C-cl"  'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-use-speed-commands nil)

(setq org-todo-keywords
           '(;;(sequence "TODO" "|" "DONE")
             (sequence "TODO" "RUNNING" "PROCESSING" "|" "DONE")
             (sequence "PIPELINERUN" "CONFIG" "RUNNING" "|" "FINISHED")
             (sequence "|" "CANCELED")))

(setq org-publish-project-alist
      '(("lab-notebook" 
	 :base-extension "org"
	 :makeindex t))
      )

;; (setq org-publish-project-alist
;;       '(("labnotebook"
;; 	 :base-directory "/home/dailykm/LabNotebook/"
;; 	 :base-extension "org"
;; 	 :publishing-directory "/home/dailykm/LabNotebook/published/"
;; 	 ;; :section-numbers nil
;; 	 ;; :table-of-contents nil
;; 	 :publishing-function org-publish-org-to-pdf
;; 	 ;; :table-of-contents nil
;; 	 ;; :auto-sitemap t
;; 	 ;; :sitemap-title "Lab Notebook"
;; 	 )))

;; To use graphviz-dot-mode
(load-file "/var/opt/emacs/elisp/graphviz-dot-mode.el")
(autoload 'graphviz-dot-mode "/var/opt/emacs/elisp/graphviz-dot-mode" "Graphviz Dot Mode." t)
(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))

(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)


;; Emacs speaks statistics!
(load "/var/opt/emacs/elisp/ESS/trunk/lisp/ess-site.el")
;; change assignment operator shortcut                              
(ess-toggle-underscore nil)
(ess-toggle-S-assign-key t)

;; cdlatex mode
;; (load "/var/opt/emacs/elisp/texmathp.el")
;; (load "/var/opt/emacs/elisp/cdlatex.el")

;; reftex mode
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c )") 'reftex-citation)
  )

(add-hook 'org-mode-hook 'org-mode-reftex-setup)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; word count mode
;; How to use:
;; 1). M-+ (word-count-mode) toggles word-count mode.
;; 2). M-[space] (word-count-set-area) sets area for counting words.
;; 3). M-x word-count-set-region sets region or paragraph for counting words.
;; 4). M-x word-count-set-marker sets marker for counting words.
(setq load-path (cons (expand-file-name "/var/opt/emacs/elisp/") load-path))
(autoload 'word-count-mode "word-count"
  "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; change way status line shows up
(require 'uniquify)
(setq uniqueify-buffer-name-style 'reverse)

;; useful latex macros
(fset 'mu
   "\\(\\mu\\)")
(fset 'cel
   "^{\\circ}\\mathrm{C}")


;; Develop and keep personal snippets under ~/.emacs.d/mysnippets
(setq yas/root-directory "/home/dailykm/.emacs.d/mysnippets/")

;; Load the snippets
(yas/load-directory yas/root-directory)

;; ;; mu4e email
;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")

;; (require 'mu4e)
;; (require 'starttls)
;; (require 'smtpmail)

;; (setq
;;  mu4e-maildir       "/home/dailykm/Maildir/nih_local/"   ;; top-level Maildir
;;  mu4e-sent-folder   "/Sent Items"       ;; where do i keep sent mail?
;;  mu4e-drafts-folder "/Drafts"     ;; where do i keep half-written mail?
;;  mu4e-trash-folder  "/Trash"     ;; where do i move deleted mail?
 
;;  ;; smtp mail setting
;;  message-send-mail-function 'smtpmail-send-it
;;  smtpmail-default-smtp-server "smtp.nih.gov"
;;  smtpmail-smtp-server "smtp.nih.gov"

;;  smtpmail-debug-info t 
;;  smtpmail-debug-verb t
 
;;  user-full-name "[Kenneth Daily]"
;;  user-mail-address "dailykm@mail.nih.gov"
 
;;  starttls-use-gnutls nil
;;  smtpmail-smtp-service 465
;;  smtpmail-stream-type nil

;;  ;; program to get mail; alternatives are 'fetchmail', 'getmail'
;;  ;; isync or your own shellscript. called when 'U' is pressed in
;;  ;; main view
;;  mu4e-get-mail-command "offlineimap"
;;  mail-user-agent 'mu4e-user-agent
;; )

;; marmalade package manager
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

; ------------
;; Setup Ergoemacs
; ------------
(add-to-list 'load-path "/var/opt/emacs/elisp/ergoemacs-mode")

(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)


;; solarized color themes
;; (color-theme-solarized-dark)
