;;anaconda-mode
;; (require 'anaconda-mode)
;; (require 'lsp-mode)
;; (require 'lsp-python)

;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (after-load 'company
;;   (add-hook 'python-mode-hook
;;             (lambda () (sanityinc/local-push-company-backend #'(company-anaconda
;;                                                            company-etags
;;                                                            company-dabbrev-code)))))


;; (after-load 'python
;;   (add-hook 'python-mode-hook #'lsp-python-enable)
;;   (after-load 'company
;;     (add-hook 'python-mode-hook (lambda ()
;;                                   (sanityinc/local-push-company-backend 'company-lsp)))))

;; (lsp-define-stdio-client
;;  ;; This can be a symbol of your choosing. It will be used as a the
;;  ;; prefix for a dynamically generated function "-enable"; in this
;;  ;; case: lsp-prog-major-mode-enable
;;  lsp-prog-major-mode
;;  "language-id"
;;  ;; This will be used to report a project's root directory to the LSP
;;  ;; server.
;;  (lambda () default-directory)
;;  ;; This is the command to start the LSP server. It may either be a
;;  ;; string containing the path of the command, or a list wherein the
;;  ;; car is a string containing the path of the command, and the cdr
;;  ;; are arguments to that command.
;;  '("/my/lsp/server" "and" "args"))

(provide 'wdq-init-python-mode)
