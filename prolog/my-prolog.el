(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing prolog programs." t)
(setq prolog-system 'swi) ; prolog-system below for possible values
(setq auto-mode-alist (append '(("\\.prl$" . prolog-mode)) auto-mode-alist))

