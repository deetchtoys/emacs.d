(require 'lsp-mode)
(require 'lsp-imenu)
(require 'lsp-ui)

(lsp-define-stdio-client
 ;; This can be a symbol of your choosing. It will be used as a the
 ;; prefix for a dynamically generated function "-enable"; in this
 ;; case: lsp-prog-major-mode-enable
 lsp-prog-major-mode
 "language-id"
 ;; This will be used to report a project's root directory to the LSP
 ;; server.
 (lambda () default-directory)
 ;; This is the command to start the LSP server. It may either be a
 ;; string containing the path of the command, or a list wherein the
 ;; car is a string containing the path of the command, and the cdr
 ;; are arguments to that command.
 '("/my/lsp/server" "and" "args"))

;; Here we'll add the function that was dynamically generated by the
;; call to lsp-define-stdio-client to the major-mode hook of the
;; language we want to run it under.
;;
;; This function will turn lsp-mode on and call the command given to
;; start the LSP server.
(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;; To enable flycheck-mode for a particular LSP client, add the following
;; (add-hook 'XXXXX-mode-hook 'flycheck-mode)

;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; (lsp-ui-peek-jump-backward)
;; (lsp-ui-peek-jump-forward)

;; (lsp-ui-peek-find-workspace-symbol "pattern 0")
;; ;; If the server supports custom cross references
;; (lsp-ui-peek-find-custom 'base "$cquery/base")

(defun my-set-projectile-root ()
  (when lsp--cur-workspace
    (setq projectile-project-root (lsp--workspace-root lsp--cur-workspace))))
(add-hook 'lsp-before-open-hook #'my-set-projectile-root)

(provide 'wdq-init-lsp-mode)
