;; Display a buffer in rot13.
;; Copyright (C) 1988 Free Software Foundation, Inc.

;; This file is part of GNU Emacs.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 1, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.


;; Written by Howard Gayle.  See case-table.el for details.

;; This hack is mainly to show off the char table stuff.

(defvar rot13-display-table
  (let ((table (make-display-table))
	(i 0))
    (while (< i 26)
      (aset table (+ i ?a) (make-rope (+ (% (+ i 13) 26) ?a)))
      (aset table (+ i ?A) (make-rope (+ (% (+ i 13) 26) ?A)))
      (setq i (1+ i)))
    table)
  "Char table for rot 13 display.")

(defun rot13-other-window ()
  "Display current buffer in rot 13 in another window."
  (interactive)
  (let ((w (display-buffer (current-buffer) t)))
    (set-window-display-table w rot13-display-table)))

(provide 'rot13)
