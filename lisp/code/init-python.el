;;; init-python.el --- Python Special configuration

;;; Commentary:
;; lsp-pyright python lsp

;;; Code:
(use-package python
  :defer t
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode))

(use-package lsp-pyright
  :ensure t
  :config
  :hook
  (python-mode . (lambda ()
		  (require 'lsp-pyright)
		  (lsp-deferred))))

(provide 'init-python)

;;; init-python.el ends here
