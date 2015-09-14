
(require 'cl)
(require 'package)

(add-to-list 'package-archives'
	     ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives'
	     ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
	     ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; auto installed package                                                           
(when (not package-archive-contents)
  (package-refresh-contents))

;; setting default package to be installed                                          
(defvar my-default-packages '(expand-region
			      ;;                              evil
			      go-mode
                              auto-complete
			      go-autocomplete
                              yasnippet
                              autopair
                              markdown-mode
                              xcscope
                              ace-jump-mode
			      go-eldoc
			      helm
			      pos-tip
			      popup
			      fuzzy
			      dired-details+
			      jedi
			      
                              ))
(dolist (p my-default-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; normal useful variable set                                                       
;; normal useful variable set                                                       
(setq dotfiles-dir "~/.emacs.d");;这个我是在.emacs.d/init.el里定义的                
(setq autoload-file (concat dotfiles-dir "/loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "/elpa"))
(setq custom-file (concat dotfiles-dir "/custom.el"))

(provide 'auto-package)
