;;; MacOS settings
(when (eq system-type 'darwin)
  (set-frame-font "Operator Mono Light 16")
  (setq mac-option-modifier 'meta
	mac-command-modifier 'hyper)
  )

(provide 'platform-specific)
