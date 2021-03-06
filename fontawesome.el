;;; fontawesome.el --- fontawesome utility

;; Copyright (C) 2014 by Syohei YOSHIDA

;; Author: Syohei YOSHIDA <syohex@gmail.com>
;; URL: https://github.com/syohex/emacs-fontawesome
;; Version: 0.01
;; Package-Requires: ((cl-lib "0.5"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'fontawesome-data)

(defsubst fontawesome--font-names ()
  (cl-loop for (name . _code) in fontawesome-alist
           collect name))

(defun fontawesome--completing-read ()
  (let ((comp-func (if ido-mode 'ido-completing-read 'completing-read)))
    (funcall comp-func "Font name: " (fontawesome--font-names) nil t)))

;;;###autoload
(defun fontawesome (font-name)
  "Return fontawesome code point"
  (interactive
   (list (fontawesome--completing-read)))
  (assoc-default font-name fontawesome-alist))

(provide 'fontawesome)

;;; fontawesome.el ends here
