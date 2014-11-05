(setq load-path (cons (expand-file-name "~/.emacs.d/") load-path))
(setq load-path (cons (expand-file-name "~/.emacs.d/php-mode") load-path))
(setq load-path (cons (expand-file-name "~/.emacs.d/mmm-mode") load-path))
(require 'php-mode)
(require 'mmm-mode)

(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class nil "\\.php3?\\'" 'html-php)
(mmm-add-classes
 '((html-php
    :submode php-mode
    :front "<\\?\\(php\\)?"
    :back "\\?>")))
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php3?\\'" . html-mode))


(show-paren-mode t)
(tooltip-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(display-time-mode -1)
(auto-compression-mode -1)
(iswitchb-mode t)


(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
'(progn
(color-theme-initialize)
(color-theme-charcoal-black)))


(set-face-attribute 'default nil :font "Monaco-10")

(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
      (if (equal 'fullboth current-value)
        (if (boundp 'old-fullscreen) old-fullscreen nil)
        (progn (setq old-fullscreen current-value)
          'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
