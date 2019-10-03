(cl:defpackage :claw.support
  (:use :cl)
  (:export #:register-c2ffi-program
           #:find-c2ffi-program))
(cl:in-package :claw.support)

(defvar *c2ffi-list* nil)

(defvar *default-c2ffi-program*
  #-windows "c2ffi"
  #+windows "c2ffi.exe")


(defun register-c2ffi-program (path)
  (pushnew (namestring path) *c2ffi-list* :test #'string=))


(defun find-c2ffi-program ()
  (or (first *c2ffi-list*) *default-c2ffi-program*))
