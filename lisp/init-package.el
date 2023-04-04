;;; init-package.el --- Package configuration

;;; Commentary:
;; counsel ivy swiper 增强补全系统、部分常用命令、搜索功能
;; amx 命令历史
;; ace-window 增强多窗口管理
;; mwim 快速移动光标到行首/行尾
;; which-key 快捷键提示
;; marginalia 为 Emacs minibuffer 中的选项添加注解

;;; Code:
(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package amx
  :ensure t
  :init (amx-mode))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package which-key
  :ensure t
  :init (which-key-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle)))

(use-package lsp-ivy
  :ensure t
  :after (lsp-mode))

(use-package diredfl
  :ensure t)

(use-package vertico
  :ensure t)

(use-package orderless
  :ensure t)

(use-package consult
  :ensure t)

(use-package dirvish
  :ensure t
  :config
  (dirvish-override-dired-mode)
  (dirvish-peek-mode)
  (dirvish-side-follow-mode)
  (setq dirvish-attributes
	'(vc-state file-size git-msg subtree-state all-the-icons collapse file-time))
  (setq dirvish-mode-line-format '(:left (sort symlink) :right (vc-info yank index)))
  (setq dirvish-header-line-height '(25 . 35))
  (setq dirvish-side-width 38)
  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dired-listing-switches
	"-l --almost-all --human-readable --group-directories-first --no-group")
  (bind-keys ("C-c f" . dirvish-fd)
           :map 'dirvish-mode-map
           ;; left click for expand/collapse dir or open file
           ("<mouse-1>" . dirvish-subtree-toggle-or-open)
           ;; middle click for opening file / entering dir in other window
           ("<mouse-2>" . dired-mouse-find-file-other-window)
           ;; right click for opening file / entering dir
           ("<mouse-3>" . dired-mouse-find-file)
           ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
           ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
           ([remap dired-do-copy] . dirvish-yank-menu)
           ("?"   . dirvish-dispatch)
           ("q"   . dirvish-quit)
           ("a"   . dirvish-quick-access)
           ("f"   . dirvish-file-info-menu)
           ("x"   . dired-do-delete)
           ("X"   . dired-do-flagged-delete)
           ("y"   . dirvish-yank-menu)
           ("s"   . dirvish-quicksort)
           ("TAB" . dirvish-subtree-toggle)
           ("M-t" . dirvish-layout-toggle)
           ("M-b" . dirvish-history-go-backward)
           ("M-f" . dirvish-history-go-forward)
           ("M-n" . dirvish-narrow)
           ("M-m" . dirvish-mark-menu)
           ("M-s" . dirvish-setup-menu)
           ("M-e" . dirvish-emerge-menu))
  :bind
  (("C-c t" . dirvish)))


(provide 'init-package)

;;; init-package.el ends here
