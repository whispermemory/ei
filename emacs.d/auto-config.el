;;------------------------------mode------------------------------

(helm-mode)
(autopair-global-mode)
(ido-mode)
(global-linum-mode)
(evil-mode)


;;------------------------------settings------------------------------


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes nil)
 '(custom-safe-themes (quote ("3c44eedd72c5ec5d1664e9fb828cc2f6caaa434c6cb929f454e02e8a272bbbe0" "da094437b48c936dcc342acf1a76a3b93cb818a7186360fe3f55d54588aeb453" default)))
 '(fringe-mode 0 nil (fringe))
 '(markdown-command "pandoc -s -c ~/.emacs.d/style.css --toc --highlight-style espresso -N --self-contained --data-dir=~/.emacs.d/")
 '(markdown-enable-math t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(tool-bar-mode nil))
(set-default-font "consolas 15")
(setq-default line-spacing 6)
(setq default-frame-alist 
	  '((height . 63) (width . 180)(alpha .96 96) (top . 60) (left . 180) (tool-bar-lines . 0))) 
(setq inhibit-startup-message t) 
(set 'yes-or-no-p 'y-or-n-p)
(setq linum-format "|-%d-|")

(setq ac-quick-help-prefer-pos-tip t)   ;default is
(ac-config-default)
(setq ac-quick-help-prefer-pos-tip t)   ;default is
;;(add-to-list 'ac-dictionary-directories
;;                          "~/.emacs.d/")
(ac-config-default)
(add-hook 'before-save-hook 'gofmt-before-save)

;;molokai theme load
(defun load-molo-theme ()
  (interactive)
 ;; (require 'molokai-theme) 
  (load "~/.emacs.d/elpa/color-theme-molokai/molokai-theme.el"))


;;------------------------------key-map------------------------------
(global-set-key "\C-cl" 'load-molo-theme)
(global-set-key (kbd "C-^") 'er/expand-region)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(provide 'auto-config)
