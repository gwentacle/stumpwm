;; Copyright (C) 2006-2008 Martin Bishop, Ivy Foster
;;
;;  This file is part of stumpwm.
;;
;; stumpwm is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; stumpwm is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this software; see the file COPYING.  If not, see
;; <http://www.gnu.org/licenses/>.

;; Commentary:
;;
;; This file contains version information.
;;
;; Code:

(in-package :stumpwm)

(export '(*version* version))

(defparameter *version*
  #.(concatenate
     'string
     (let* ((sys (asdf:find-system :stumpwm))
            (git-dir (probe-path (asdf:system-relative-pathname sys ".git"))))
       (if git-dir
           (string-trim '(#\Newline)
                        (run-shell-command
                         (format nil "GIT_DIR=~a git describe" git-dir) t))
           (asdf:component-version sys)))
  " Compiled On "
  (format-expand *time-format-string-alist*
                 *time-format-string-default*)
  " using"
  #+clisp " CLISP"
  #+sbcl " SBCL"
  #+cmucl " CMUCL"
  #+ccl " CCL"
  #+ecl " ECL"
  #+abcl " ABCL"
  #+scl " SCL"
  #+gcl " GCL"
  #+openmcl " OpenMCL"
  #+cormanlisp " Corman Lisp"
  #+lispworks " LispWorks"
  #+allegro " Allegro"
  #+lucid " LCL"
  #-(or clisp sbcl cmucl ccl ecl abcl openmcl cormanlisp lispworks allegro scl gcl lucid) " unknown Lisp"))

(defcommand version () ()
"Print version information and compilation date."
  (message *version*))

;; End of file
