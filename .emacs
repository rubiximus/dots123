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
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("93f9654f91d31e9a9ec6ea2fcffcfcab38353a9588673f2b750e591f704cd633" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (monokai-theme haskell-mode geiser)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack")))))

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

(set 'haskell-mode-hook '(interactive-haskell-mode))

(column-number-mode 1)
(show-paren-mode 1)
(global-linum-mode 1)
(global-whitespace-mode 1)

(setq-default
 whitespace-style (remove 'lines whitespace-style))
