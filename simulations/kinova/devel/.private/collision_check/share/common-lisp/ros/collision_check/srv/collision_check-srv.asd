
(cl:in-package :asdf)

(defsystem "collision_check-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "CheckJointStateCollision" :depends-on ("_package_CheckJointStateCollision"))
    (:file "_package_CheckJointStateCollision" :depends-on ("_package"))
  ))