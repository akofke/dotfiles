;;; MacOS settings
(when (eq system-type 'darwin)
  (set-frame-font "Source Code Pro Light 14")
  (setq mac-option-modifier 'meta
	mac-command-modifier 'hyper)
  )

(provide 'platform-specific)
