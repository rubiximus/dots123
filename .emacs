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
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" default)))
 '(package-selected-packages
   (quote
	(paredit magit haskell-mode geiser dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack")))))

(global-set-key (kbd "C-x g") 'magit-status)

(defun my-geiser-hook ()
  (setq indent-tabs-mode nil)
  (paredit-mode))
(add-hook 'geiser-mode-hook 'my-geiser-hook)

(defun my-c-mode-common-hook ()
  (c-set-style "linux")
  (setq c-basic-offset 4
		tab-width 4
		indent-tabs-mode t
		comment-style 'multi-line)
  (c-set-offset 'case-label c-basic-offset))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(set 'haskell-mode-hook '(interactive-haskell-mode))
(setq haskell-process-args-ghci
      '("-ferror-spans" "-fshow-loaded-modules"))
(setq haskell-process-args-cabal-repl
      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))
(setq haskell-process-args-stack-ghci
      '("--ghci-options=-ferror-spans -fshow-loaded-modules"
		"--no-build" "--no-load"))
(setq haskell-process-args-cabal-new-repl
      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))

;; TODO: remove this
;;(setq magit-process-password-prompt-regexps '("^\r?\\(Enter \\)?[Pp]assphrase\\( for \\(RSA \\)?key '.*'\\)?: ?$" "^\\(Enter \\)?[Pp]assword\\( for '\\(https?://\\)?\\(?99:.*\\)'\\)?: ?$" "^.*'s password: ?$" "^Yubikey for .*: ?$" "^Enter PIN for .*: ?$"))

(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)
(global-whitespace-mode 1)
(tool-bar-mode -1)

(setq-default
 whitespace-style (remove 'lines whitespace-style)
 tab-width 4)
(setq sentence-end-double-space nil)
