(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages (quote (geiser))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load /usr/share/emacs/site-lisp/haskell-mode/haskell.el)

(defun anti-tab-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'geiser-mode-hook 'anti-tab-hook)

(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  (setq c-basic-offset 4
	tab-width 4
	indent-tabs-mode t
	comment-style 'multi-line)
  (c-set-offset 'case-label c-basic-offset)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(column-number-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
(global-whitespace-mode 1)

(setq-default
 whitespace-style (remove 'lines whitespace-style))
