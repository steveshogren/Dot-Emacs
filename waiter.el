
(defun second-wait (seconds)
  (message "-----   3   -----")
  (sleep-for 1)
  (message "-----   2   -----")
  (sleep-for 1)
  (message "-----   1   -----")
  (sleep-for 1)
  (message "----- start -----")
  (sleep-for seconds)
  (message "STOP"))
(defun wait-looper (count)
  (second-wait 7)
  (sleep-for 4)
  (if (= 10 count)
      nil
    (wait-looper (+ 1 count))))
(defun start-wait ()
  (interactive)
  (wait-looper 1)
  (message "----- DONE! -----"))
(global-set-key (kbd "C-<f9>") 'start-wait)


