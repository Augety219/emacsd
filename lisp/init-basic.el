;;; init-basic.el --- Basic configuration

;;; Commentary:

;;; Code:
;; 编码
(prefer-coding-system 'utf-8)
;; 用y/n来代替yes/no
(defalias 'yes-or-no-p 'y-or-n-p)
;; 自动补全括号
(electric-pair-mode t)
;; 编程模式下，光标在括号上时高亮另一个括号
(add-hook 'prog-mode-hook #'show-paren-mode)
;; 在 Mode line 上显示列号
(column-number-mode t)
;; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(global-auto-revert-mode t)
;; 选中文本后输入文本会替换文本
(delete-selection-mode t)
;; 编程模式下，可以折叠代码块
(add-hook 'prog-mode-hook #'hs-minor-mode)
;; 关闭文件自动备份
(setq make-backup-files nil)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭滚动条
(scroll-bar-mode -1)
;; 关闭启动页
(setq inhibit-startup-screen t)
;; 在 Window 显示行号
(global-display-line-numbers-mode 1)
;; 显示相对行号
;;(setq display-line-numbers-type 'relative)
(setq gc-cons-threshold (* 50 1000 1000))
(setq gc-cons-threshold (* 2 1000 1000))
;; 透明
(set-frame-parameter nil 'alpha 0.9)
;; 高亮
(global-font-lock-mode t)

(provide 'init-basic)

;;; init-basic.el ends here
