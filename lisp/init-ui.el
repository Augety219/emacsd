;;; init-ui.el --- Appearance configuration

;;; Commentary:
;; all-the-icons 图标
;; ef-themes 主题
;; dashboard 启动页
;; 

;;; Code:
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package ef-themes
  :ensure t
  :config
  (load-theme 'ef-night t)
  (add-hook 'dired-mode-hook 'diredfl-mode)
  (add-hook 'dirvish-directory-view-mode-hook 'diredfl-mode)
  (with-eval-after-load 'diredfl
    (set-face-attribute 'diredfl-dir-name nil :bold t)))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-startup-banner '"~/.emacs.d/icon/7p9p8y.png")
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items '((recents  . 5)
			  (bookmarks . 5)
			  (projects . 10)))  
  (dashboard-setup-startup-hook))



(provide 'init-ui)

;;; init-ui.el ends here
