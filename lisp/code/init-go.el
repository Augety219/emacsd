;;; init-go.el --- GoLang Special configuration

;;; Commentary:
;; go-mode golang 模块

;;; Code:
(use-package go-mode
  :ensure t)

(add-hook 'go-mode-hook #'lsp-deferred)

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'init-go)
;;; init-go.el ends here
