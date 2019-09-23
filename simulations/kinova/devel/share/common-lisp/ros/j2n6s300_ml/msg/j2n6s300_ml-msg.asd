
(cl:in-package :asdf)

(defsystem "j2n6s300_ml-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "JointOdom" :depends-on ("_package_JointOdom"))
    (:file "_package_JointOdom" :depends-on ("_package"))
  ))