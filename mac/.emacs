;;; $BF|K\8l4D6-@_Dj(B
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8) ;; $B%G%U%)%k%H(B
(modify-coding-system-alist 'file "\\.rb\\'" 'utf-8)                ;; Ruby
(modify-coding-system-alist 'file "\\.erb\\'" 'utf-8)               ;; html.erb
(modify-coding-system-alist 'file "\\.html?\\'" 'utf-8)             ;; html, htm
(modify-coding-system-alist 'file "\\.js\\'" 'utf-8)                ;; Java Script
(modify-coding-system-alist 'file "\\.less\\'" 'utf-8)              ;; Less
(modify-coding-system-alist 'file "\\.scss\\'" 'utf-8)              ;; SASS
(modify-coding-system-alist 'file "\\.coffee\\'" 'utf-8)            ;; Coffee Script
(modify-coding-system-alist 'file "\\.java\\'" 'utf-8)              ;; Java
(modify-coding-system-alist 'file "\\.clj\\'" 'utf-8)               ;; Clojure
(modify-coding-system-alist 'file "\\.\\(scala\\|sbt\\)\\'" 'utf-8) ;; Scala
(modify-coding-system-alist 'file "\\.[eh]rl\\'" 'utf-8)            ;; Erlang
(modify-coding-system-alist 'file "\\.exs?\\'" 'utf-8)              ;; Elixir


;; IME
;;(setq default-input-method "W32-IME")
;;(setq-default w32-ime-mode-line-state-indicator "[--]")
;;(setq w32-ime-mode-line-state-indicator-list '("[--]" "[$B$"(B]" "[--]"))
;;(w32-ime-initialize)
;; $BF|K\8lF~NO;~$K%+!<%=%k$N?'$rJQ$($k@_Dj(B ($B?'$OE,59JQ$($F$/$@$5$$(B)
(add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "coral4")))
(add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "black")))

;; $B%_%K%P%C%U%!$K0\F0$7$?:]$O:G=i$KF|K\8lF~NO$,L58z$J>uBV$K$9$k(B
(add-hook 'minibuffer-setup-hook 'deactivate-input-method)

;; isearch $B$K0\9T$7$?:]$KF|K\8lF~NO$rL58z$K$9$k(B
(add-hook 'isearch-mode-hook '(lambda ()
                                (deactivate-input-method)
                                (setq w32-ime-composition-window (minibuffer-window))))
(add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

;; helm $B;HMQCf$KF|K\8lF~NO$rL58z$K$9$k(B
(advice-add 'helm :around '(lambda (orig-fun &rest args)
                             (let ((select-window-functions nil)
                                   (w32-ime-composition-window (minibuffer-window)))
                               (deactivate-input-method)
                               (apply orig-fun args))))

;;; $B1Q?t%b!<%I4XO"(B
;;; emacs $B5/F0;~$O1Q?t%b!<%I$+$i;O$a$k(B
;(add-hook 'after-init-hook '(lambda() (interactive)(set-input-method "japanese-ascii")) )
;;; minibuffer $BFb$O1Q?t%b!<%I$K$9$k(B
;(add-hook 'minibuffer-setup-hook '(lambda() (interactive)(set-input-method "japanese-ascii")) )
;;; [migemo]isearch $B$N$H$-(B IME $B$r1Q?t%b!<%I$K$9$k(B
										;(add-hook 'isearch-mode-hook '(lambda() (interactive)(set-input-method "japanese-ascii")) )

;;; $B%^%&%9%+!<%=%k$r>C$9@_Dj(B
(setq w32-hide-mouse-on-key t)
(setq w32-hide-mouse-timeout 5000)

;; $B%S!<%W2;$r>C$9(B
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; TAB$B$O%9%Z!<%9#48DJ,(B
(setq-default tab-width 4)
(setq-default default-tab-width 4)

;;; $B=i4|%U%l!<%`$N@_Dj(B
(setq default-frame-alist
      (append (list
            '(foreground-color . "black")
            '(background-color . "LemonChiffon")
;;            '(background-color . "gray")
            '(border-color . "black")
            '(mouse-color . "white")
            '(cursor-color . "black")
;;            '(font . "-*-Menlo-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
            '(width . 180)
            '(height . 50)
            '(top . 0)
            '(left . 0)
            )
            default-frame-alist))

;;;; $B%m!<%I%Q%9(B
(add-to-list 'load-path "~/emacs/lisp/")

;; 
(setq default-directory "~/") 
(setq command-line-default-directory "~/")

;; melpa$B%Q%C%1!<%8(B
(require 'package) ;; You might already have this line
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.org/packages/"))
;(when (< emacs-major-version 24)
;  ;; For important compatibility libraries like cl-lib
;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;(package-initialize) ;; You might already have this line
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))


;;; $B%$%s%G%s%H%O%$%i%$%H(B
;(add-to-list 'load-path "~/emacs/lisp/Highlight-Indentation-for-Emacs")
;(require 'highlight-indentation)
;(setq highlight-indentation-offset 2)
;;(set-face-background 'highlight-indentation-face "ivory1")
;(set-face-background 'highlight-indentation-face "LightYellow1")
;(set-face-background 'highlight-indentation-current-column-face "AntiqueWhite1")
;
;; highlight-indentation-mode $B$,8F$P$l$?$i(B highlight-indentation-current-column-mode $B$b<B9T$9$k(B
;(add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

; c-mode, d-mode $B6&DL(B
(defun my-c-mode-common-init ()
  (c-set-style "linux")
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  ;(c-toggle-auto-hungry-state 1)  ;; $B%;%s%F%s%9$N=*N;$G$"$k(B ';' $B$rF~NO$7$?$i!"<+F02~9T(B+$B%$%s%G%s%H(B
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)  ;; RET $B%-!<$G<+F02~9T(B+$B%$%s%G%s%H(B
  (local-unset-key "\C-c\C-w") ; subword-mode$B@Z$jBX$($rL58z2=(B
  (gtags-mode 1)
  (add-to-list 'ac-sources 'ac-source-gtags)
)

(add-hook 'c-mode-hook 'my-c-mode-on-init)
(add-hook 'c++-mode-hook 'my-c-mode-common-init)

;; d-mode
(autoload 'd-mode "d-mode"
  "Major mode for editing D code." t)
(setq auto-mode-alist (cons '( "\\.d\\'" . d-mode ) auto-mode-alist ))
;(autoload 'dlint-minor-mode "dlint" nil t)
;(add-hook 'd-mode-hook (lambda () (dlint-minor-mode 1)))

(add-hook 'd-mode-hook 'my-c-mode-hook)

;; .ino $B$r(Bc-mode$B$G3+$/(B
(setq auto-mode-alist
      (append '(("\\.ino$" . c++-mode))
              auto-mode-alist))

;;; yaml-mode
;(require 'yaml-mode)
;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;(add-hook 'yaml-mode-hook 'highlight-indentation-mode)

;; web-mode
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq-default tab-width 2 indent-tabs-mode nil)
  (setq web-mode-html-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (highlight-indentation-mode)
)
(add-hook 'web-mode-hook 'my-web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
; $B?'$N@_Dj(B
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-symbol-face ((t (:foreground "blue")))))
; $B%O%$%i%$%H?'$N@_Dj(B
(eval-after-load "web-mode"
  '(set-face-background 'web-mode-current-element-highlight-face "blue"))
; $B%-!<$,$+$V$k$N$GL58z2=(B
(define-key web-mode-map (kbd "\C-c\C-w") nil)

;; ruby-mode
(add-hook 'ruby-mode-hook 'highlight-indentation-mode)

;; gnu global
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-t" 'gtags-pop-stack)
         ))

;; ;;; $B0u:~$N@_Dj(B
;; ;; $B$3$N@_Dj$G(B M-x print-buffer RET $B$J$I$G$N0u:~$,$G$-$k$h$&$K$J$j$^$9(B
;; ;;
;; ;;  notepad $B$KM?$($k%Q%i%a!<%?$N7A<0$N@_Dj(B
;; (define-process-argument-editing "notepad"
;;   (lambda (x) (general-process-argument-editing-function x nil t)))
;;
;; (defun w32-print-region (start end
;;                   &optional lpr-prog delete-text buf display
;;                   &rest rest)
;;   (interactive)
;;   (let ((tmpfile (convert-standard-filename (buffer-name)))
;;        (w32-start-process-show-window t)
;;        ;; $B$b$7!"(Bdos $BAk$,8+$($F$$$d$J?M$O>e5-$N(B `t' $B$r(B `nil' $B$K$7$^$9(B
;;        ;; $B$?$@$7!"(B`nil' $B$K$9$k$H(B Meadow $B$,8G$^$k4D6-$b$"$k$+$b$7$l$^$;$s(B
;;        (coding-system-for-write w32-system-coding-system))
;;     (while (string-match "[/\\]" tmpfile)
;;      (setq tmpfile (replace-match "_" t nil tmpfile)))
;;     (setq tmpfile (expand-file-name (concat "_" tmpfile "_")
;;                        temporary-file-directory))
;;     (write-region start end tmpfile nil 'nomsg)
;;     (call-process "notepad" nil nil nil "/p" tmpfile)
;;     (and (file-readable-p tmpfile) (file-writable-p tmpfile)
;;         (delete-file tmpfile))))
;;
;; (setq print-region-function 'w32-print-region)

;; ;;; fakecygpty $B$N@_Dj(B
;; ;; $B$3$N@_Dj$G(B cygwin $B$N2>A[C<Kv$rMW5a$9$k%W%m%0%i%`$r(B Meadow $B$+$i(B
;; ;; $B07$($k$h$&$K$J$j$^$9(B
;; (setq mw32-process-wrapper-alist
;;       '(("/\\(bash\\|tcsh\\|svn\\|ssh\\|gpg[esvk]?\\)\\.exe" .
;;       (nil . ("fakecygpty.exe" . set-process-connection-type-pty)))))

;; $BD9$$9T$N@^$jJV$7$r(B t:$B$7$J$$(B nil:$B$9$k(B
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;; buffer list $BI=<(8e%+!<%=%k$r$=$3$K0\F0$9$k(B
(define-key ctl-x-map "\C-b" 'buffer-menu)

;; $B"-$r2!$7$F$b2~9T$7$J$$$h$&$K$9$k(B
(setq next-line-add-newlines nil)

;; $B>o$K3g8L$NBP1~$r%O%$%i%$%H$9$k(B
(show-paren-mode t)

;; $BD9$$%Q%9L>$N%U%!%$%k%*!<%W%s$G%P%C%U%!%j%5%$%:(B
;;(resize-minibuffer-mode t)

;; $B<+F0?eJ?%9%/%m!<%k(B
;;(hscroll-global-mode t)
;;(hscroll-mode t)

;; $B%+!<%=%k9TI=<((B
(line-number-mode t)

;; $B%+!<%=%k7e?tI=<((B
(column-number-mode t)

;; C-k$B$G2~9T$b%+%C%H(B
(setq kill-whole-line t)

;; $B=PNO$,E~Ce$9$k$?$S$K=PNO$KDI=>$9$k$h$&$K%3%s%Q%$%k%P%C%U%!$r>o$K%9%/%m!<%k(B
(setq compilation-scroll-output t)

;; $B%o!<%I%3%T!<(B
(defun kill-ring-save-current-word ()
"Save current word to kill ring as if killed, but don't kill it."
(interactive)
(kill-new (current-word)))
(global-set-key "\C-c\C-w" 'kill-ring-save-current-word)

;; $B%+%9%?%^%$%:%3%s%Q%$%k(B
(defun yrecompile()
  (interactive)
  (if(and
      (not(string=(buffer-name) "*compilation*"))
      (get-buffer "*compilation*"))
      (progn
        (switch-to-buffer-other-window "*compilation*")
        (command-execute 'compile)
        (command-execute 'other-window)
        )
    (progn
      (command-execute 'compile)
      (end-of-buffer-other-window "*compilation*")
      )
    )
)

;; $B%3%a%s%H(B
;; $BJ#?t6H%3%a%s%H(B
(defun insert-comment-function ()
  (interactive)
  (insert "/**
*
*/"))

;; $B#19T%3%a%s%H(B
(defun insert-line-comment-function ()
  (interactive)
  (insert "///< @todo ")
)

;;; auto-complete
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;(ac-config-default)
;(global-auto-complete-mode t)
;(setq ac-use-menu-map t) ;; $B%a%K%e!<I=<(;~$N$_$KM-8z$K$J$k%-!<%^%C%W(B(ac-menu-map)$B$rMxMQ(B
;
;(setq ac-use-quick-help t)
;(setq ac-quick-help-delay 0.5)
;(setq ac-menu-height 20)
;(setq ac-auto-show-menu 0.1)    ;; 0.1$BIC8e$K<+F0E*$KI=<((B
;(ac-set-trigger-key "TAB")
;(add-to-list 'ac-ignores "/")
;(add-to-list 'ac-ignores "//")
;(add-to-list 'ac-ignores "///")
;(add-to-list 'ac-ignores "////")
;(define-key ac-mode-map (kbd "C-/") 'auto-complete)

;;; grep-edit
;(require 'grep-edit)

;;; migemo
(require 'migemo)
;;;for mac
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-coding-system 'utf-8-unix)
;; for Windows
;(setq migemo-command "cmigemo")
;(setq migemo-dictionary "Z:/home/lisp/cmigemo-default-win64/dict/cp932")
;(setq migemo-dictionary "Z:/home/lisp/cmigemo-default-win64/dict/utf-8/migemo-dict")
;(setq migemo-options '("-q" "--emacs" "-i" "\a"))
;(setq migemo-options '("-q" "--emacs"))
;(setq migemo-coding-system 'cp932-unix)
;(setq migemo-coding-system 'utf-8-unix)
;; migemo common
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)

;; helm
(helm-mode +1)
; $B%U%!%$%kMzNr(B
(global-set-key [f7] 'helm-recentf)

;(define-key helm-map (kbd "<tab>") 'helm-next-source)
(define-key helm-map (kbd "<tab>") 'dabbrev-expand)
(define-key helm-map (kbd "<right>") 'helm-select-action)
; TAB$B$GJd40(B
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

;; helm-swoop
(add-to-list 'load-path "~/.emacs.d/elisp/helm-swoop")
(require 'helm-swoop)
(global-set-key (kbd "C-S-s") 'helm-swoop)
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-swoop-map (kbd "C-a") 'helm-maybe-exit-minibuffer)

;; savehist
(savehist-mode 1)

;;; projectile-rails
;(require 'projectile)
;(projectile-global-mode)
;
;(require 'projectile-rails)
;(add-hook 'projectile-mode-hook 'projectile-rails-on)
;
;(define-key projectile-rails-mode-map (kbd "C-c ; m") 'projectile-rails-find-model)
;(define-key projectile-rails-mode-map (kbd "C-c ; c") 'projectile-rails-find-controller)
;(define-key projectile-rails-mode-map (kbd "C-c ; v") 'projectile-rails-find-view)
;(define-key projectile-rails-mode-map (kbd "C-c ; f m") 'projectile-rails-find-current-model)
;(define-key projectile-rails-mode-map (kbd "C-c ; f c") 'projectile-rails-find-current-controller)
;(define-key projectile-rails-mode-map (kbd "C-c ; f v") 'projectile-rails-find-current-view)
;(define-key projectile-rails-mode-map (kbd "C-c ; f s") 'projectile-rails-find-current-spec)
;;(define-key projectile-rails-mode-map (kbd "C-c ; c") 'projectile-rails-console)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; $B%-!<%P%$%s%I(B
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mac$B%P%C%/%9%i%C%7%e%-!<BP:v(B
(define-key global-map [?\(J\(B] [?\\])
(define-key global-map [?\C-(J\(B] [?\C-\\])
(define-key global-map [?\M-(J\(B] [?\M-\\])
(define-key global-map [?\C-\M-(J\(B] [?\C-\M-\\])

;; C-h$B$r%P%C%/%9%Z!<%9$KJQ99(B
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

(global-set-key [f2] 'buffer-menu)
(global-set-key [f8] 'goto-line)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)

;; $B%&%#%s%I%&0\F0(B
(global-set-key [f4] 'other-window)
(global-set-key [S-f4] 'previous-multiframe-window)

;;$BI=<(NN0h3HBg(B
(global-set-key [C-up] '(lambda() (interactive)(enlarge-window -1)) )
(global-set-key [C-down] '(lambda() (interactive)(enlarge-window +1)) )
(global-set-key [C-left] '(lambda() (interactive)(enlarge-window-horizontally -1)))
(global-set-key [C-right] '(lambda() (interactive)(enlarge-window-horizontally +1)))

;; $B%(%i!<%8%c%s%W(B
(global-set-key [C-f10] 'next-error)
(global-set-key [C-f11] 'previous-error)

;; $BBP1~$9$k3g8L$K%8%c%s%W(B
(global-set-key "\M-m" 'blink-matching-open)

;; $B>.J8;z2=%+%9%?%^%$%:!JD>A0$N%o!<%I$rBP>]$K$9$k!K(B
(global-unset-key "\M-l")
(global-set-key "\M-l" (lambda() (interactive)(downcase-word -1)))
;; $BBgJ8;z2=%+%9%?%^%$%:!JD>A0$N%o!<%I$rBP>]$K$9$k!K(B
(global-unset-key "\M-u")
(global-set-key "\M-u" (lambda() (interactive)(upcase-word -1)))

;; $B%-!<%\!<%I%^%/%m(B
(global-set-key [f9] 'start-kbd-macro)
(global-set-key [f10] 'end-kbd-macro)
(global-set-key [f12] 'call-last-kbd-macro)

;; $B%U%!%$%k$N:FFI$_9~$_(B
(global-set-key [C-S-f3] 'revert-buffer)

;; $B%3%s%Q%$%k(B
(global-set-key [C-f9] 'yrecompile)
(global-set-key [C-M-f9] 'compile)

;; $B:G6a;H$C$?%U%!%$%k(B
(require 'recentf)
(setq recentf-max-saved-items 50)            ;; recentf $B$KJ]B8$9$k%U%!%$%k$N?t(B
(recentf-mode 1)
;;(global-set-key [f7] 'recentf-open-files)

;; $B%3%a%s%H(B
(global-set-key "\M-]" 'insert-comment-function)
(global-set-key "\M-[" 'insert-line-comment-function)

;; $B%U%)%s%H%5%$%:JQ99%-!<(B
; C-+ $B$G3HBg(B
(global-set-key [(control ?\;)] (lambda () (interactive) (text-scale-increase 1)))
; C-- $B$G=L>.(B
(global-set-key [(control ?-)] (lambda () (interactive) (text-scale-decrease 1)))
; C-0 $B$G%G%U%)%k%H$KLa$9(B
(global-set-key [(control ?0)] (lambda () (interactive) (text-scale-increase 0)))

;;;
;;; end of file
;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(package-selected-packages (quote (multi-web-mode wgrep helm-swoop migemo helm)))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
