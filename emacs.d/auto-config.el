;;;;;;(set-frame-position (selected-frame)  20 0)
(custom-set-variables
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote ("3c44eedd72c5ec5d1664e9fb828cc2f6caaa434c6cb929f454e02e8a272bbbe0" "da094437b48c936dcc342acf1a76a3b93cb818a7186360fe3f55d54588aeb453" default)))
 '(face-font-family-alternatives (quote (("Sans Serif" "helv" "helvetica" "arial" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(fringe-mode 0 nil (fringe))
 '(markdown-command "pandoc -s -c ~/.emacs.d/style.css --toc --highlight-style espresso -N --self-contained --data-dir=~/.emacs.d/")
 '(markdown-enable-math t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))

(setq-default make-backup-files nil)
;; 不生成临时文件

(add-to-list 'load-path "~/.emacs.d/elpa/evil")
(require 'evil)
(evil-mode 1)
(setq-default line-spacing 6)
(setq default-frame-alist 
      '((height . 50) (width . 100)(alpha .99 99) (top . 30)  (tool-bar-lines . 0))) 
(set-cursor-color "yellow")

(load "/home/dove/src/gotools/tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook 'go-oracle-mode)
;;(setq-default make-backup-files nil)
;;;;禁用启动信息
;;(setq inhibit-startup-message t) 
;;;;
;;;;;;语法高亮:
;;(global-font-lock-mode t) 
;;;以 y/n 替代 yes/no
;;(set 'yes-or-no-p 'y-or-n-p)
;;(show-paren-mode t) 
;;;;
;;;;;;光标靠近鼠标指针时，让鼠标指针自动让开
;;(mouse-avoidance-mode 'animate) 
;;;;
;;;;;;不要在鼠标光标出插入
;;(setq mouse-yank-at-point t) 
;;;;
;;;;;;高亮显示选中的区域
;;(transient-mark-mode t) 
;;;;
;;;;;;支持emacs和外部程序的拷贝粘贴
;;(setq x-select-enable-clipboard t) 
;;;;
;;;;;;在标题栏提示当前位置
;;(setq frame-title-format "%b")
;;(setq default-tab-width 4)
;;;;
;;;;;;光标显示为一竖线
;;(setq-default cursor-type 'bar)
;;
;;(defun my-go-mode-hook()
;;  (defun shrink-compile-window()
;;	"shrink compile window, avoid compile window occupy 1/2 hight of whole window"
;;	(interactive)
;;	;;(select-window (get-buffer-window "*compilation*"))
;;	(setq compiled_buffer_name (buffer-name (current-buffer)))
;;	(switch-to-buffer-other-window "*compilation*")
;;	(if (< (/ (frame-height) 3) (window-height))
;;		(shrink-window (/ (window-height) 2)))
;;	(switch-to-buffer-other-window compiled_buffer_name)
;;	)
;;  (local-set-key [f9] '(lambda ()
;;						 (interactive)
;;						 (setq compile_filename (buffer-name (current-buffer)))
;;						 (setq cmdstr (concat "go run "  compile_filename))
;;						 (compile cmdstr)
;;						 (shrink-compile-window)
;;						 ))
;;
;;  )
;;
;;(add-hook 'go-mode-hook 'my-go-mode-hook)
;;
(defun add-code-review-note ()
  "Add note for current file and line number"
  (interactive)
  (let ((file-name (buffer-file-name))
	(file-line (line-number-at-pos)))
    (switch-to-buffer-other-window (get-buffer-create "NOTES"))
    (goto-char (point-min))
    (when (not (search-forward "-*- mode:compilation-shell-minor"
			       nil t))
      (compilation-shell-minor-mode 1)
      (insert "-*- mode:compilation-shell-minor -*-\n\n"))
    (goto-char (point-max))
    (if (/= (current-column) 0)
	(newline))
    (insert file-name ":" (number-to-string file-line) ": ")))

(global-set-key (kbd "\C-x \C-n") 'add-code-review-note)
;;;;
;;;;-----------------------------------------------------------
;;;;ace-jump  more fast
;;										;C-c space
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

;;expand-region
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
;;;;; from emacs rocks
(global-set-key (kbd "C-^") 'er/expand-region)
(global-set-key (kbd "C-@") 'evil-force-normal-state)

(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode")
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;;
(defun save-and-indent ()
  "add indent while save buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max)) nil)
  
  (save-buffer))
;;
;;(global-set-key (kbd "C-x C-s") 'save-and-indent) 
(autoload 'gist "gist" "gist" t)
;;;
(global-set-key (kbd "C-x g f") 'find-grep)
;;
(ido-mode 1)
(defun bufflist()
  "as the name says"
  (interactive)
  (list-buffers)
  (other-window 1)
  (delete-other-windows)
  (isearch-forward)
  )

(defun del-blist()
  "as the name says"
  (interactive)
  (kill-buffer (buffer-name (current-buffer)))
  )


(global-set-key (kbd "C-x C-b") 'bufflist)
(global-set-key (kbd "C-x k") 'del-blist)
;;
(set-default-font "consolas 13")
(defun make-another-frame-with-specified-font ()
  "as the name says"
  (interactive)
  (make-frame-command)
  (set-frame-font "consolas-17")
  (set-cursor-color "green")
  )
(global-set-key (kbd "C-x 5 2") 'make-another-frame-with-specified-font)

(add-to-list 'load-path "~/.emacs.d/elpa/xcscope")
;;(setq exec-path (cons "/usr/local/bin" exec-path))  
(autoload 'xcscope ""  ""  t)
(setq cscope-do-not-update-database t)
(require 'xcscope)

(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

;;;;;;------------------------------auto-complete
;;;;;;auto-complete 的函数 API 提示功能是怎么配出来的
;;;;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20141103.105/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150618.1949/dict")
(ac-config-default)

;;tab
(setq ac-dwim t)
;;;;
;;;;;;go-autocomplete
;;;;(add-to-list 'load-path  "~/.emacs.d/elpa/go-autocomplete-20150404.2351/")
;;;;(require 'go-autocomplete)
;;;;
;;;;;;------------------------------go eldoc----------------------------
;;;;;;(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20150503.258/")
;;;;;;(require 'go-eldoc)
;;;;;;(add-hook 'go-mode-hook 'go-eldoc-setup)
;;;;
;;;;;;------------------------------go fmt------------------------------
(setq linum-format "|-%d-| ")
(global-linum-mode)
(cscope-minor-mode )
(defun load-molo-theme ()
  (interactive)
  (require 'molokai-theme) 
  (load "~/.emacs.d/elpa/color-theme-molokai/molokai-theme.el"))

(global-set-key  "\C-cl" 'load-molo-theme)
(setq default-directory "/home/dove")

(autopair-global-mode) ;; enable autopair in all buffers
(provide 'auto-config)
(helm-mode 1)

(define-key global-map "\C-css"  'cscope-find-this-symbol)
;;(define-key global-map [(control f3)]  'cscope-set-initial-directory)
;;(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map "\C-csd"  'cscope-find-global-definition)
(define-key global-map "\C-csc" 'cscope-find-functions-calling-this-function)
(define-key global-map "\C-csC" 'cscope-find-called-functions)
;;(define-key global-map [(control f7)]
;;  'cscope-find-global-definition-no-prompting)
;;(define-key global-map [(control f8)]  'cscope-pop-mark)
;;(define-key global-map [(control f9)]  'cscope-next-symbol)
;;(define-key global-map [(control f10)] 'cscope-next-file)
;;(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map "\C-csp" 'cscope-prev-file)
;;(define-key global-map [(meta f9)]  'cscope-display-buffer)
;;(defin-ekey global-map [(meta f10)] 'cscope-display-buffer-toggle)
;;					;
(global-set-key (kbd "\C-n") 'next-line)
;;(global-set-key (kbd "\C-x \C-n") 'add-code-review-note)
(require 'dired-details+)
(global-set-key (kbd "\C-r") 'isearch-backward)
(global-set-key (kbd "\C-cd") 'godoc-at-point)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'before-save-hook 'gofmt-before-save)
