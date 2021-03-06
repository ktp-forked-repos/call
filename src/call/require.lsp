;;; call/require.lsp --- Required Features

;; Copyright (C) CALL Team and Contributors

;; This file is part of CALL (Common AutoLISP Library)
;; Released under the MIT license


;; # Required Features
;; ===================

(or ll-features (progn ; include guard

;; ### ll-features
;; **ll-features**: [listp]
;;
;; TODO

;; Normalizes feature path
(defun ll--feature-normalize (feature)
  ;; TODO: Replace "\\" with "/"
  ;; TODO: Replace multiple "/" with single "/"
  feature)

;; ### ll-featurep
;; (**ll-featurep** _feature_: [ll-stringp]): [ll-boolean]
;;
;; TODO
(defun ll-featurep (feature)
  ;; (if (wcmatch (getvar "PLATFORM") "*Windows*")
  ;;     (setq feature (strcase feature)))
  (and (member (ll--feature-normalize feature) ll-features)))

;; ### ll-provide
;; (**ll-provide** _feature_: [ll-stringp]): [listp]
;;
;; TODO
(defun ll-provide (feature)
  (or (ll-featurep feature)
      (setq ll-features (cons (ll--feature-normalize feature) ll-features))))

;; ### ll-require
;; (**ll-require** _feature_: [ll-stringp]): [ll-anyp]
;;
;; TODO
(defun ll-require (feature)
  (or (ll-featurep feature)
      (load feature)))

)) ; end of (or ll-features (progn ; include guard


(ll-provide "call/require")

;; Exports
(list
  ;; ll-features
  ;; ll--feature-normalize
  ll-featurep
  ll-provide
  ll-require
  )
