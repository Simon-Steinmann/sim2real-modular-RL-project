
(cl:in-package :asdf)

(defsystem "j2n6s300_ml-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "tfQuery" :depends-on ("_package_tfQuery"))
    (:file "_package_tfQuery" :depends-on ("_package"))
  ))