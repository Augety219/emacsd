;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:
(let ((minver "25.1"))
    (when (version< emacs-version minver)
          (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
    (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
            (init-gc-cons-threshold (* 128 1024 1024)))
    (setq gc-cons-threshold init-gc-cons-threshold)
      (add-hook 'emacs-startup-hook
		            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径

(require 'package)
(setq package-archives
      '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(unless (bound-and-true-p package--initialized)
    (package-initialize))

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 加载基础配置
(use-package init-basic)
;; 加载package
(use-package init-package)
;; 加载ui
(use-package init-ui)
;; 加载coding
(use-package init-coding)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages '(use-package))
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((use-package) (use-package)))
 '(warning-suppress-types '((use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack Nerd Font Mono" :foundry "SRC" :slant normal :weight normal :height 173 :width normal)))))

;;; init.el ends here
